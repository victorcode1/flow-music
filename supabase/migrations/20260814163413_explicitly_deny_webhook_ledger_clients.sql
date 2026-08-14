create policy "revenuecat_webhook_events_deny_clients"
  on public.revenuecat_webhook_events
  for all
  to anon, authenticated
  using (false)
  with check (false);
