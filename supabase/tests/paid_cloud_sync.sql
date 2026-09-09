-- Regression suite for paid access, quotas, isolation and retention.
-- All synthetic users and schema/data changes are rolled back.
begin;
select set_config('test.cloud_user_a',gen_random_uuid()::text,true);
select set_config('test.cloud_user_b',gen_random_uuid()::text,true);
insert into auth.users(id,aud,role) values
(current_setting('test.cloud_user_a')::uuid,'authenticated','authenticated'),
(current_setting('test.cloud_user_b')::uuid,'authenticated','authenticated');
select public.record_cloud_subscription_access(current_setting('test.cloud_user_a')::uuid,
 'remove_ads_monthly:monthly-v1',now()+interval '30 days',now());
set local role authenticated;
select set_config('request.jwt.claims',json_build_object('sub',current_setting('test.cloud_user_a'),'role','authenticated')::text,true);
do $$
declare result jsonb;
begin
 result:=public.cloud_library('write','{"favorites":[{"stationuuid":"one"}],"playlists":[{"id":"list-a"}]}');
 if result?'error' then raise exception 'Paid write failed: %',result; end if;
 perform public.cloud_library('write','{"favorites":[]}');
 result:=public.cloud_library('read');
 if result->'snapshot'->'playlists'->0->>'id'<>'list-a' then raise exception 'Partial save erased playlist'; end if;
 begin
  perform * from public.user_data_sync;
  raise exception 'Direct read bypasses quotas';
 exception when insufficient_privilege then null; end;
 begin
  insert into public.user_data_sync(user_id) values(auth.uid());
  raise exception 'Direct write bypasses quotas';
 exception when insufficient_privilege then null; end;
 begin
  perform public.record_cloud_subscription_access(auth.uid(),'remove_ads_monthly',now()+interval '1 year',now());
  raise exception 'Client granted itself cloud';
 exception when insufficient_privilege then null; end;
 begin
  perform public.consume_cloud_verification_budget(auth.uid());
  raise exception 'Client can reset verification budgets';
 exception when insufficient_privilege then null; end;
 result:=public.cloud_library('write',jsonb_build_object('user_id',current_setting('test.cloud_user_b')));
 if result->>'error'<>'invalid_payload' then raise exception 'Cross account payload accepted'; end if;
 result:=public.cloud_library('write',jsonb_build_object('favorites',(select jsonb_agg(jsonb_build_object('stationuuid',i)) from generate_series(1,501)i)));
 if result->>'error'<>'quota_exceeded' then raise exception 'Favorites quota not enforced'; end if;
 result:=public.cloud_library('write',jsonb_build_object('playlists',jsonb_build_array(jsonb_build_object('id',repeat('x',2097153)))));
 if result->>'error'<>'quota_exceeded' then raise exception 'Byte quota not enforced'; end if;
 result:=public.cloud_library('read');
 if result->'snapshot'->'playlists'->0->>'id'<>'list-a' then raise exception 'Rejected upload destroyed data'; end if;
end $$;
select set_config('request.jwt.claims',json_build_object('sub',current_setting('test.cloud_user_b'),'role','authenticated','user_metadata',json_build_object('premium',true))::text,true);
do $$ declare result jsonb; begin
 result:=public.cloud_library('read');
 if result->>'error'<>'monthly_subscription_required' then raise exception 'Free user downloaded cloud'; end if;
 result:=public.cloud_library('write','{"favorites":[]}');
 if result->>'error'<>'monthly_subscription_required' then raise exception 'Free user uploaded cloud'; end if;
 result:=public.cloud_library('export');
 if result->'snapshot'<>'null'::jsonb then raise exception 'Other account data exported'; end if;
end $$;
reset role;
-- Enforce per-account counters without allowing client access to the counters.
update streambeat_private.cloud_request_budget set hour_count=60,day_count=60
 where user_id=current_setting('test.cloud_user_a')::uuid and action='write';
