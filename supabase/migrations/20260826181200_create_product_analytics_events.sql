create table public.product_analytics_events (
  id bigint generated always as identity primary key,
  occurred_at timestamptz not null default now(),
  event_name text not null
    check (event_name ~ '^[a-z][a-z0-9_]{1,63}$'),
  anonymous_id uuid not null,
  user_id uuid default auth.uid()
    references auth.users(id) on delete set null,
  session_id uuid not null,
  platform text not null
    check (platform in ('android', 'ios', 'web', 'macos', 'windows', 'linux', 'other')),
  app_version text not null,
  locale text not null,
  properties jsonb not null default '{}'::jsonb,
  check (jsonb_typeof(properties) = 'object'),
  check (octet_length(properties::text) <= 4096)
);

comment on table public.product_analytics_events is
  'Privacy-conscious product funnel events. Clients can insert but cannot read events.';

create index product_analytics_events_occurred_at_idx
  on public.product_analytics_events (occurred_at desc);
create index product_analytics_events_name_occurred_at_idx
  on public.product_analytics_events (event_name, occurred_at desc);
create index product_analytics_events_anonymous_occurred_at_idx
  on public.product_analytics_events (anonymous_id, occurred_at desc);

alter table public.product_analytics_events enable row level security;

revoke all on table public.product_analytics_events from anon, authenticated;
grant insert on table public.product_analytics_events to anon, authenticated;
grant all on table public.product_analytics_events to service_role;
grant usage, select on sequence public.product_analytics_events_id_seq
  to anon, authenticated;
grant all on sequence public.product_analytics_events_id_seq to service_role;

create policy "anonymous clients can insert anonymous events"
on public.product_analytics_events
for insert
to anon
with check (user_id is null);

create policy "authenticated clients can insert their own events"
on public.product_analytics_events
for insert
to authenticated
with check (user_id = (select auth.uid()));
