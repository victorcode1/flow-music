import { customerIdsForEvent, paidCloudPeriod, type CustomerInfo } from "./revenuecat-cloud-access.ts";

const now = Date.parse("2026-09-09T12:00:00Z");
const expiry = "2026-10-09T12:00:00.000Z";
const paid = { expires_date: expiry, is_sandbox: false, period_type: "normal",
  refunded_at: null, store: "play_store" };
function assert(value: unknown, message = "Assertion failed") { if (!value) throw new Error(message); }
function check(subscriptions: NonNullable<CustomerInfo["subscriber"]>["subscriptions"]) {
  return paidCloudPeriod({ subscriber: { subscriptions } }, now);
}
Deno.test("verified production monthly access survives cancellation until paid expiration", () => {
  for (const extra of [{}, {unsubscribe_detected_at: "2026-09-09"}, {billing_issues_detected_at: "2026-09-09"}]) {
    assert(check({ "remove_ads_monthly:monthly-v1": {...paid, ...extra} }).paidUntil === expiry);
  }
});
Deno.test("free, lifetime, sandbox, trial, refunded, promotional and expired never grant cloud", () => {
  assert(check({}).paidUntil === null);
  assert(check({remove_ads_lifetime: paid}).paidUntil === null);
  for (const extra of [{is_sandbox: true}, {is_sandbox: undefined},
    {period_type: "trial"}, {refunded_at: "2026-09-09"}, {store: "promotional"},
    {expires_date: "2026-09-01T00:00:00Z"}, {expires_date: null},
    {expires_date: "invalid"}, {period_type: undefined}]) {
    assert(check({remove_ads_monthly: {...paid, ...extra}}).paidUntil === null);
  }
});
Deno.test("unpaid billing grace never extends the paid cloud period", () => {
  assert(check({remove_ads_monthly: {...paid, expires_date: "2026-09-08T12:00:00Z",
    grace_period_expires_date: expiry}}).paidUntil === null);
});
Deno.test("lifetime ownership does not mask an additional monthly subscription", () => {
  assert(check({remove_ads_lifetime: {...paid, expires_date: null},
    remove_ads_monthly: paid}).productId === "remove_ads_monthly");
});
Deno.test("invalid response fails verification instead of silently revoking access", () => {
  let failed = false;
  try { paidCloudPeriod({}, now); } catch { failed = true; }
  assert(failed);
});
Deno.test("transfers refresh both owners and aliases, never dashboard tests", () => {
  const a = "11111111-1111-4111-8111-111111111111";
  const b = "22222222-2222-4222-8222-222222222222";
  const ids = customerIdsForEvent({type: "TRANSFER", transferred_from: [a],
    transferred_to: [b], aliases: [a, "$RCAnonymousID:test"]});
  assert(ids.length === 2 && ids.includes(a) && ids.includes(b));
  assert(customerIdsForEvent({type:"TEST",app_user_id:a}).length === 0);
});
