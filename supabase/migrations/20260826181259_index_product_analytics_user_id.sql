create index product_analytics_events_user_occurred_at_idx
  on public.product_analytics_events (user_id, occurred_at desc)
  where user_id is not null;
