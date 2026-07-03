import {onRequest} from "firebase-functions/v2/https";

import {verifyHttpUser} from "../../../shared/auth/http-auth";
import {HttpError} from "../../../shared/errors/http-error";
import {
  publicHttpOptions,
  readJsonBody,
  requirePost,
  writeHttpError,
} from "../../../shared/http/http-endpoint";
import {readResource, UserDataService} from "../application/user-data-service";

const service = new UserDataService();

export const userDataApi = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      switch (body.action) {
      case "read":
        res.json(await service.read(user.uid, readResource(body.resource)));
        return;
      case "upsert":
        res.json(await service.upsert({
          uid: user.uid,
          resource: readResource(body.resource),
          id: readRequiredString(body.id, "id"),
          data: readMap(body.data, "data"),
        }));
        return;
      case "delete":
        res.json(await service.delete({
          uid: user.uid,
          resource: readResource(body.resource),
          id: readRequiredString(body.id, "id"),
        }));
        return;
      case "replaceAll":
        res.json(await service.replaceAll({
          uid: user.uid,
          resource: readResource(body.resource),
          items: readItems(body.items),
        }));
        return;
      default:
        throw new HttpError(400, "invalid-action", "Invalid user data action.");
      }
    } catch (error) {
      writeHttpError(res, error, "User data API failed");
    }
  },
);

export const userDataRead = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      res.json(await service.read(user.uid, readResource(body.resource)));
    } catch (error) {
      writeHttpError(res, error, "User data read failed");
    }
  },
);

export const userDataUpsert = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      const data = readMap(body.data, "data");
      res.json(await service.upsert({
        uid: user.uid,
        resource: readResource(body.resource),
        id: readRequiredString(body.id, "id"),
        data,
      }));
    } catch (error) {
      writeHttpError(res, error, "User data upsert failed");
    }
  },
);

export const userDataDelete = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      res.json(await service.delete({
        uid: user.uid,
        resource: readResource(body.resource),
        id: readRequiredString(body.id, "id"),
      }));
    } catch (error) {
      writeHttpError(res, error, "User data delete failed");
    }
  },
);

export const userDataReplaceAll = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      const items = readItems(body.items);
      res.json(await service.replaceAll({
        uid: user.uid,
        resource: readResource(body.resource),
        items,
      }));
    } catch (error) {
      writeHttpError(res, error, "User data replace all failed");
    }
  },
);

export const userDataWriteSettings = onRequest(
  publicHttpOptions,
  async (req, res): Promise<void> => {
    try {
      requirePost(req);
      const user = await verifyHttpUser(req);
      const body = readJsonBody(req.body);
      res.json(await service.writeSettings(
        user.uid,
        readMap(body.settings, "settings"),
      ));
    } catch (error) {
      writeHttpError(res, error, "User settings write failed");
    }
  },
);

function readRequiredString(value: unknown, field: string): string {
  if (typeof value !== "string" || value.trim().length === 0) {
    throw new HttpError(400, `invalid-${field}`, `The ${field} field is required.`);
  }
  return value.trim();
}

function readMap(value: unknown, field: string): Record<string, unknown> {
  if (value == null || typeof value !== "object" || Array.isArray(value)) {
    throw new HttpError(400, `invalid-${field}`, `The ${field} field is invalid.`);
  }
  return value as Record<string, unknown>;
}

function readItems(value: unknown): Record<string, unknown>[] {
  if (!Array.isArray(value)) {
    throw new HttpError(400, "invalid-items", "The items field must be a list.");
  }
  return value.map((item) => readMap(item, "items"));
}
