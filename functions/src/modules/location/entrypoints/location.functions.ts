import {getAuth} from "firebase-admin/auth";
import {logger} from "firebase-functions";
import {HttpsError, onCall, onRequest} from "firebase-functions/v2/https";
import {onSchedule} from "firebase-functions/v2/scheduler";

import {
  assertLocationAdmin,
  verifyHttpUser,
} from "../../../shared/auth/http-auth";
import {HttpError} from "../../../shared/errors/http-error";
import {
  publicHttpOptions,
  readJsonBody,
  requirePost,
  writeHttpError,
} from "../../../shared/http/http-endpoint";
import {
  normalizeEmail,
  readBoolean,
  readBoundedInt,
  readTimezone,
} from "../../../shared/validation/primitives";
import {
  AnonymousUserCleanupService,
} from "../../maintenance/application/anonymous-user-cleanup-service";
import {
  defaultLocationTimezone,
  LocationAdminService,
  maxLocationUpdateIntervalSeconds,
  minLocationUpdateIntervalSeconds,
} from "../application/location-admin-service";
import {LocationHttpService} from "../application/location-http-service";
import {LocationRealtimeService} from "../application/location-realtime-service";
import {currentTimeInZone} from "../application/location-scheduler-service";
import {
  AdminAccessResponse,
  DeleteLocationHistoryResponse,
  LocationHistoryCleanupSchedule,
  SetGlobalLocationUpdateIntervalRequest,
  SetGlobalLocationUpdateIntervalResponse,
  SetLocationDashboardAccessRequest,
  SetLocationHistoryCleanupScheduleRequest,
} from "../domain/location.types";

const locationService = new LocationAdminService();
const locationHttpService = new LocationHttpService();
const locationRealtimeService = new LocationRealtimeService();
const anonymousUserCleanupService = new AnonymousUserCleanupService();
const locationApiOptions = {
  ...publicHttpOptions,
  maxInstances: 3,
  timeoutSeconds: 3600,
};

