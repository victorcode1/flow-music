-- Separate recurring cloud access from the lifetime ad-removal entitlement.
-- Only server-verified, paid production subscription periods can grant access.
create table public.cloud_subscription_access (
  user_id uuid primary key references auth.users(id) on delete cascade,
  product_id text,
  paid_until timestamptz,
  access_until timestamptz,
  verified_at timestamptz not null,
  constraint cloud_subscription_access_paid_period check (
    access_until is null or (
      product_id is not null and
      split_part(product_id, ':', 1) = 'remove_ads_monthly' and
      paid_until is not null and access_until <= paid_until and
      access_until <= verified_at + interval '24 hours'
    )
  )
);
comment on table public.cloud_subscription_access is
  'Production monthly cloud access verified against RevenueCat by the server. Lifetime and sandbox never grant access.';
alter table public.cloud_subscription_access enable row level security;
revoke all on public.cloud_subscription_access from public, anon, authenticated;
grant select on public.cloud_subscription_access to authenticated;
grant all on public.cloud_subscription_access to service_role;
create policy cloud_subscription_access_select_own
  on public.cloud_subscription_access for select to authenticated
  using ((select auth.uid()) = user_id);

-- Atomic compare-and-update: an older concurrent verification cannot resurrect
-- an expired/refunded/transferred subscription after a more recent response.
create function public.record_cloud_subscription_access(
  p_user_id uuid, p_product_id text, p_paid_until timestamptz,
  p_verified_at timestamptz
) returns void
language sql security invoker set search_path = '' as $$
  insert into public.cloud_subscription_access
    (user_id, product_id, paid_until, access_until, verified_at)
  values (
    p_user_id, p_product_id, p_paid_until,
    case when p_paid_until > p_verified_at then
      least(p_paid_until, p_verified_at + interval '24 hours')
    else null end,
    p_verified_at
  )
  on conflict (user_id) do update set
    product_id = excluded.product_id,
    paid_until = excluded.paid_until,
    access_until = excluded.access_until,
    verified_at = excluded.verified_at
  where excluded.verified_at >= cloud_subscription_access.verified_at;
$$;
revoke all on function public.record_cloud_subscription_access(uuid,text,timestamptz,timestamptz)
  from public, anon, authenticated;
grant execute on function public.record_cloud_subscription_access(uuid,text,timestamptz,timestamptz)
  to service_role;

-- A restrictive policy composes with the existing own-account policies.
-- It protects old clients as well as the new app and covers both reads/writes.
create policy user_data_sync_requires_paid_monthly
  on public.user_data_sync as restrictive for all to authenticated
  using (
    (select auth.uid()) = user_id and exists (
      select 1 from public.cloud_subscription_access a
      where a.user_id = (select auth.uid())
        and a.access_until > now() and a.paid_until > now()
    )
  )
  with check (
    (select auth.uid()) = user_id and exists (
      select 1 from public.cloud_subscription_access a
      where a.user_id = (select auth.uid())
        and a.access_until > now() and a.paid_until > now()
    )
  );
revoke delete on public.user_data_sync from authenticated;
