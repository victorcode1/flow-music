import {Timestamp} from "firebase-admin/firestore";

import {
  maxLocationUpdateIntervalSeconds,
  minLocationUpdateIntervalSeconds,
} from "./location-admin-service";

export const defaultLocationUpdateIntervalMinutes = 24 * 60;
export const defaultLocationUpdateIntervalSeconds =
  defaultLocationUpdateIntervalMinutes * 60;

export function readLocationIntervalMinutes(value: unknown): number {
  return Math.ceil(readLocationIntervalSeconds(undefined, value) / 60);
}

export function readLocationIntervalSeconds(
  secondsValue: unknown,
  minutesValue?: unknown,
): number {
  return readStoredLocationIntervalSeconds(secondsValue, minutesValue) ??
    defaultLocationUpdateIntervalSeconds;
}

export function readStoredLocationIntervalSeconds(
  secondsValue: unknown,
  minutesValue?: unknown,
): number | undefined {
  if (
    typeof secondsValue === "number" &&
    Number.isInteger(secondsValue) &&
    secondsValue >= minLocationUpdateIntervalSeconds &&
    secondsValue <= maxLocationUpdateIntervalSeconds
  ) {
    return secondsValue;
  }

  if (
    typeof minutesValue === "number" &&
    Number.isInteger(minutesValue)
  ) {
    const seconds = minutesValue * 60;
    if (
      seconds >= minLocationUpdateIntervalSeconds &&
      seconds <= maxLocationUpdateIntervalSeconds
    ) {
      return seconds;
    }
  }

  return undefined;
}

export function locationIntervalResponse(seconds: number): {
  seconds: number;
  minutes: number;
} {
  return {
    seconds,
    minutes: Math.ceil(seconds / 60),
  };
}

export function serializeFirestoreValue(value: unknown): unknown {
  if (value instanceof Timestamp) return value.toDate().toISOString();
  if (Array.isArray(value)) return value.map(serializeFirestoreValue);
  if (value != null && typeof value === "object") {
    return Object.fromEntries(
      Object.entries(value).map(([key, item]) => [
        key,
        serializeFirestoreValue(item),
      ]),
    );
  }
  return value;
}

export function serializedFirestoreMap(
  value: Record<string, unknown>,
): Record<string, unknown> {
  return serializeFirestoreValue(value) as Record<string, unknown>;
}

export function compareUserLocationRecords(a: unknown, b: unknown): number {
  return compareDates(b, a, "lastLocation", "updatedAt");
}

export function compareProfileRecords(a: unknown, b: unknown): number {
  const lastSeen = compareDates(b, a, undefined, "lastSeenAt");
  return lastSeen !== 0 ?
    lastSeen :
    compareDates(b, a, "lastLocation", "updatedAt");
}

export function isAnonymousLike(value: unknown): boolean {
  const data = value as Record<string, unknown>;
  if (data.isAnonymous === true) return true;
  const email = typeof data.email === "string" ? data.email.trim() : "";
  if (email.length > 0) return false;
  const name = typeof data.displayName === "string" ?
    data.displayName.trim().toLowerCase() :
    "";
  return name.length === 0 ||
    name === "usuario anonimo" ||
    name === "usuario anónimo";
}

function compareDates(
  a: unknown,
  b: unknown,
  parentKey: string | undefined,
  key: string,
): number {
  const aDate = readDate(a, parentKey, key)?.getTime() ?? 0;
  const bDate = readDate(b, parentKey, key)?.getTime() ?? 0;
  return aDate - bDate;
}

function readDate(
  value: unknown,
  parentKey: string | undefined,
  key: string,
) {
  const map = value as Record<string, unknown>;
  const raw = parentKey ?
    (map[parentKey] as Record<string, unknown> | undefined)?.[key] :
    map[key];
  return typeof raw === "string" ? new Date(raw) : null;
}