export const locationApi = onRequest(
  locationApiOptions,
  async (req, res): Promise<void> => {
    try {
      if (req.method === "GET") {
        await handleLocationStream(req, res);
        return;
      }
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      switch (body.action) {
      case "readInterval":
        res.json(await locationHttpService.readUserInterval(
          readOptionalUid(body.uid) ?? user.uid,
        ));
        return;
      case "saveIfDue":
        res.json(await locationHttpService.saveIfDue({
          uid: user.uid,
          intervalSeconds: readIntervalSeconds(body),
          latitude: readNumber(body.latitude, "latitude"),
          longitude: readNumber(body.longitude, "longitude"),
          source: readOptionalString(body.source),
          positionCapturedAt: readOptionalString(body.positionCapturedAt),
          user: readMap(body.user, "user"),
        }));
        return;
      case "reportStatus":
        res.json(await locationHttpService.reportLocationStatus({
          uid: user.uid,
          status: readLocationStatus(body.status),
          reason: readRequiredString(body.reason, "reason"),
          user: readMap(body.user, "user"),
        }));
        return;
      case "readGlobalInterval":
        res.json(await locationHttpService.readGlobalInterval());
        return;
      case "usersWithLocations":
        assertLocationAdmin(user);
        res.json(await locationHttpService.usersWithLocations());
        return;
      case "anonymousUsers":
        assertLocationAdmin(user);
        res.json(await locationHttpService.anonymousUsers());
        return;
      case "history":
        assertLocationAdmin(user);
        res.json(await locationHttpService.history(
          readRequiredString(body.uid, "uid"),
        ));
        return;
      case "readCleanupSchedule":
        assertLocationAdmin(user);
        if ("enabled" in body || "hour" in body || "minute" in body) {
          const schedule = await locationService.updateCleanupSchedule({
            enabled: readBool(body.enabled, "enabled"),
            hour: readInteger(body.hour, "hour"),
            minute: readInteger(body.minute, "minute"),
            timezone: readTimezone(body.timezone, defaultLocationTimezone),
            updatedBy: user.uid,
          });
          res.json({schedule});
          return;
        }
        res.json(await locationHttpService.cleanupSchedule());
        return;
      case "readAnonymousUserCleanup":
        assertLocationAdmin(user);
        if ("enabled" in body) {
          const config = await anonymousUserCleanupService.updateConfig({
            enabled: readBool(body.enabled, "enabled"),
            updatedBy: user.uid,
          });
          res.json({config});
          return;
        }
        res.json({config: await anonymousUserCleanupService.readConfig()});
        return;
      case "deleteHistoryEntry":
        assertLocationAdmin(user);
        res.json(await locationHttpService.deleteHistoryEntry({
          uid: readRequiredString(body.uid, "uid"),
          entryId: readRequiredString(body.entryId, "entryId"),
        }));
        return;
      case "deleteAllUsersHistory":
        assertLocationAdmin(user);
        {
          const uid = readOptionalUid(body.uid);
          if (uid) {
            res.json(await locationHttpService.deleteUserHistory(uid));
            return;
          }
          const deletedCount =
            await locationService.deleteAllLocationHistoryEntries();
          res.json({deletedCount});
        }
        return;
      case "setUserInterval":
        assertLocationAdmin(user);
        res.json(await locationHttpService.setUserInterval({
          uid: readRequiredString(body.uid, "uid"),
          seconds: readIntervalSeconds(body),
        }));
        return;
      case "setGlobalInterval":
        assertLocationAdmin(user);
        {
          const seconds = readIntervalSeconds(body);
          const updatedCount =
            await locationService.updateAllUsersLocationInterval(seconds);
          res.json({
            seconds,
            minutes: Math.max(1, Math.ceil(seconds / 60)),
            updatedCount,
          });
        }
        return;
      default:
        throw new HttpError(400, "invalid-action", "Invalid location action.");
      }
    } catch (error) {
      writeHttpError(res, error, "Location API failed");
    }
  },
);

async function handleLocationStream(
  req: StreamRequest,
  res: StreamResponse,
): Promise<void> {
  const user = await verifyHttpUser(req);

  const action = readQueryString(req.query.action, "action");
  const params = {
    uid: readOptionalQueryString(req.query.uid),
  };
  assertLocationStreamRequest(action, params);
  if (action === "readInterval") {
    if (params.uid && params.uid !== user.uid) assertLocationAdmin(user);
    params.uid = params.uid ?? user.uid;
  } else {
    assertLocationAdmin(user);
  }

  res.status(200);
  res.setHeader("Content-Type", "text/event-stream; charset=utf-8");
  res.setHeader("Cache-Control", "no-cache, no-transform");
  res.setHeader("Connection", "keep-alive");
  res.setHeader("X-Accel-Buffering", "no");
  res.flushHeaders?.();

  let closed = false;
  let unsubscribe: (() => void) | undefined;
  const heartbeat = setInterval(() => {
    if (!closed) res.write(": keep-alive\n\n");
  }, 25000);

  const close = () => {
    if (closed) return;
    closed = true;
    clearInterval(heartbeat);
    unsubscribe?.();
    if (!res.writableEnded) res.end();
  };

  req.on("close", close);
  res.write(": connected\n\n");

  unsubscribe = locationRealtimeService.openStream({
    action,
    params,
    send: (payload) => {
      if (!closed) writeSseEvent(res, "snapshot", payload);
    },
    fail: (error) => {
      logger.error("Location SSE stream failed", {action, error});
      if (!closed) {
        writeSseEvent(res, "error", {
          code: "stream-error",
          message: "Location stream failed.",
        });
        close();
      }
    },
  });
}

