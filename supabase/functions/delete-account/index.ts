import { createClient } from "npm:@supabase/supabase-js@2.112.3";

type DeleteAccountPayload = {
  apple_authorization_code?: string;
  apple_raw_nonce?: string;
};

type AppleTokenResponse = {
  access_token?: string;
  refresh_token?: string;
  id_token?: string;
};

type AppleIdTokenClaims = {
  aud?: string | string[];
  exp?: number;
  iss?: string;
  nonce?: string;
  sub?: string;
};

Deno.serve(async (request) => {
  if (request.method !== "POST") {
    return new Response("Method not allowed", { status: 405 });
  }

  const url = Deno.env.get("SUPABASE_URL");
  const publishableKey = Deno.env.get("SUPABASE_ANON_KEY");
  const secretKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  const authorization = request.headers.get("authorization");
  if (!url || !publishableKey || !secretKey || !authorization) {
    return new Response("Unauthorized", { status: 401 });
  }

  const userClient = createClient(url, publishableKey, {
    global: { headers: { Authorization: authorization } },
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const { data, error } = await userClient.auth.getUser();
  if (error || !data.user) {
    return new Response("Unauthorized", { status: 401 });
  }

  let payload: DeleteAccountPayload;
  try {
    payload = await request.json();
  } catch {
    return new Response("Invalid JSON", { status: 400 });
  }

  const appleIdentity = data.user.identities?.find(
    (identity) => identity.provider === "apple",
  );
  const providers = data.user.app_metadata?.providers;
  const usesApple = Boolean(appleIdentity) ||
    (Array.isArray(providers) && providers.includes("apple"));

  if (usesApple) {
    const expectedSubject = appleIdentity?.identity_data?.sub;
    if (!expectedSubject) {
      return new Response("Apple identity cannot be verified", { status: 409 });
    }
    try {
      await revokeAppleAuthorization({
        authorizationCode: payload.apple_authorization_code ?? "",
        rawNonce: payload.apple_raw_nonce ?? "",
        expectedSubject,
      });
    } catch {
      return new Response("Unable to revoke Apple authorization", {
        status: 502,
      });
    }
  }

  const adminClient = createClient(url, secretKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const { error: analyticsDeleteError } = await adminClient
    .from("product_analytics_events")
    .delete()
    .eq("user_id", data.user.id);
  if (analyticsDeleteError) {
    return new Response("Unable to delete account data", { status: 500 });
  }

  const { error: deleteError } = await adminClient.auth.admin.deleteUser(
    data.user.id,
  );
  if (deleteError) {
    return new Response("Unable to delete account", { status: 500 });
  }

  return Response.json({ deleted: true });
});

async function revokeAppleAuthorization({
  authorizationCode,
  rawNonce,
  expectedSubject,
}: {
  authorizationCode: string;
  rawNonce: string;
  expectedSubject: string;
}) {
  const teamId = Deno.env.get("APPLE_SIGN_IN_TEAM_ID");
  const keyId = Deno.env.get("APPLE_SIGN_IN_KEY_ID");
  const clientId = Deno.env.get("APPLE_SIGN_IN_CLIENT_ID");
  const privateKeyBase64 = Deno.env.get("APPLE_SIGN_IN_PRIVATE_KEY_B64");
  if (
    !authorizationCode ||
    !rawNonce ||
    !teamId ||
    !keyId ||
    !clientId ||
    !privateKeyBase64
  ) {
    throw new Error("Apple revocation configuration missing");
  }

  const privateKeyPem = new TextDecoder().decode(
    Uint8Array.from(atob(privateKeyBase64), (character) =>
      character.charCodeAt(0)
    ),
  );
  const clientSecret = await createAppleClientSecret({
    teamId,
    keyId,
    clientId,
    privateKeyPem,
  });
  const tokenResponse = await fetch("https://appleid.apple.com/auth/token", {
    method: "POST",
    headers: { "content-type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      client_id: clientId,
      client_secret: clientSecret,
      code: authorizationCode,
      grant_type: "authorization_code",
    }),
  });
  if (!tokenResponse.ok) throw new Error("Apple token exchange failed");
  const tokens = await tokenResponse.json() as AppleTokenResponse;
  if (!tokens.refresh_token || !tokens.id_token) {
    throw new Error("Apple token exchange incomplete");
  }

  const claims = decodeJwtPayload(tokens.id_token);
  const expectedNonce = await sha256Hex(rawNonce);
  const audienceMatches = Array.isArray(claims.aud)
    ? claims.aud.includes(clientId)
    : claims.aud === clientId;
  if (
    claims.iss !== "https://appleid.apple.com" ||
    !audienceMatches ||
    claims.sub !== expectedSubject ||
    claims.nonce !== expectedNonce ||
    typeof claims.exp !== "number" ||
    claims.exp <= Math.floor(Date.now() / 1000)
  ) {
    throw new Error("Apple token claims do not match the account");
  }

  const revokeResponse = await fetch("https://appleid.apple.com/auth/revoke", {
    method: "POST",
    headers: { "content-type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      client_id: clientId,
      client_secret: clientSecret,
      token: tokens.refresh_token,
      token_type_hint: "refresh_token",
    }),
  });
  if (!revokeResponse.ok) throw new Error("Apple token revocation failed");
}

async function createAppleClientSecret({
  teamId,
  keyId,
  clientId,
  privateKeyPem,
}: {
  teamId: string;
  keyId: string;
  clientId: string;
  privateKeyPem: string;
}) {
  const pemBody = privateKeyPem
    .replace("-----BEGIN PRIVATE KEY-----", "")
    .replace("-----END PRIVATE KEY-----", "")
    .replace(/\s/g, "");
  const privateKeyBytes = Uint8Array.from(
    atob(pemBody),
    (character) => character.charCodeAt(0),
  );
  const privateKey = await crypto.subtle.importKey(
    "pkcs8",
    privateKeyBytes,
    { name: "ECDSA", namedCurve: "P-256" },
    false,
    ["sign"],
  );
  const now = Math.floor(Date.now() / 1000);
  const header = base64UrlJson({ alg: "ES256", kid: keyId, typ: "JWT" });
  const claims = base64UrlJson({
    iss: teamId,
    iat: now,
    exp: now + 300,
    aud: "https://appleid.apple.com",
    sub: clientId,
  });
  const unsignedToken = `${header}.${claims}`;
  const signature = await crypto.subtle.sign(
    { name: "ECDSA", hash: "SHA-256" },
    privateKey,
    new TextEncoder().encode(unsignedToken),
  );
  return `${unsignedToken}.${base64Url(new Uint8Array(signature))}`;
}

function decodeJwtPayload(token: string): AppleIdTokenClaims {
  const encoded = token.split(".")[1];
  if (!encoded) throw new Error("Invalid Apple ID token");
  const normalized = encoded.replace(/-/g, "+").replace(/_/g, "/");
  const padded = normalized.padEnd(
    normalized.length + ((4 - normalized.length % 4) % 4),
    "=",
  );
  return JSON.parse(atob(padded));
}

async function sha256Hex(value: string) {
  const digest = await crypto.subtle.digest(
    "SHA-256",
    new TextEncoder().encode(value),
  );
  return Array.from(new Uint8Array(digest))
    .map((byte) => byte.toString(16).padStart(2, "0"))
    .join("");
}

function base64UrlJson(value: Record<string, string | number>) {
  return base64Url(new TextEncoder().encode(JSON.stringify(value)));
}

function base64Url(bytes: Uint8Array) {
  let binary = "";
  for (const byte of bytes) binary += String.fromCharCode(byte);
  return btoa(binary).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}
