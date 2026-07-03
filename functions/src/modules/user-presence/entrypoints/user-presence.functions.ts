import {onRequest} from "firebase-functions/v2/https";

import {verifyHttpUser} from "../../../shared/auth/http-auth";
import {HttpError} from "../../../shared/errors/http-error";
import {
  publicHttpOptions,
  readJsonBody,
  requirePost,
  writeHttpError,
} from "../../../shared/http/http-endpoint";
import {UserPresenceService} from "../application/user-presence-service";

const service = new UserPresenceService();

export const userPresenceApi = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      switch (body.action) {
      case "start":
        res.json(await service.startSession({
          uid: user.uid,
          sessionId: readRequiredString(body.sessionId, "sessionId"),
          user: readMap(body.user, "user"),
          metadata: readMap(body.metadata, "metadata"),
        }));
        return;
      case "update":
        res.json(await service.updatePresence({
          uid: user.uid,
          sessionId: readRequiredString(body.sessionId, "sessionId"),
          isOnline: readBool(body.isOnline, "isOnline"),
          appState: readRequiredString(body.appState, "appState"),
        }));
        return;
      case "end":
        res.json(await service.endSession({
          uid: user.uid,
          sessionId: readRequiredString(body.sessionId, "sessionId"),
          appState: readRequiredString(body.appState, "appState"),
        }));
        return;
      default:
        throw new HttpError(400, "invalid-action", "Invalid presence action.");
      }
    } catch (error) {
      writeHttpError(res, error, "Presence API failed");
    }
  },
);

export const userPresenceStart = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      res.json(await service.startSession({
        uid: user.uid,
        sessionId: readRequiredString(body.sessionId, "sessionId"),
        user: readMap(body.user, "user"),
        metadata: readMap(body.metadata, "metadata"),
      }));
    } catch (error) {
      writeHttpError(res, error, "Presence start failed");
    }
  },
);

export const userPresenceUpdate = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      res.json(await service.updatePresence({
        uid: user.uid,
        sessionId: readRequiredString(body.sessionId, "sessionId"),
        isOnline: readBool(body.isOnline, "isOnline"),
        appState: readRequiredString(body.appState, "appState"),
      }));
    } catch (error) {
      writeHttpError(res, error, "Presence update failed");
    }
  },
);

export const userPresenceEnd = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      res.json(await service.endSession({
        uid: user.uid,
        sessionId: readRequiredString(body.sessionId, "sessionId"),
        appState: readRequiredString(body.appState, "appState"),
      }));
    } catch (error) {
      writeHttpError(res, error, "Presence end failed");
    }
  },
);

export const userPresenceDeleteAnonymousData = onRequest(
  publicHttpOptions,
  async (_req, res): Promise<void> => {
    res.status(410).json({
      code: "unsupported",
      message: "Anonymous cleanup is not exposed from the public client.",
    });
  },
);

function readRequiredString(value: unknown, field: string): string {
  if (typeof value !== "string" || value.trim().length === 0) {
    throw new HttpError(400, `invalid-${field}`, `The ${field} field is required.`);
  }
  return value.trim();
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
