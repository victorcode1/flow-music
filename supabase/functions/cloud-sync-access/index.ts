import { createClient } from "npm:@supabase/supabase-js@2.112.3";
import { readCloudAccess, reconcileCloudAccess } from "../_shared/cloud-sync-service.ts";

const headers = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, apikey, content-type, x-client-info",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

Deno.serve(async (request) => {
  if (request.method === "OPTIONS") return new Response("ok", { headers });
  if (request.method !== "POST") return new Response("Method not allowed", { status: 405, headers });
  const url = Deno.env.get("SUPABASE_URL");
  const secret = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!url || !secret) return new Response("Configuration missing", { status: 500, headers });
  const token = request.headers.get("authorization")?.replace(/^Bearer\s+/i, "");
  if (!token) return new Response("Unauthorized", { status: 401, headers });
  const client = createClient(url, secret, { auth: { persistSession: false, autoRefreshToken: false } });
  const { data: { user }, error: authError } = await client.auth.getUser(token);
  if (authError || !user || user.is_anonymous) {
    return new Response("Unauthorized", { status: 401, headers });
  }
  try {
    // No app-supplied user id or paid flag is accepted.
    let access = await readCloudAccess(client, user.id);
    if (!access || Date.now() - Date.parse(access.verified_at) >= 15000) {
      await reconcileCloudAccess(client, user.id);
      access = await readCloudAccess(client, user.id);
    }
    return Response.json({
      allowed: Date.parse(access?.access_until ?? "") > Date.now(),
      access_until: access?.access_until ?? null,
      paid_until: access?.paid_until ?? null,
    }, { headers });
  } catch (_) {
    // Do not report a verification outage as an empty or successfully backed up library.
    return Response.json({ error: "Subscription verification unavailable" }, { status: 503, headers });
  }
});
