import {logger} from "firebase-functions";
import {onRequest} from "firebase-functions/v2/https";

import {HttpError} from "../../../shared/errors/http-error";
import {
  requireEmail,
  requireNonEmptyString,
} from "../../../shared/validation/primitives";
import {AuthService} from "../application/auth-service";
import {mapAdminAuthError} from "../domain/auth-errors";
import {AuthHttpRequest} from "../dto/auth.dto";

const authService = new AuthService();

const publicHttpOptions = {
  region: "us-central1",
  cors: true,
  memory: "256MiB" as const,
  timeoutSeconds: 30,
  invoker: "public" as const,
};

export const authRegister = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    if (req.method !== "POST") {
      res.status(405).json({code: "method-not-allowed"});
      return;
    }

    try {
      const data = readAuthHttpRequest(req.body);
      const email = requireEmail(data.email);
      const password = requirePassword(data.password);
      const displayName = readDisplayName(data.displayName);
      res.json(await authService.registerWithEmail({
        email,
        password,
        displayName,
      }));
    } catch (error) {
      writeAuthError(res, error);
    }
  },
);

export const authLogin = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    if (req.method !== "POST") {
      res.status(405).json({code: "method-not-allowed"});
      return;
    }

    try {
      const data = readAuthHttpRequest(req.body);
      const email = requireEmail(data.email);
      const password = requirePassword(data.password);
      res.json(await authService.loginWithEmail({email, password}));
    } catch (error) {
      writeAuthError(res, error);
    }
  },
);

export const authGoogleLogin = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    if (req.method !== "POST") {
      res.status(405).json({code: "method-not-allowed"});
      return;
    }

    try {
      const data = readAuthHttpRequest(req.body);
      const googleIdToken = requireNonEmptyString(
        data.googleIdToken,
        "googleIdToken",
      );
      res.json(await authService.loginWithGoogleIdToken(googleIdToken));
    } catch (error) {
      writeAuthError(res, error);
    }
  },
);

export const authRefreshSession = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    if (req.method !== "POST") {
      res.status(405).json({code: "method-not-allowed"});
      return;
    }

    try {
      const data = readAuthHttpRequest(req.body);
      const refreshToken = requireNonEmptyString(
        data.refreshToken,
        "refreshToken",
      );
      res.json(await authService.refreshSession(refreshToken));
    } catch (error) {
      writeAuthError(res, error);
    }
  },
);

export const authCurrentUser = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    if (req.method !== "GET" && req.method !== "POST") {
      res.status(405).json({code: "method-not-allowed"});
      return;
    }

    try {
      const idToken = readAuthToken(
        req.header("x-flow-auth-token"),
        req.header("authorization"),
      );
      const user = await authService.getCurrentUser(idToken);
      res.json({user});
    } catch (error) {
      writeAuthError(res, error);
    }
  },
);

export const authPasswordReset = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    if (req.method !== "POST") {
      res.status(405).json({code: "method-not-allowed"});
      return;
    }

    try {
      const data = readAuthHttpRequest(req.body);
      const email = requireEmail(data.email);
      await authService.sendPasswordReset(email);
      res.json({ok: true});
    } catch (error) {
      writeAuthError(res, error);
    }
  },
);

function readAuthHttpRequest(value: unknown): AuthHttpRequest {
  if (value == null || typeof value !== "object" || Array.isArray(value)) {
    throw new HttpError(400, "invalid-request", "Invalid JSON body.");
  }
  return value as AuthHttpRequest;
}

function requirePassword(value: unknown): string {
  const password = requireNonEmptyString(value, "password");
  if (password.length < 6) {
    throw new HttpError(
      400,
      "weak-password",
      "The password must have at least 6 characters.",
    );
  }
  return password;
}

function readDisplayName(value: unknown): string | undefined {
  if (value == null) return undefined;
  if (typeof value !== "string") {
    throw new HttpError(
      400,
      "invalid-display-name",
      "The displayName field must be a string.",
    );
  }
  const displayName = value.trim();
  return displayName.length > 0 ? displayName : undefined;
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
    throw new HttpError(
      401,
      "unauthenticated",
      "A bearer token is required.",
    );
  }
  return authorization.slice(prefix.length).trim();
}

function writeAuthError(
  res: {status: (code: number) => {json: (body: unknown) => void}},
  error: unknown,
): void {
  if (error instanceof HttpError) {
    res.status(error.status).json({
      code: error.code,
      message: error.message,
    });
    return;
  }

  if (
    typeof error === "object" &&
    error != null &&
    "code" in error &&
    typeof error.code === "string"
  ) {
    const mapped = mapAdminAuthError(error.code);
    res.status(mapped.status).json({
      code: mapped.code,
      message: mapped.message,
    });
    return;
  }

  logger.error("Auth HTTP endpoint failed", error);
  res.status(500).json({
    code: "internal",
    message: "Authentication request failed.",
  });
}