export const bootstrapLocationDashboardAdmin = onCall(
  {
    region: "us-central1",
    memory: "256MiB",
  },
  async (request): Promise<AdminAccessResponse> => {
    if (!request.auth) {
      throw new HttpsError("unauthenticated", "Authentication is required.");
    }

    const email = normalizeEmail(request.auth.token.email);
    if (!email) {
      throw new HttpsError("failed-precondition", "The user has no email.");
    }

    const allowedEmails = locationService.bootstrapEmails();
    if (!allowedEmails.has(email)) {
      logger.info("Dashboard bootstrap denied", {
        uid: request.auth.uid,
        email,
      });
      throw new HttpsError(
        "permission-denied",
        "This account cannot bootstrap dashboard access.",
      );
    }

    const response = await locationService.setDashboardClaim(
      request.auth.uid,
      true,
    );
    logger.info("Dashboard bootstrap granted", {
      uid: response.uid,
      email: response.email,
    });
    return response;
  },
);

export const setLocationDashboardAccess = onCall(
  {
    region: "us-central1",
    memory: "256MiB",
  },
  async (request): Promise<AdminAccessResponse> => {
    if (!request.auth) {
      throw new HttpsError("unauthenticated", "Authentication is required.");
    }

    if (!locationService.canManageDashboardAccess(request.auth.token)) {
      throw new HttpsError(
        "permission-denied",
        "Only admins can manage dashboard access.",
      );
    }

    const data = request.data as SetLocationDashboardAccessRequest;
    const email = normalizeEmail(data.email);
    if (!email) {
      throw new HttpsError(
        "invalid-argument",
        "A valid target email is required.",
      );
    }
    if (typeof data.enabled !== "boolean") {
      throw new HttpsError(
        "invalid-argument",
        "The enabled field must be a boolean.",
      );
    }

    const user = await getAuth().getUserByEmail(email);
    const response = await locationService.setDashboardClaim(
      user.uid,
      data.enabled,
    );
    logger.info("Dashboard access updated", {
      actorUid: request.auth.uid,
      targetUid: response.uid,
      targetEmail: response.email,
      enabled: data.enabled,
    });
    return response;
  },
);

export const deleteAllUsersLocationHistory = onCall(
  {
    region: "us-central1",
    memory: "512MiB",
    timeoutSeconds: 540,
  },
  async (request): Promise<DeleteLocationHistoryResponse> => {
    locationService.assertDashboardAdmin(request.auth);

    const deletedCount = await locationService.deleteAllLocationHistoryEntries();
    logger.info("All location history deleted", {
      actorUid: request.auth?.uid,
      deletedCount,
    });
    return {deletedCount};
  },
);

export const setLocationHistoryCleanupSchedule = onCall(
  {
    region: "us-central1",
    memory: "256MiB",
  },
  async (request): Promise<LocationHistoryCleanupSchedule> => {
    locationService.assertDashboardAdmin(request.auth);

    const data = request.data as SetLocationHistoryCleanupScheduleRequest;
    const enabled = readBoolean(data.enabled, "enabled");
    const hour = readBoundedInt(data.hour, "hour", 0, 23);
    const minute = readBoundedInt(data.minute, "minute", 0, 59);
    const timezone = readTimezone(data.timezone, defaultLocationTimezone);
    const schedule = await locationService.updateCleanupSchedule({
      enabled,
      hour,
      minute,
      timezone,
      updatedBy: request.auth?.uid,
    });

    logger.info("Location history cleanup schedule updated", {
      actorUid: request.auth?.uid,
      enabled,
      hour,
      minute,
      timezone,
    });
    return schedule;
  },
);

