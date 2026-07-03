import {getAuth} from "firebase-admin/auth";
import {
  FieldPath,
  FieldValue,
  getFirestore,
  Timestamp,
} from "firebase-admin/firestore";

const userPageSize = 250;
const deleteBatchSize = 450;
const configPath = "settings/anonymousUserCleanup";

export type AnonymousUserCleanupResult = {
  scannedCount: number;
  deletedCount: number;
  skippedCount: number;
  authDeletedCount: number;
};

export type AnonymousUserCleanupConfig = {
  enabled: boolean;
  inactivityDays: number;
};

export class AnonymousUserCleanupService {
  async readConfig(): Promise<AnonymousUserCleanupConfig> {
    const snapshot = await getFirestore().doc(configPath).get();
    const data = snapshot.data() ?? {};
    return {
      enabled: data.enabled !== false,
      inactivityDays: readPositiveInt(data.inactivityDays, 7),
    };
  }

  async updateConfig(params: {
    enabled: boolean;
    updatedBy?: string;
  }): Promise<AnonymousUserCleanupConfig> {
    await getFirestore().doc(configPath).set(
      {
        enabled: params.enabled,
        inactivityDays: 7,
        updatedAt: FieldValue.serverTimestamp(),
        updatedBy: params.updatedBy,
      },
      {merge: true},
    );
    return {enabled: params.enabled, inactivityDays: 7};
  }

  async markRun(params: {
    deletedCount: number;
    scannedCount: number;
    skippedCount: number;
    authDeletedCount: number;
  }): Promise<void> {
    await getFirestore().doc(configPath).set(
      {
        lastRunAt: FieldValue.serverTimestamp(),
        lastDeletedCount: params.deletedCount,
        lastScannedCount: params.scannedCount,
        lastSkippedCount: params.skippedCount,
        lastAuthDeletedCount: params.authDeletedCount,
      },
      {merge: true},
    );
  }

  async deleteInactiveAnonymousUsers(params: {
    inactiveSince: Date;
  }): Promise<AnonymousUserCleanupResult> {
    const firestore = getFirestore();
    const cutoffMs = params.inactiveSince.getTime();
    let lastDocument:
      FirebaseFirestore.QueryDocumentSnapshot<FirebaseFirestore.DocumentData> |
      undefined;
    let scannedCount = 0;
    let deletedCount = 0;
    let skippedCount = 0;
    let authDeletedCount = 0;

    while (true) {
      let query = firestore
        .collection("users")
        .where("isAnonymous", "==", true)
        .orderBy(FieldPath.documentId())
        .limit(userPageSize);
      if (lastDocument) query = query.startAfter(lastDocument);

      const snapshot = await query.get();
      if (snapshot.empty) {
        return {scannedCount, deletedCount, skippedCount, authDeletedCount};
      }

      lastDocument = snapshot.docs[snapshot.docs.length - 1];
      for (const doc of snapshot.docs) {
        scannedCount += 1;
        const lastActivityAt = readLastActivityAt(doc.data());
        if (lastActivityAt == null || lastActivityAt.getTime() >= cutoffMs) {
          skippedCount += 1;
          continue;
        }

        authDeletedCount += await deleteFirebaseAuthAnonymousUser(doc.id);
        await deleteDocumentTree(doc.ref);
        deletedCount += 1;
      }
    }
  }
}

export function anonymousUserCleanupConfigPath(): string {
  return configPath;
}

function readPositiveInt(value: unknown, fallback: number): number {
  if (typeof value !== "number" || !Number.isInteger(value) || value < 1) {
    return fallback;
  }
  return value;
}

function readLastActivityAt(
  data: FirebaseFirestore.DocumentData,
): Date | null {
  return readTimestampDate(data.lastSeenAt) ??
    readTimestampDate(data.lastOpenedAt) ??
    readTimestampDate(data.updatedAt);
}

function readTimestampDate(value: unknown): Date | null {
  if (value instanceof Timestamp) return value.toDate();
  if (value instanceof Date) return value;
  if (typeof value === "string") {
    const date = new Date(value);
    return Number.isNaN(date.getTime()) ? null : date;
  }
  return null;
}

async function deleteFirebaseAuthAnonymousUser(uid: string): Promise<number> {
  try {
    const user = await getAuth().getUser(uid);
    const isAnonymousAuthUser =
      !user.email &&
      user.providerData.length === 0 &&
      !user.phoneNumber;
    if (!isAnonymousAuthUser) return 0;
    await getAuth().deleteUser(uid);
    return 1;
  } catch (error) {
    if (isFirebaseAuthNotFound(error)) return 0;
    throw error;
  }
}

function isFirebaseAuthNotFound(error: unknown): boolean {
  return Boolean(
    error &&
      typeof error === "object" &&
      "code" in error &&
      error.code === "auth/user-not-found",
  );
}

async function deleteDocumentTree(
  ref: FirebaseFirestore.DocumentReference,
): Promise<void> {
  const childCollections = await ref.listCollections();
  for (const collection of childCollections) {
    await deleteCollection(collection);
  }
  await ref.delete();
}

async function deleteCollection(
  collection: FirebaseFirestore.CollectionReference,
): Promise<void> {
  while (true) {
    const snapshot = await collection
      .orderBy(FieldPath.documentId())
      .limit(deleteBatchSize)
      .get();
    if (snapshot.empty) return;

    for (const doc of snapshot.docs) {
      await deleteDocumentTree(doc.ref);
    }
  }
}
