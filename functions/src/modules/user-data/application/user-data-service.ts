import {
  FieldPath,
  getFirestore,
  Timestamp,
} from "firebase-admin/firestore";

import {HttpError} from "../../../shared/errors/http-error";

type UserDataResource =
  "favorites" |
  "playlists" |
  "radioFavorites" |
  "radioPlaylists" |
  "settings";

const collectionResources = new Set<UserDataResource>([
  "favorites",
  "playlists",
  "radioFavorites",
  "radioPlaylists",
]);

export class UserDataService {
  async read(uid: string, resource: UserDataResource): Promise<unknown> {
    if (resource === "settings") {
      const snapshot = await settingsRef(uid).get();
      return {settings: serializeFirestoreValue(snapshot.data() ?? null)};
    }

    assertCollectionResource(resource);
    const snapshot = await userCollection(uid, resource).get();
    const items = snapshot.docs.map((doc) => ({
      id: doc.id,
      ...serializedMap(doc.data()),
    }));
    return {items};
  }

  async upsert(params: {
    uid: string;
    resource: UserDataResource;
    id: string;
    data: Record<string, unknown>;
  }): Promise<{ok: true}> {
    if (params.resource === "settings") {
      await this.writeSettings(params.uid, params.data);
      return {ok: true};
    }

    assertCollectionResource(params.resource);
    await userCollection(params.uid, params.resource)
      .doc(sanitizeDocId(params.id))
      .set(removeUndefinedFields(params.data), {merge: true});
    return {ok: true};
  }

  async delete(params: {
    uid: string;
    resource: UserDataResource;
    id: string;
  }): Promise<{ok: true}> {
    assertCollectionResource(params.resource);
    await userCollection(params.uid, params.resource)
      .doc(sanitizeDocId(params.id))
      .delete();
    return {ok: true};
  }

  async replaceAll(params: {
    uid: string;
    resource: UserDataResource;
    items: Record<string, unknown>[];
  }): Promise<{count: number}> {
    assertCollectionResource(params.resource);
    const col = userCollection(params.uid, params.resource);
    await deleteCollection(col.path);

    const firestore = getFirestore();
    let count = 0;
    for (const chunk of chunks(params.items, 450)) {
      const batch = firestore.batch();
      for (const item of chunk) {
        const id = idFor(params.resource, item);
        if (!id) continue;
        batch.set(col.doc(sanitizeDocId(id)), removeUndefinedFields(item));
        count++;
      }
      await batch.commit();
    }
    return {count};
  }

  async writeSettings(
    uid: string,
    settings: Record<string, unknown>,
  ): Promise<{ok: true}> {
    await settingsRef(uid).set(removeUndefinedFields(settings), {merge: true});
    return {ok: true};
  }
}

export function readResource(value: unknown): UserDataResource {
  if (
    value === "favorites" ||
    value === "playlists" ||
    value === "radioFavorites" ||
    value === "radioPlaylists" ||
    value === "settings"
  ) {
    return value;
  }
  throw new HttpError(400, "invalid-resource", "Invalid resource.");
}

function assertCollectionResource(
  resource: UserDataResource,
): asserts resource is Exclude<UserDataResource, "settings"> {
  if (!collectionResources.has(resource)) {
    throw new HttpError(400, "invalid-resource", "Invalid collection resource.");
  }
}

function userCollection(uid: string, resource: Exclude<UserDataResource, "settings">) {
  return getFirestore().collection("users").doc(uid).collection(resource);
}

function settingsRef(uid: string) {
  return getFirestore()
    .collection("users")
    .doc(uid)
    .collection("profile")
    .doc("settings");
}

function idFor(resource: UserDataResource, data: Record<string, unknown>) {
  switch (resource) {
  case "favorites":
    return readString(data.videoId);
  case "playlists":
  case "radioPlaylists":
    return readString(data.id);
  case "radioFavorites":
    return readString(data.stationuuid) || readString(data.url_resolved) ||
      readString(data.url);
  case "settings":
    return null;
  }
}

function readString(value: unknown): string | null {
  return typeof value === "string" && value.trim().length > 0 ?
    value.trim() :
    null;
}

function sanitizeDocId(id: string): string {
  return id.replaceAll("/", "_");
}

async function deleteCollection(path: string): Promise<void> {
  const firestore = getFirestore();
  while (true) {
    const snapshot = await firestore
      .collection(path)
      .orderBy(FieldPath.documentId())
      .limit(450)
      .get();
    if (snapshot.empty) return;

    const batch = firestore.batch();
    for (const doc of snapshot.docs) batch.delete(doc.ref);
    await batch.commit();
  }
}

function chunks<T>(items: T[], size: number): T[][] {
  const result: T[][] = [];
  for (let i = 0; i < items.length; i += size) {
    result.push(items.slice(i, i + size));
  }
  return result;
}

function removeUndefinedFields(data: Record<string, unknown>) {
  return Object.fromEntries(
    Object.entries(data).filter(([, value]) => value !== undefined),
  );
}

function serializeFirestoreValue(value: unknown): unknown {
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

function serializedMap(value: Record<string, unknown>): Record<string, unknown> {
  return serializeFirestoreValue(value) as Record<string, unknown>;
}