set local role authenticated;
select set_config('request.jwt.claims',json_build_object('sub',current_setting('test.cloud_user_a'),'role','authenticated')::text,true);
do $$ begin
 if public.cloud_library('write','{"favorites":[]}')->>'error'<>'rate_limited' then
   raise exception 'Hourly quota bypassed'; end if;
end $$;
reset role;
-- Simulate an expired paid period (not an SDK flag); preserve existing backup.
update public.cloud_subscription_access set last_paid_until=now()-interval '100 days',
 paid_until=null,access_until=null,verified_at=now() where user_id=current_setting('test.cloud_user_a')::uuid;
do $$ begin
 if streambeat_private.purge_expired_cloud_backups()<>0 then raise exception 'Deleted without notice'; end if;
end $$;
set local role authenticated;
do $$ declare result jsonb; begin
 if public.cloud_library('read')->>'error'<>'monthly_subscription_required' then raise exception 'Expired account synced'; end if;
 result:=public.cloud_library('export');
 if result->'snapshot'->'playlists'->0->>'id'<>'list-a' then raise exception 'Expired owner cannot export'; end if;
 result:=public.cloud_library('status');
 if result->>'notice_required'<>'true' then raise exception 'Missing retention notice'; end if;
 result:=public.cloud_library('acknowledge_retention');
 if (result->>'delete_after')::timestamptz<now()+interval '30 days' then raise exception 'Notice grace too short'; end if;
end $$;
reset role;
do $$ begin
 if streambeat_private.purge_expired_cloud_backups()<>0 then raise exception 'Deleted during notice period'; end if;
end $$;
update public.cloud_subscription_access set retention_notice_at=now()-interval '31 days',verified_at=now()-interval '2 days'
 where user_id=current_setting('test.cloud_user_a')::uuid;
do $$ begin
 if streambeat_private.purge_expired_cloud_backups()<>0 then raise exception 'Stale verification deleted backup'; end if;
end $$;
-- Renewal cancels deletion even after an old notice.
select public.record_cloud_subscription_access(current_setting('test.cloud_user_a')::uuid,'remove_ads_monthly',now()+interval '30 days',now());
do $$ begin
 if streambeat_private.purge_expired_cloud_backups()<>0 then raise exception 'Renewed account deleted'; end if;
 if (select retention_notice_at from public.cloud_subscription_access where user_id=current_setting('test.cloud_user_a')::uuid) is not null then
 raise exception 'Renewal did not clear notice'; end if;
end $$;
-- An older verification cannot overwrite a new renewal.
select public.record_cloud_subscription_access(current_setting('test.cloud_user_a')::uuid,null,null,now()-interval '1 day');
do $$ begin
 if not (select paid_until>now() from public.cloud_subscription_access where user_id=current_setting('test.cloud_user_a')::uuid)
 then raise exception 'Out of order response revoked renewal'; end if;
 begin
  perform public.record_cloud_subscription_access(current_setting('test.cloud_user_b')::uuid,'remove_ads_lifetime',now()+interval '1 year',now());
  raise exception 'Lifetime allowed cloud';
 exception when check_violation then null; end;
end $$;
-- An eligible, recently verified expired backup is deleted, not its account.
update public.cloud_subscription_access set last_paid_until=now()-interval '100 days',
 paid_until=null,access_until=null,retention_notice_at=now()-interval '31 days',verified_at=now()
 where user_id=current_setting('test.cloud_user_a')::uuid;
do $$ begin
 if streambeat_private.purge_expired_cloud_backups()<>1 then raise exception 'Eligible backup not cleaned'; end if;
 if not exists(select 1 from auth.users where id=current_setting('test.cloud_user_a')::uuid) then raise exception 'Cleanup deleted auth user'; end if;
end $$;
set local role anon;
do $$ begin
 begin
  perform public.cloud_library('status');
  raise exception 'Anonymous RPC allowed';
 exception when insufficient_privilege then null; end;
end $$;
reset role;
select true as cloud_controls_regressions_passed;
rollback;