export const setGlobalLocationUpdateInterval = onCall(
  {
    region: "us-central1",
    memory: "512MiB",
    timeoutSeconds: 540,
  },
  async (request): Promise<SetGlobalLocationUpdateIntervalResponse> => {
    locationService.assertDashboardAdmin(request.auth);

    const data = request.data as SetGlobalLocationUpdateIntervalRequest;
    const seconds = readIntervalSeconds(data);
    const updatedCount = await locationService.updateAllUsersLocationInterval(
      seconds,
    );
    logger.info("Global location update interval changed", {
      actorUid: request.auth?.uid,
      seconds,
      updatedCount,
    });
    return {
      seconds,
      minutes: Math.max(1, Math.ceil(seconds / 60)),
      updatedCount,
    };
  },
);

export const scheduledLocationHistoryCleanup = onSchedule(
  {
    region: "us-central1",
    memory: "512MiB",
    timeoutSeconds: 540,
    schedule: "every 5 minutes",
    timeZone: "UTC",
  },
  async () => {
    const config = await locationService.readCleanupSchedule();
    if (!config.enabled) {
      logger.debug("Location history cleanup skipped: disabled");
      return;
    }

    const now = currentTimeInZone(config.timezone);
    const scheduledMinute = config.hour * 60 + config.minute;
    const currentMinute = now.hour * 60 + now.minute;
    const isDue =
      currentMinute >= scheduledMinute && currentMinute < scheduledMinute + 5;
    if (!isDue) {
      logger.debug("Location history cleanup skipped: not due", {
        configuredHour: config.hour,
        configuredMinute: config.minute,
        timezone: config.timezone,
        currentHour: now.hour,
        currentMinute: now.minute,
      });
      return;
    }

    if (config.lastRunKey === now.dateKey) {
      logger.info("Location history cleanup skipped: already ran today", {
        dateKey: now.dateKey,
      });
      return;
    }

    const deletedCount = await locationService.deleteAllLocationHistoryEntries();
    await locationService.markCleanupRun({
      dateKey: now.dateKey,
      deletedCount,
    });
    logger.info("Scheduled location history cleanup completed", {
      deletedCount,
      dateKey: now.dateKey,
      timezone: config.timezone,
    });
  },
);

export const userLocationReadInterval = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      res.json(await locationHttpService.readUserInterval(
        readOptionalUid(body.uid) ?? user.uid,
      ));
    } catch (error) {
      writeHttpError(res, error, "Read user location interval failed");
    }
  },
);

export const locationReadGlobalInterval = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      await verifyHttpUser(req);
      res.json(await locationHttpService.readGlobalInterval());
    } catch (error) {
      writeHttpError(res, error, "Read global location interval failed");
    }
  },
);

export const userLocationSaveIfDue = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      res.json(await locationHttpService.saveIfDue({
        uid: user.uid,
        intervalSeconds: readIntervalSeconds(body),
        latitude: readNumber(body.latitude, "latitude"),
        longitude: readNumber(body.longitude, "longitude"),
        source: readOptionalString(body.source),
        positionCapturedAt: readOptionalString(body.positionCapturedAt),
        user: readMap(body.user, "user"),
      }));
    } catch (error) {
      writeHttpError(res, error, "Save user location failed");
    }
  },
);

export const locationUsersWithLocations = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      assertLocationAdmin(user);
      res.json(await locationHttpService.usersWithLocations());
    } catch (error) {
      writeHttpError(res, error, "Read location users failed");
    }
  },
);

export const locationAnonymousUsers = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      assertLocationAdmin(user);
      res.json(await locationHttpService.anonymousUsers());
    } catch (error) {
      writeHttpError(res, error, "Read anonymous users failed");
    }
  },
);

export const locationHistory = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      assertLocationAdmin(user);
      const body = readJsonBody(req.body);
      res.json(await locationHttpService.history(readRequiredString(body.uid, "uid")));
    } catch (error) {
      writeHttpError(res, error, "Read location history failed");
    }
  },
);

