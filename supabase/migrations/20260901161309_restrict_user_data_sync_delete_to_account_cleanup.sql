-- Account deletion runs through the JWT-protected Edge Function and cascade.
drop policy if exists "user_data_sync_delete_own"
  on public.user_data_sync;

revoke delete on table public.user_data_sync from authenticated;
