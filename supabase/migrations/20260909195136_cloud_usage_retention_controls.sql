-- Bound cloud usage without trusting a client supplied account or paid flag.
create schema if not exists streambeat_private;
revoke all on schema streambeat_private from public, anon, authenticated;
grant usage on schema streambeat_private to authenticated, service_role;

create table streambeat_private.cloud_request_budget (
  user_id uuid not null references auth.users(id) on delete cascade,
  action text not null check (action in ('read','write','manage','export','verify')),
  hour_started timestamptz not null default date_trunc('hour', now()),
  day_started timestamptz not null default date_trunc('day', now()),
  hour_count integer not null default 0,
  day_count integer not null default 0,
  primary key(user_id, action)
);
alter table streambeat_private.cloud_request_budget enable row level security;
revoke all on streambeat_private.cloud_request_budget from public, anon, authenticated;
grant all on streambeat_private.cloud_request_budget to service_role;

create function streambeat_private.consume_budget(p_user_id uuid, p_action text)
returns boolean language plpgsql security invoker set search_path = '' as $$
declare hourly integer; daily integer; accepted boolean;
begin
  case p_action
    when 'read' then hourly:=120; daily:=1000;
    when 'write' then hourly:=60; daily:=300;
    when 'manage' then hourly:=30; daily:=120;
    when 'export' then hourly:=3; daily:=10;
    when 'verify' then hourly:=30; daily:=120;
    else raise exception 'Unknown cloud operation';
  end case;
  insert into streambeat_private.cloud_request_budget as b
    (user_id,action,hour_count,day_count)
  values (p_user_id,p_action,1,1)
  on conflict (user_id,action) do update set
    hour_started=date_trunc('hour',now()), day_started=date_trunc('day',now()),
    hour_count=case when b.hour_started=date_trunc('hour',now()) then b.hour_count+1 else 1 end,
    day_count=case when b.day_started=date_trunc('day',now()) then b.day_count+1 else 1 end
  where (b.hour_started<date_trunc('hour',now()) or b.hour_count<hourly)
    and (b.day_started<date_trunc('day',now()) or b.day_count<daily)
  returning true into accepted;
  return coalesce(accepted,false);
end $$;
revoke all on function streambeat_private.consume_budget(uuid,text) from public,anon,authenticated;
grant execute on function streambeat_private.consume_budget(uuid,text) to service_role;

create function public.consume_cloud_verification_budget(p_user_id uuid)
returns boolean language sql security invoker set search_path = '' as $$
  select streambeat_private.consume_budget(p_user_id,'verify');
$$;
revoke all on function public.consume_cloud_verification_budget(uuid) from public,anon,authenticated;
grant execute on function public.consume_cloud_verification_budget(uuid) to service_role;

alter table public.cloud_subscription_access
  add column last_paid_until timestamptz,
  add column retention_notice_at timestamptz;
update public.cloud_subscription_access set last_paid_until=paid_until where paid_until is not null;

create or replace function public.record_cloud_subscription_access(
  p_user_id uuid,p_product_id text,p_paid_until timestamptz,p_verified_at timestamptz
) returns void language sql security invoker set search_path = '' as $$
  insert into public.cloud_subscription_access
    (user_id,product_id,paid_until,access_until,verified_at,last_paid_until)
  values (p_user_id,p_product_id,p_paid_until,
    case when p_paid_until>p_verified_at then least(p_paid_until,p_verified_at+interval '24 hours') else null end,
    p_verified_at,p_paid_until)
  on conflict(user_id) do update set
    product_id=excluded.product_id,paid_until=excluded.paid_until,
    access_until=excluded.access_until,verified_at=excluded.verified_at,
    last_paid_until=greatest(cloud_subscription_access.last_paid_until,excluded.last_paid_until),
    retention_notice_at=case when excluded.paid_until>excluded.verified_at then null else cloud_subscription_access.retention_notice_at end
  where excluded.verified_at>=cloud_subscription_access.verified_at;
$$;

-- Only this authenticated RPC can touch library snapshots. A direct REST,
-- GraphQL or older-client request cannot skip the server quotas.
revoke select,insert,update,delete on public.user_data_sync from authenticated;

create function streambeat_private.cloud_library(p_action text,p_payload jsonb)
returns jsonb language plpgsql security definer set search_path = '' as $$
declare
  uid uuid := auth.uid();
  access public.cloud_subscription_access%rowtype;
  snapshot public.user_data_sync%rowtype;
  f jsonb; p jsonb; prefs jsonb; content jsonb; bucket text;
  bytes integer; delete_after timestamptz;