export const locationReadCleanupSchedule = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      assertLocationAdmin(user);
      const body = readJsonBody(req.body);
      if ("enabled" in body || "hour" in body || "minute" in body) {
        const schedule = await locationService.updateCleanupSchedule({
          enabled: readBool(body.enabled, "enabled"),
          hour: readInteger(body.hour, "hour"),
          minute: readInteger(body.minute, "minute"),
          timezone: readTimezone(body.timezone, defaultLocationTimezone),
          updatedBy: user.uid,
        });
        res.json({schedule});
        return;
      }
      res.json(await locationHttpService.cleanupSchedule());
    } catch (error) {
      writeHttpError(res, error, "Read cleanup schedule failed");
    }
  },
);

export const locationDeleteHistoryEntry = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      assertLocationAdmin(user);
      const body = readJsonBody(req.body);
      res.json(await locationHttpService.deleteHistoryEntry({
        uid: readRequiredString(body.uid, "uid"),
        entryId: readRequiredString(body.entryId, "entryId"),
      }));
    } catch (error) {
      writeHttpError(res, error, "Delete location history entry failed");
    }
  },
);

export const locationDeleteUserHistory = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      assertLocationAdmin(user);
      const body = readJsonBody(req.body);
      res.json(await locationHttpService.deleteUserHistory(
        readRequiredString(body.uid, "uid"),
      ));
    } catch (error) {
      writeHttpError(res, error, "Delete user location history failed");
    }
  },
);

export const locationDeleteAllUsersHistory = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      assertLocationAdmin(user);
      const body = readJsonBody(req.body);
      const uid = readOptionalUid(body.uid);
      if (uid) {
        res.json(await locationHttpService.deleteUserHistory(uid));
        return;
      }
      const deletedCount =
        await locationService.deleteAllLocationHistoryEntries();
      res.json({deletedCount});
    } catch (error) {
      writeHttpError(res, error, "Delete all location history failed");
    }
  },
);

export const locationSetCleanupSchedule = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      assertLocationAdmin(user);
      const body = readJsonBody(req.body);
      const schedule = await locationService.updateCleanupSchedule({
        enabled: readBool(body.enabled, "enabled"),
        hour: readInteger(body.hour, "hour"),
        minute: readInteger(body.minute, "minute"),
        timezone: readTimezone(body.timezone, defaultLocationTimezone),
        updatedBy: user.uid,
      });
      res.json({schedule});
    } catch (error) {
      writeHttpError(res, error, "Set cleanup schedule failed");
    }
  },
);

export const locationSetUserInterval = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      assertLocationAdmin(user);
      const body = readJsonBody(req.body);
      res.json(await locationHttpService.setUserInterval({
        uid: readRequiredString(body.uid, "uid"),
        seconds: readIntervalSeconds(body),
      }));
    } catch (error) {
      writeHttpError(res, error, "Set user location interval failed");
    }
  },
);

export const locationSetGlobalInterval = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      assertLocationAdmin(user);
      const body = readJsonBody(req.body);
      const seconds = readIntervalSeconds(body);
      const updatedCount = await locationService.updateAllUsersLocationInterval(
        seconds,
      );
      res.json({
        seconds,
        minutes: Math.max(1, Math.ceil(seconds / 60)),
        updatedCount,
      });
    } catch (error) {
      writeHttpError(res, error, "Set global location interval failed");
    }
  },
);

type StreamRequest = {
  query: Record<string, unknown>;
  header: (name: string) => string | undefined;
  on: (event: "close", listener: () => void) => void;
};

type StreamResponse = {
  status: (code: number) => StreamResponse;
  setHeader: (name: string, value: string) => void;
  write: (chunk: string) => boolean;
  end: () => void;
  writableEnded: boolean;
  flushHeaders?: () => void;
};

function writeSseEvent(
  res: StreamResponse,
  event: string,
  payload: Record<string, unknown>,
): void {
  res.write(`event: ${event}\n`);
  res.write(`data: ${JSON.stringify(payload)}\n\n`);
}

