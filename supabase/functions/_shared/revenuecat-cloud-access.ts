export type CustomerInfo = {
  request_date_ms?: number;
  request_date?: string;
  subscriber?: {
    subscriptions?: Record<string, {
      expires_date?: string | null;
      is_sandbox?: boolean;
      period_type?: string;
      refunded_at?: string | null;
      store?: string;
      unsubscribe_detected_at?: string | null;
      billing_issues_detected_at?: string | null;
      grace_period_expires_date?: string | null;
    }>;
  };
};

export function paidCloudPeriod(info: CustomerInfo, now: number) {
  if (!info.subscriber || typeof info.subscriber !== "object") {
    throw new Error("Invalid RevenueCat customer response");
  }
  let productId: string | null = null;
  let paidUntil: string | null = null;
  let latest = now;
  for (const [id, subscription] of Object.entries(info.subscriber.subscriptions ?? {})) {
    if (id !== "remove_ads_monthly" && !id.startsWith("remove_ads_monthly:")) continue;
    // A canceled renewal or a failed next renewal does not erase time already
    // paid for. Never extend cloud access into a free trial or unpaid grace.
    if (!subscription || subscription.is_sandbox !== false ||
      !["normal", "intro"].includes(subscription.period_type?.toLowerCase() ?? "") ||
      !["play_store", "app_store", "mac_app_store"].includes(subscription.store ?? "") ||
      subscription.refunded_at != null) continue;
    const expires = Date.parse(subscription.expires_date ?? "");
    if (Number.isFinite(expires) && expires > latest) {
      latest = expires;
      productId = id;
      paidUntil = new Date(expires).toISOString();
    }
  }
  return { productId, paidUntil };
}

export function customerIdsForEvent(event: Record<string, unknown>): string[] {
  if (event.type === "TEST") return [];
  const ids = [
    event.app_user_id, event.original_app_user_id,
    ...(Array.isArray(event.aliases) ? event.aliases : []),
    ...(Array.isArray(event.transferred_from) ? event.transferred_from : []),
    ...(Array.isArray(event.transferred_to) ? event.transferred_to : []),
  ];
  return [...new Set(ids.filter((id): id is string =>
    typeof id === "string" &&
    /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(id)))];
}