begin
  if uid is null or coalesce((auth.jwt()->>'is_anonymous')::boolean,false) then
    raise insufficient_privilege using message='Account required';
  end if;
  if p_action not in ('read','write','status','acknowledge_retention','export') then
    return jsonb_build_object('error','invalid_operation');
  end if;
  -- Serializes concurrent partial writes and retention checks for this account.
  perform pg_advisory_xact_lock(hashtextextended(uid::text, 0));
  select * into access from public.cloud_subscription_access where user_id=uid for update;
  if p_action in ('read','write') and not coalesce(
    access.access_until>now() and access.paid_until>now(),false
  ) then
    return jsonb_build_object('error','monthly_subscription_required');
  end if;
  bucket:=case when p_action in ('status','acknowledge_retention') then 'manage' else p_action end;
  if not streambeat_private.consume_budget(uid,bucket) then
    return jsonb_build_object('error','rate_limited');
  end if;
  select * into snapshot from public.user_data_sync where user_id=uid for update;
  if p_action='acknowledge_retention' and snapshot.user_id is not null
      and access.last_paid_until<=now() and access.retention_notice_at is null then
    update public.cloud_subscription_access set retention_notice_at=now()
      where user_id=uid returning * into access;
  end if;
  if p_action='write' then
    if p_payload is null or jsonb_typeof(p_payload)<>'object' or
      exists(select 1 from jsonb_object_keys(p_payload) k where k not in ('favorites','playlists','preferences')) then
      return jsonb_build_object('error','invalid_payload');
    end if;
    f:=coalesce(p_payload->'favorites',snapshot.favorites,'[]'::jsonb);
    p:=coalesce(p_payload->'playlists',snapshot.playlists,'[]'::jsonb);
    prefs:=coalesce(p_payload->'preferences',snapshot.preferences,'{}'::jsonb);
    if jsonb_typeof(f)<>'array' or jsonb_typeof(p)<>'array' or jsonb_typeof(prefs)<>'object' then
      return jsonb_build_object('error','invalid_payload');
    end if;
    bytes:=octet_length(f::text)+octet_length(p::text)+octet_length(prefs::text);
    if bytes>2097152 or octet_length(f::text)>1048576 or octet_length(prefs::text)>16384
      or jsonb_array_length(f)>500 or jsonb_array_length(p)>200 then
      return jsonb_build_object('error','quota_exceeded');
    end if;
    insert into public.user_data_sync
      (user_id,favorites,playlists,preferences,favorites_updated_at,playlists_updated_at,preferences_updated_at,updated_at)
    values (uid,f,p,prefs,
      case when p_payload?'favorites' then now() else coalesce(snapshot.favorites_updated_at,now()) end,
      case when p_payload?'playlists' then now() else coalesce(snapshot.playlists_updated_at,now()) end,
      case when p_payload?'preferences' then now() else coalesce(snapshot.preferences_updated_at,now()) end,now())
    on conflict(user_id) do update set
      favorites=excluded.favorites,playlists=excluded.playlists,preferences=excluded.preferences,
      favorites_updated_at=excluded.favorites_updated_at,playlists_updated_at=excluded.playlists_updated_at,
      preferences_updated_at=excluded.preferences_updated_at,updated_at=excluded.updated_at
    returning * into snapshot;
  end if;
  if snapshot.user_id is not null then
    bytes:=octet_length(snapshot.favorites::text)+octet_length(snapshot.playlists::text)+octet_length(snapshot.preferences::text);
  else bytes:=0; end if;
  if access.last_paid_until<=now() and access.retention_notice_at is not null then
    delete_after:=greatest(access.last_paid_until+interval '90 days',access.retention_notice_at+interval '30 days');
  end if;
  -- Read-only export is an explicit portability exception, not cloud sync.
  if p_action in ('read','export') and snapshot.user_id is not null then
    content:=jsonb_build_object('favorites',snapshot.favorites,'playlists',snapshot.playlists,'preferences',snapshot.preferences);
  end if;
  return jsonb_build_object(
    'snapshot',content,'has_backup',snapshot.user_id is not null,
    'updated_at',snapshot.updated_at,'bytes_used',bytes,
    'max_bytes',2097152,'max_favorites',500,'max_playlists',200,
    'paid_until',access.last_paid_until,'delete_after',delete_after,
    'notice_required',snapshot.user_id is not null and access.last_paid_until<=now() and access.retention_notice_at is null,
    'retention_days',90,'notice_days',30);
end $$;
revoke all on function streambeat_private.cloud_library(text,jsonb) from public,anon;
grant execute on function streambeat_private.cloud_library(text,jsonb) to authenticated;
create function public.cloud_library(p_action text,p_payload jsonb default '{}'::jsonb)
returns jsonb language sql security invoker set search_path = '' as $$
  select streambeat_private.cloud_library(p_action,p_payload);
$$;
revoke all on function public.cloud_library(text,jsonb) from public,anon;
grant execute on function public.cloud_library(text,jsonb) to authenticated;

-- Never deletes an account, local data, or a backup without a delivered notice.
-- Recent server verification is mandatory, so an outage cannot delete a renewal.
create function streambeat_private.purge_expired_cloud_backups()
returns bigint language plpgsql security invoker set search_path = '' as $$
declare deleted_count bigint;
begin
  with candidates as (
    select s.user_id from public.user_data_sync s join public.cloud_subscription_access a using(user_id)
    where a.last_paid_until+interval '90 days'<=now()
      and a.retention_notice_at+interval '30 days'<=now()
      and a.verified_at>=now()-interval '24 hours'
      and coalesce(a.paid_until, '-infinity'::timestamptz)<=now()
      and coalesce(a.access_until, '-infinity'::timestamptz)<=now()
    order by s.user_id limit 100 for update of a,s skip locked
  )
  delete from public.user_data_sync s using candidates c where s.user_id=c.user_id;
  get diagnostics deleted_count=row_count;
  return deleted_count;
end $$;
revoke all on function streambeat_private.purge_expired_cloud_backups() from public,anon,authenticated;
grant execute on function streambeat_private.purge_expired_cloud_backups() to service_role;
