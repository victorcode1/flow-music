-- Run inside a transaction and always roll back. Synthetic users only.
begin;
select set_config('test.cloud_user_a', gen_random_uuid()::text, true);
select set_config('test.cloud_user_b', gen_random_uuid()::text, true);
insert into auth.users(id, aud, role)
values (current_setting('test.cloud_user_a')::uuid, 'authenticated', 'authenticated'),
       (current_setting('test.cloud_user_b')::uuid, 'authenticated', 'authenticated');
select public.record_cloud_subscription_access(
  current_setting('test.cloud_user_a')::uuid, 'remove_ads_monthly:monthly-v1',
  now() + interval '30 days', now()
);
insert into public.user_data_sync(user_id)
values(current_setting('test.cloud_user_b')::uuid);

set local role authenticated;
select set_config('request.jwt.claims', json_build_object('sub',current_setting('test.cloud_user_a'),'role','authenticated')::text, true);
insert into public.user_data_sync(user_id, favorites, playlists)
values(current_setting('test.cloud_user_a')::uuid, '[{"stationuuid":"test-favorite"}]', '[{"id":"test-playlist"}]');
do $$
begin
  if (select count(*) from public.user_data_sync) <> 1 then raise exception 'Paid user cannot read own snapshot exclusively'; end if;
  update public.user_data_sync set favorites='[]' where user_id=auth.uid();
  if (select playlists->0->>'id' from public.user_data_sync where user_id=auth.uid()) <> 'test-playlist'
    then raise exception 'Partial favorite save erased playlist'; end if;
  begin
    update public.cloud_subscription_access set paid_until=now()+interval '100 years' where user_id=auth.uid();
    raise exception 'Client forged cloud grant';
  exception when insufficient_privilege then null; end;
  begin
    perform public.record_cloud_subscription_access(auth.uid(),'remove_ads_monthly',now()+interval '1 year',now());
    raise exception 'Client called server-only verification RPC';
  exception when insufficient_privilege then null; end;
  begin
    insert into public.user_data_sync(user_id) values(current_setting('test.cloud_user_b')::uuid)
    on conflict(user_id) do update set favorites='[]';
    raise exception 'Paid user modified another account';
  exception when insufficient_privilege then null; end;
  begin
    delete from public.user_data_sync where user_id=auth.uid();
    raise exception 'Direct client deletion unexpectedly allowed';
  exception when insufficient_privilege then null; end;
end $$;

select set_config('request.jwt.claims', json_build_object('sub',current_setting('test.cloud_user_b'),'role','authenticated',
'user_metadata',json_build_object('premium',true,'subscription','active'))::text,true);
do $$
begin
  if exists(select 1 from public.user_data_sync) then raise exception 'Free user could download a backup'; end if;
  begin
    insert into public.user_data_sync(user_id) values(auth.uid()) on conflict(user_id) do update set favorites='[]';
    raise exception 'Free user could write a backup';
  exception when insufficient_privilege then null; end;
end $$;

reset role;
-- Lifetime product is rejected even from the server's grant RPC.
do $$
begin
  begin
    perform public.record_cloud_subscription_access(current_setting('test.cloud_user_b')::uuid,
      'remove_ads_lifetime',now()+interval '100 years',now());
    raise exception 'Lifetime cloud grant accepted';
  exception when check_violation then null; end;
end $$;

-- Time-based expiry blocks a paid user even if no expiration webhook arrives.
select public.record_cloud_subscription_access(current_setting('test.cloud_user_a')::uuid,
  'remove_ads_monthly',now()-interval '1 second',now()+interval '1 second');
-- Older out-of-order verification cannot restore access.
select public.record_cloud_subscription_access(current_setting('test.cloud_user_a')::uuid,
  'remove_ads_monthly',now()+interval '1 year',now());
set local role authenticated;
select set_config('request.jwt.claims', json_build_object('sub',current_setting('test.cloud_user_a'),'role','authenticated')::text,true);
do $$
begin
  if exists(select 1 from public.user_data_sync) then raise exception 'Expired access remained readable'; end if;
  begin
    insert into public.user_data_sync(user_id) values(auth.uid()) on conflict(user_id) do update set favorites='[]';
    raise exception 'Expired access remained writable';
  exception when insufficient_privilege then null; end;
end $$;
reset role;

-- Renewal recovers the existing backup, without creating a replacement account.
select public.record_cloud_subscription_access(current_setting('test.cloud_user_a')::uuid,
  'remove_ads_monthly',now()+interval '30 days',now()+interval '2 seconds');
set local role authenticated;
do $$
begin
  if (select count(*) from public.user_data_sync) <> 1 then raise exception 'Renewal did not restore own backup access'; end if;
end $$;
reset role;
set local role anon;
do $$
begin
  begin
    perform * from public.user_data_sync;
    raise exception 'Anonymous snapshot access allowed';
  exception when insufficient_privilege then null; end;
end $$;
reset role;
rollback;
