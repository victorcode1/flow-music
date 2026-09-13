-- Explicit client denial avoids ambiguous no-policy diagnostics.
create policy cloud_request_budget_deny_clients
  on streambeat_private.cloud_request_budget for all to anon,authenticated
  using (false) with check (false);

-- Small daily batch. The function never removes a backup without a confirmed
-- notice, a full grace period, and recent server verification of expired access.
create extension if not exists pg_cron;
select cron.schedule(
  'streambeat-guarded-cloud-retention',
  '15 7 * * *',
  'select streambeat_private.purge_expired_cloud_backups();'
);
