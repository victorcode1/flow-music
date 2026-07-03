import {
  FieldPath,
  FieldValue,
  getFirestore,
  Timestamp,
} from "firebase-admin/firestore";

import {
  compareProfileRecords,
  compareUserLocationRecords,
  isAnonymousLike,
  locationIntervalResponse,
  readLocationIntervalSeconds,
  readStoredLocationIntervalSeconds,
  serializedFirestoreMap,
  serializeFirestoreValue,
} from "./location-serialization";

const locationTrackingSettingsPath = "settings/locationTracking";
const cleanupSchedulePath = "settings/locationHistoryCleanup";

export class LocationHttpService {
  async readUserInterval(uid: string): Promise<{
    seconds: number;
    minutes: number;
  }> {
    const firestore = getFirestore();
    const [user, global] = await Promise.all([
      firestore.collection("users").doc(uid).get(),
      firestore.doc(locationTrackingSettingsPath).get(),
    ]);
    const userData = user.data();
    const globalData = global.data();
    const userSeconds = readStoredLocationIntervalSeconds(
      userData?.locationUpdateIntervalSeconds,
      userData?.locationUpdateIntervalMinutes,
    );
    return locationIntervalResponse(
      userSeconds ??
        readLocationIntervalSeconds(
          globalData?.locationUpdateIntervalSeconds,
          globalData?.locationUpdateIntervalMinutes,
        ),
    );
  }

  async readGlobalInterval(): Promise<{
    seconds: number;
    minutes: number;
  }> {
    const snapshot = await getFirestore().doc(locationTrackingSettingsPath).get();
    const data = snapshot.data();
    return locationIntervalResponse(
      readLocationIntervalSeconds(
        data?.locationUpdateIntervalSeconds,
        data?.locationUpdateIntervalMinutes,
      ),
    );
  }

  async usersWithLocations(): Promise<{users: unknown[]}> {
    const snapshot = await getFirestore()
      .collection("users")
      .where("hasLocation", "==", true)
      .get();
    const users = snapshot.docs
      .map((doc) => ({id: doc.id, ...serializedFirestoreMap(doc.data())}))
      .sort(compareUserLocationRecords);
    return {users};
  }

  async anonymousUsers(): Promise<{users: unknown[]}> {
    const snapshot = await getFirestore().collection("users").get();
    const users = snapshot.docs
      .map((doc) => ({id: doc.id, ...serializedFirestoreMap(doc.data())}))
      .filter(isAnonymousLike)
      .sort(compareProfileRecords);
    return {users};
  }

  async history(uid: string): Promise<{items: unknown[]}> {
    const snapshot = await getFirestore()
      .collection("users")
      .doc(uid)
      .collection("locationHistory")
      .orderBy("createdAt", "desc")
      .limit(100)
      .get();
    return {
      items: snapshot.docs.map((doc) => ({
        id: doc.id,
        ...serializedFirestoreMap(doc.data()),
      })),
    };
  }

  async cleanupSchedule(): Promise<{schedule: unknown}> {
    const snapshot = await getFirestore().doc(cleanupSchedulePath).get();
    return {schedule: serializeFirestoreValue(snapshot.data() ?? {})};
  }

  async deleteHistoryEntry(params: {
    uid: string;
    entryId: string;
  }): Promise<{ok: true}> {
    await getFirestore()
      .collection("users")
      .doc(params.uid)
      .collection("locationHistory")
      .doc(params.entryId)
      .delete();
    return {ok: true};
  }

  async deleteUserHistory(uid: string): Promise<{deletedCount: number}> {
    const collectionPath = `users/${uid}/locationHistory`;
    return {deletedCount: await deleteCollection(collectionPath)};
  }

  async setUserInterval(params: {
    uid: string;
    seconds: number;
  }): Promise<{ok: true}> {
    const seconds = readLocationIntervalSeconds(params.seconds);
    await getFirestore().collection("users").doc(params.uid).set(
      {
        locationUpdateIntervalSeconds: seconds,
        locationUpdateIntervalMinutes: Math.max(1, Math.ceil(seconds / 60)),
        updatedAt: FieldValue.serverTimestamp(),
      },
      {merge: true},
    );
    return {ok: true};
  }

  async saveIfDue(params: {
    uid: string;
    intervalSeconds: number;
    latitude: number;
    longitude: number;
    source: string | undefined;
    positionCapturedAt: string | undefined;
    user: Record<string, unknown>;
  }): Promise<{saved: boolean}> {
    const userRef = getFirestore().collection("users").doc(params.uid);
    const snapshot = await userRef.get();
    const lastLocation = snapshot.data()?.lastLocation;
    const lastUpdatedAt =
      lastLocation != null && typeof lastLocation === "object" ?
        (lastLocation as Record<string, unknown>).updatedAt :
        null;

    if (lastUpdatedAt instanceof Timestamp) {
      const elapsedMs = Date.now() - lastUpdatedAt.toMillis();
      if (
        elapsedMs <
        readLocationIntervalSeconds(params.intervalSeconds) * 1000
      ) {
        return {saved: false};
      }
    }

    const timestamp = FieldValue.serverTimestamp();
    const currentLocation = removeUndefinedFields({
      latitude: params.latitude,
      longitude: params.longitude,
      updatedAt: timestamp,
      source: params.source,
      positionCapturedAt: params.positionCapturedAt,
    });
    const batch = getFirestore().batch();
    batch.set(
      userRef,
      removeUndefinedFields({
        email: params.user.email,
        displayName: params.user.displayName,
        photoUrl: params.user.photoUrl,
        isAnonymous: params.user.isAnonymous === true,
        lastLocation: currentLocation,
        locationStatus: {
          status: "saved",
          reason: params.source === "lastKnown" ? "last-known-fallback" : "current",
          updatedAt: timestamp,
        },
        hasLocation: true,
        updatedAt: timestamp,
      }),
      {merge: true},
    );
    batch.set(userRef.collection("locationHistory").doc(), {
      latitude: params.latitude,
      longitude: params.longitude,
      createdAt: timestamp,
    });
    await batch.commit();
    return {saved: true};
  }

  async reportLocationStatus(params: {
    uid: string;
    status: string;
    reason: string;
    user: Record<string, unknown>;
  }): Promise<{ok: true}> {
    await getFirestore().collection("users").doc(params.uid).set(
      removeUndefinedFields({
        email: params.user.email,
        displayName: params.user.displayName,
        photoUrl: params.user.photoUrl,
        isAnonymous: params.user.isAnonymous === true,
        locationStatus: {
          status: params.status,
          reason: params.reason,
          updatedAt: FieldValue.serverTimestamp(),
        },
        updatedAt: FieldValue.serverTimestamp(),
      }),
      {merge: true},
    );
    return {ok: true};
  }
}

async function deleteCollection(path: string): Promise<number> {
  const firestore = getFirestore();
  let deletedCount = 0;
  while (true) {
    const snapshot = await firestore
      .collection(path)
      .orderBy(FieldPath.documentId())
      .limit(450)
      .get();
    if (snapshot.empty) return deletedCount;
    const batch = firestore.batch();
    for (const doc of snapshot.docs) batch.delete(doc.ref);
    await batch.commit();
    deletedCount += snapshot.size;
  }
}

function removeUndefinedFields(data: Record<string, unknown>) {
  return Object.fromEntries(
    Object.entries(data).filter(([, value]) => value !== undefined),
  );
}