function assertLocationStreamRequest(
  action: string,
  params: {uid?: string},
): void {
  if (
    action === "readInterval" ||
    action === "usersWithLocations" ||
    action === "anonymousUsers" ||
    action === "readCleanupSchedule" ||
    action === "readAnonymousUserCleanup" ||
    action === "readGlobalInterval"
  ) {
    return;
  }
  if (action === "history" && params.uid) return;
  throw new HttpError(
    400,
    "invalid-stream-action",
    "Invalid location stream action.",
  );
}

function readQueryString(value: unknown, field: string): string {
  const text = readOptionalQueryString(value);
  if (!text) {
    throw new HttpError(400, `invalid-${field}`, `The ${field} field is required.`);
  }
  return text;
}

function readOptionalQueryString(value: unknown): string | undefined {
  if (typeof value === "string" && value.trim().length > 0) {
    return value.trim();
  }
  if (Array.isArray(value) && typeof value[0] === "string") {
    const text = value[0].trim();
    return text.length > 0 ? text : undefined;
  }
  return undefined;
}

function readOptionalUid(value: unknown): string | null {
  return typeof value === "string" && value.trim().length > 0 ?
    value.trim() :
    null;
}

function readOptionalString(value: unknown): string | undefined {
  return typeof value === "string" && value.trim().length > 0 ?
    value.trim() :
    undefined;
}

function readLocationStatus(value: unknown): string {
  const status = readRequiredString(value, "status");
  if (
    status === "saved" ||
    status === "serviceDisabled" ||
    status === "permissionDenied" ||
    status === "permissionDeniedForever" ||
    status === "alwaysPermissionRequired" ||
    status === "unavailable"
  ) {
    return status;
  }
  throw new HttpError(400, "invalid-status", "The status field is invalid.");
}

function readRequiredString(value: unknown, field: string): string {
  if (typeof value !== "string" || value.trim().length === 0) {
    throw new HttpError(400, `invalid-${field}`, `The ${field} field is required.`);
  }
  return value.trim();
}

function readNumber(value: unknown, field: string): number {
  if (typeof value !== "number" || !Number.isFinite(value)) {
    throw new HttpError(400, `invalid-${field}`, `The ${field} field is invalid.`);
  }
  return value;
}

function readInteger(value: unknown, field: string): number {
  if (typeof value !== "number" || !Number.isInteger(value)) {
    throw new HttpError(400, `invalid-${field}`, `The ${field} field is invalid.`);
  }
  return value;
}

function readIntervalSeconds(data: {
  seconds?: unknown;
  minutes?: unknown;
  intervalSeconds?: unknown;
  intervalMinutes?: unknown;
}): number {
  const rawSeconds = data.seconds ?? data.intervalSeconds;
  if (rawSeconds != null) {
    return readBoundedInt(
      rawSeconds,
      "seconds",
      minLocationUpdateIntervalSeconds,
      maxLocationUpdateIntervalSeconds,
    );
  }

  const rawMinutes = data.minutes ?? data.intervalMinutes;
  if (rawMinutes != null) {
    const minutes = readInteger(rawMinutes, "minutes");
    const seconds = minutes * 60;
    if (
      seconds >= minLocationUpdateIntervalSeconds &&
      seconds <= maxLocationUpdateIntervalSeconds
    ) {
      return seconds;
    }
  }

  throw new HttpError(
    400,
    "invalid-interval",
    "The seconds field is required.",
  );
}

function readBool(value: unknown, field: string): boolean {
  if (typeof value !== "boolean") {
    throw new HttpError(400, `invalid-${field}`, `The ${field} field is invalid.`);
  }
  return value;
}

function readMap(value: unknown, field: string): Record<string, unknown> {
  if (value == null || typeof value !== "object" || Array.isArray(value)) {
    throw new HttpError(400, `invalid-${field}`, `The ${field} field is invalid.`);
  }
  return value as Record<string, unknown>;
}
