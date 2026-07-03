import {HttpsError} from "firebase-functions/v2/https";

import {HttpError} from "../errors/http-error";

export function normalizeEmail(value: unknown): string | null {
  if (typeof value !== "string") return null;
  const email = value.trim().toLowerCase();
  if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email)) return null;
  return email;
}

export function requireEmail(value: unknown): string {
  const email = normalizeEmail(value);
  if (!email) {
    throw new HttpError(400, "invalid-email", "A valid email is required.");
  }
  return email;
}

export function requireNonEmptyString(value: unknown, field: string): string {
  if (typeof value !== "string" || value.trim().length === 0) {
    throw new HttpError(
      400,
      `invalid-${field}`,
      `The ${field} field is required.`,
    );
  }
  return value.trim();
}

export function readBoolean(value: unknown, field: string): boolean {
  if (typeof value !== "boolean") {
    throw new HttpsError(
      "invalid-argument",
      `The ${field} field must be a boolean.`,
    );
  }
  return value;
}

export function readBoundedInt(
  value: unknown,
  field: string,
  min: number,
  max: number,
): number {
  if (
    typeof value !== "number" ||
    !Number.isInteger(value) ||
    value < min ||
    value > max
  ) {
    throw new HttpsError(
      "invalid-argument",
      `The ${field} field must be an integer from ${min} to ${max}.`,
    );
  }
  return value;
}

export function readStoredInt(
  value: unknown,
  fallback: number,
  min: number,
  max: number,
): number {
  if (
    typeof value !== "number" ||
    !Number.isInteger(value) ||
    value < min ||
    value > max
  ) {
    return fallback;
  }
  return value;
}

export function readTimezone(value: unknown, fallback: string): string {
  const timezone = typeof value === "string" && value.trim().length > 0 ?
    value.trim() :
    fallback;
  try {
    new Intl.DateTimeFormat("en-US", {timeZone: timezone}).format(new Date());
  } catch {
    throw new HttpsError(
      "invalid-argument",
      "The timezone field must be a valid IANA time zone.",
    );
  }
  return timezone;
}
