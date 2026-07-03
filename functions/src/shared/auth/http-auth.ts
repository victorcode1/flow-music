import {getAuth} from "firebase-admin/auth";

import {HttpError} from "../errors/http-error";

export type VerifiedHttpUser = {
  uid: string;
  token: Record<string, unknown>;
};

export async function verifyHttpUser(req: {
  header: (name: string) => string | undefined;
}): Promise<VerifiedHttpUser> {
  const idToken = readAuthToken(
    req.header("x-flow-auth-token"),
    req.header("authorization"),
  );
  try {
    const decoded = await getAuth().verifyIdToken(idToken);
    return {
      uid: decoded.uid,
      token: decoded as unknown as Record<string, unknown>,
    };
  } catch (error) {
    throw mapVerifyTokenError(error);
  }
}

export function assertLocationAdmin(user: VerifiedHttpUser): void {
  if (user.token.admin === true || user.token.locationAdmin === true) return;
  throw new HttpError(
    403,
    "permission-denied",
    "Only admins can manage location data.",
  );
}

function readAuthToken(
  flowAuthToken: string | undefined,
  authorization: string | undefined,
): string {
  if (flowAuthToken && flowAuthToken.trim().length > 0) {
    return flowAuthToken.trim();
  }

  const prefix = "Bearer ";
  if (!authorization || !authorization.startsWith(prefix)) {
    throw new HttpError(401, "unauthenticated", "A bearer token is required.");
  }
  return authorization.slice(prefix.length).trim();
}

function mapVerifyTokenError(error: unknown): HttpError {
  const code =
    typeof error === "object" &&
    error != null &&
    "code" in error &&
    typeof error.code === "string" ?
      error.code :
      "";

  if (code === "auth/id-token-expired") {
    return new HttpError(401, "invalid-session", "The session expired.");
  }
  if (code.startsWith("auth/")) {
    return new HttpError(401, "unauthenticated", "The session is invalid.");
  }
  return new HttpError(401, "unauthenticated", "Authentication failed.");
}
