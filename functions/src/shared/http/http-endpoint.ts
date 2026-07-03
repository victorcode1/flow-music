import {logger} from "firebase-functions";

import {HttpError} from "../errors/http-error";

export const publicHttpOptions = {
  region: "us-central1",
  cors: true,
  memory: "256MiB" as const,
  maxInstances: 1,
  timeoutSeconds: 30,
  invoker: "public" as const,
};

export function requirePost(req: {method: string}): void {
  if (req.method !== "POST") {
    throw new HttpError(405, "method-not-allowed", "Use POST.");
  }
}

export function readJsonBody<T extends Record<string, unknown>>(
  value: unknown,
): T {
  if (value == null || typeof value !== "object" || Array.isArray(value)) {
    throw new HttpError(400, "invalid-request", "Invalid JSON body.");
  }
  return value as T;
}

export function writeHttpError(
  res: {status: (code: number) => {json: (body: unknown) => void}},
  error: unknown,
  logMessage: string,
): void {
  if (error instanceof HttpError) {
    res.status(error.status).json({code: error.code, message: error.message});
    return;
  }

  logger.error(logMessage, error);
  res.status(500).json({
    code: "internal",
    message: "Request failed.",
  });
}
