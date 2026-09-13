import type { SupabaseClient } from "npm:@supabase/supabase-js@2.112.3";
import { type CustomerInfo, paidCloudPeriod } from "./revenuecat-cloud-access.ts";
import { revenueCatPublicKey } from "./revenuecat-public-config.ts";

export async function reconcileCloudAccess(client: SupabaseClient, userId: string) {
  const apiKey = Deno.env.get("REVENUECAT_CLOUD_API_KEY") ?? revenueCatPublicKey;
  if (!apiKey) throw new Error("Cloud verification configuration missing");
  const response = await fetch(
    "https://api.revenuecat.com/v1/subscribers/" + encodeURIComponent(userId),
    { headers: { Authorization: "Bearer " + apiKey }, signal: AbortSignal.timeout(10000) },
  );
  if (!response.ok) throw new Error("RevenueCat verification unavailable");
  const info: CustomerInfo = await response.json();
  const observed = info.request_date_ms ?? Date.parse(info.request_date ?? "");
  if (!Number.isFinite(observed) || Math.abs(observed - Date.now()) > 300000) {
    throw new Error("Invalid RevenueCat verification timestamp");
  }
  const period = paidCloudPeriod(info, observed);
  const { error } = await client.rpc("record_cloud_subscription_access", {
    p_user_id: userId,
    p_product_id: period.productId,
    p_paid_until: period.paidUntil,
    p_verified_at: new Date(observed).toISOString(),
  });
  if (error) throw new Error("Unable to persist cloud verification");
}

export async function readCloudAccess(client: SupabaseClient, userId: string) {
  const { data, error } = await client.from("cloud_subscription_access")
    .select("access_until, paid_until, verified_at").eq("user_id", userId).maybeSingle();
  if (error) throw new Error("Unable to read cloud verification");
  return data;
}
