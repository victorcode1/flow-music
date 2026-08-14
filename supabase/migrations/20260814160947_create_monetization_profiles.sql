create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text not null,
  display_name text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  last_seen_at timestamptz not null default now()
);

comment on table public.profiles is
  'Portable application profile keyed by the Supabase Auth user id.';

alter table public.profiles enable row level security;

revoke all on table public.profiles from anon, authenticated;
grant select, insert, update on table public.profiles to authenticated;
grant all on table public.profiles to service_role;

create policy "profiles_select_own"
  on public.profiles
  for select
  to authenticated
  using ((select auth.uid()) = id);

create policy "profiles_insert_own"
  on public.profiles
  for insert
  to authenticated
  with check ((select auth.uid()) = id);

create policy "profiles_update_own"
  on public.profiles
  for update
  to authenticated
  using ((select auth.uid()) = id)
  with check ((select auth.uid()) = id);

create table public.subscription_entitlements (
  user_id uuid primary key references auth.users(id) on delete cascade,
  entitlement_id text not null,
  product_id text,
  status text not null check (
    status in ('active', 'cancelled', 'expired', 'billing_issue', 'paused')
  ),
  will_renew boolean not null default false,
  expires_at timestamptz,
  store text,
  environment text,
  original_transaction_id text,
  last_event_id text not null,
  updated_at timestamptz not null default now()
);

comment on table public.subscription_entitlements is
  'Read model written only by the verified RevenueCat webhook.';

alter table public.subscription_entitlements enable row level security;

revoke all on table public.subscription_entitlements from anon, authenticated;
grant select on table public.subscription_entitlements to authenticated;
grant all on table public.subscription_entitlements to service_role;

create policy "subscription_entitlements_select_own"
  on public.subscription_entitlements
  for select
  to authenticated
  using ((select auth.uid()) = user_id);

create table public.revenuecat_webhook_events (
  event_id text primary key,
  event_type text not null,
  received_at timestamptz not null default now()
);

comment on table public.revenuecat_webhook_events is
  'Idempotency ledger for RevenueCat webhooks. Never exposed to clients.';

alter table public.revenuecat_webhook_events enable row level security;

revoke all on table public.revenuecat_webhook_events
  from anon, authenticated;
grant all on table public.revenuecat_webhook_events to service_role;
