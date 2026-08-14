import { createClient } from "npm:@supabase/supabase-js@2.112.3";

type RevenueCatEvent = {
  id?: string;
  type?: string;
  app_user_id?: string;
  product_id?: string;
  entitlement_ids?: string[];
  expiration_at_ms?: number | null;
  store?: string;
  environment?: string;
  original_transaction_id?: string;
};

const uuidPattern =
  /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;

Deno.serve(async (request) => {
  if (request.method !== "POST") {
    return new Response("Method not allowed", { status: 405 });
  }

  const expectedAuthorization = Deno.env.get("REVENUECAT_WEBHOOK_AUTH");
  if (
    !expectedAuthorization ||
    request.headers.get("authorization") !== expectedAuthorization
  ) {
    return new Response("Unauthorized", { status: 401 });
  }

  const url = Deno.env.get("SUPABASE_URL");
  const secretKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!url || !secretKey) {
    return new Response("Server configuration missing", { status: 500 });
  }

  let event: RevenueCatEvent;
  try {
    const payload = await request.json();
    event = payload?.event ?? {};
  } catch {
    return new Response("Invalid JSON", { status: 400 });
  }

  const eventId = event.id;
  const eventType = event.type;
  const userId = event.app_user_id;
  const expectedEntitlement =
    Deno.env.get("REVENUECAT_ENTITLEMENT_ID") ?? "remove_ads";

  if (!eventId || !eventType) {
    return new Response("Missing event identity", { status: 400 });
  }

  const supabase = createClient(url, secretKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });

  const { data: existingEvent, error: lookupError } = await supabase
    .from("revenuecat_webhook_events")
    .select("event_id")
    .eq("event_id", eventId)
    .maybeSingle();

  if (lookupError) {
    return new Response("Unable to check event", { status: 500 });
  }
  if (existingEvent) {
    return Response.json({ received: true, duplicate: true });
  }

  const affectsEntitlement =
    event.entitlement_ids?.includes(expectedEntitlement) ?? false;
  if (!affectsEntitlement || !userId || !uuidPattern.test(userId)) {
    const { error: ignoredLedgerError } = await supabase
      .from("revenuecat_webhook_events")
      .insert({ event_id: eventId, event_type: eventType });
    if (ignoredLedgerError && ignoredLedgerError.code !== "23505") {
      return new Response("Unable to record event", { status: 500 });
    }
    return Response.json({ received: true, ignored: true });
  }

  const status = mapStatus(eventType);
  const expiresAt = event.expiration_at_ms == null
    ? null
    : new Date(event.expiration_at_ms).toISOString();

  const { error: upsertError } = await supabase
    .from("subscription_entitlements")
    .upsert(
      {
        user_id: userId,
        entitlement_id: expectedEntitlement,
        product_id: event.product_id ?? null,
        status,
        will_renew: status === "active",
        expires_at: expiresAt,
        store: event.store ?? null,
        environment: event.environment ?? null,
        original_transaction_id: event.original_transaction_id ?? null,
        last_event_id: eventId,
        updated_at: new Date().toISOString(),
      },
      { onConflict: "user_id" },
    );

  if (upsertError) {
    return new Response("Unable to update entitlement", { status: 500 });
  }

  // Record the event only after the read model update succeeds. If delivery is
  // retried after a transient database failure, the entitlement is not skipped.
  const { error: ledgerError } = await supabase
    .from("revenuecat_webhook_events")
    .insert({ event_id: eventId, event_type: eventType });
  if (ledgerError && ledgerError.code !== "23505") {
    return new Response("Unable to record event", { status: 500 });
  }

  return Response.json({ received: true });
});

function mapStatus(eventType: string) {
  switch (eventType) {
    case "CANCELLATION":
      return "cancelled";
    case "EXPIRATION":
      return "expired";
    case "BILLING_ISSUE":
      return "billing_issue";
    case "SUBSCRIPTION_PAUSED":
      return "paused";
    default:
      return "active";
  }
}
