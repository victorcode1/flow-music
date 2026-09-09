-- Synchronize portable user data across authenticated devices.
create table public.user_data_sync (
  user_id uuid primary key references auth.users(id) on delete cascade,
  favorites jsonb not null default '[]'::jsonb,
  playlists jsonb not null default '[]'::jsonb,
  preferences jsonb not null default '{}'::jsonb,
  favorites_updated_at timestamptz not null default now(),
  playlists_updated_at timestamptz not null default now(),
  preferences_updated_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint user_data_sync_favorites_array
    check (jsonb_typeof(favorites) = 'array'),
  constraint user_data_sync_playlists_array
    check (jsonb_typeof(playlists) = 'array'),
  constraint user_data_sync_preferences_object
    check (jsonb_typeof(preferences) = 'object'),
  constraint user_data_sync_favorites_size
    check (octet_length(favorites::text) <= 1048576),
  constraint user_data_sync_playlists_size
    check (octet_length(playlists::text) <= 4194304),
  constraint user_data_sync_preferences_size
    check (octet_length(preferences::text) <= 16384)
);

comment on table public.user_data_sync is
  'Per-account snapshot for favorites, radio playlists, and portable preferences.';

alter table public.user_data_sync enable row level security;

revoke all on table public.user_data_sync from anon, authenticated;
grant select, insert, update, delete on table public.user_data_sync
  to authenticated;
grant all on table public.user_data_sync to service_role;

create policy "user_data_sync_select_own"
  on public.user_data_sync
  for select
  to authenticated
  using ((select auth.uid()) = user_id);

create policy "user_data_sync_insert_own"
  on public.user_data_sync
  for insert
  to authenticated
  with check ((select auth.uid()) = user_id);

create policy "user_data_sync_update_own"
  on public.user_data_sync
  for update
  to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create policy "user_data_sync_delete_own"
  on public.user_data_sync
  for delete
  to authenticated
  using ((select auth.uid()) = user_id);
