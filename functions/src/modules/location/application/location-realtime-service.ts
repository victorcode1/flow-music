import {getFirestore} from "firebase-admin/firestore";

import {HttpError} from "../../../shared/errors/http-error";
import {
  anonymousUserCleanupConfigPath,
} from "../../maintenance/application/anonymous-user-cleanup-service";
import {
  compareProfileRecords,
  compareUserLocationRecords,
  isAnonymousLike,
  defaultLocationUpdateIntervalSeconds,
  locationIntervalResponse,
  readStoredLocationIntervalSeconds,
  serializedFirestoreMap,
  serializeFirestoreValue,
} from "./location-serialization";

const locationTrackingSettingsPath = "settings/locationTracking";
const cleanupSchedulePath = "settings/locationHistoryCleanup";

export type LocationStreamAction =
  "readInterval" |
  "usersWithLocations" |
  "anonymousUsers" |
  "history" |
  "readCleanupSchedule" |
  "readAnonymousUserCleanup" |
  "readGlobalInterval";

export type LocationStreamParams = {
  uid?: string;
};

export type LocationStreamPayload = Record<string, unknown>;
export type LocationStreamUnsubscribe = () => void;

export class LocationRealtimeService {
  openStream(params: {
    action: string;
    params: LocationStreamParams;
    send: (payload: LocationStreamPayload) => void;
    fail: (error: unknown) => void;
  }): LocationStreamUnsubscribe {
    switch (params.action as LocationStreamAction) {
    case "readInterval":
      return this.watchUserInterval(
        readRequiredUid(params.params.uid),
        params.send,
        params.fail,
      );
    case "usersWithLocations":
      return this.watchUsersWithLocations(params.send, params.fail);
    case "anonymousUsers":
      return this.watchAnonymousUsers(params.send, params.fail);
    case "history":
      return this.watchHistory(
        readRequiredUid(params.params.uid),
        params.send,
        params.fail,
      );
    case "readCleanupSchedule":
      return this.watchCleanupSchedule(params.send, params.fail);
    case "readAnonymousUserCleanup":
      return this.watchAnonymousUserCleanup(params.send, params.fail);
    case "readGlobalInterval":
      return this.watchGlobalInterval(params.send, params.fail);
    default:
      throw new HttpError(
        400,
        "invalid-stream-action",
        "Invalid location stream action.",
      );
    }
  }

  private watchUserInterval(
    uid: string,
    send: (payload: LocationStreamPayload) => void,
    fail: (error: unknown) => void,
  ): LocationStreamUnsubscribe {
    let userIntervalSeconds: number | undefined;
    let globalIntervalSeconds: number | undefined;
    let lastSeconds: number | undefined;

    const emit = () => {
      const seconds =
        userIntervalSeconds ??
        globalIntervalSeconds ??
        defaultLocationUpdateIntervalSeconds;
      if (seconds === lastSeconds) return;
      lastSeconds = seconds;
      send(locationIntervalResponse(seconds));
    };

    const unsubscribeUser = getFirestore()
      .collection("users")
      .doc(uid)
      .onSnapshot((snapshot) => {
        const data = snapshot.data();
        userIntervalSeconds = readStoredLocationIntervalSeconds(
          data?.locationUpdateIntervalSeconds,
          data?.locationUpdateIntervalMinutes,
        );
        emit();
      }, fail);
    const unsubscribeGlobal = getFirestore()
      .doc(locationTrackingSettingsPath)
      .onSnapshot((snapshot) => {
        const data = snapshot.data();
        globalIntervalSeconds = readStoredLocationIntervalSeconds(
          data?.locationUpdateIntervalSeconds,
          data?.locationUpdateIntervalMinutes,
        );
        emit();
      }, fail);

    return () => {
      unsubscribeUser();
      unsubscribeGlobal();
    };
  }

  private watchUsersWithLocations(
    send: (payload: LocationStreamPayload) => void,
    fail: (error: unknown) => void,
  ): LocationStreamUnsubscribe {
    return getFirestore()
      .collection("users")
      .where("hasLocation", "==", true)
      .onSnapshot((snapshot) => {
        const users = snapshot.docs
          .map((doc) => ({id: doc.id, ...serializedFirestoreMap(doc.data())}))
          .sort(compareUserLocationRecords);
        send({users});
      }, fail);
  }

  private watchAnonymousUsers(
    send: (payload: LocationStreamPayload) => void,
    fail: (error: unknown) => void,
  ): LocationStreamUnsubscribe {
    return getFirestore().collection("users").onSnapshot((snapshot) => {
      const users = snapshot.docs
        .map((doc) => ({id: doc.id, ...serializedFirestoreMap(doc.data())}))
        .filter(isAnonymousLike)
        .sort(compareProfileRecords);
      send({users});
    }, fail);
  }

  private watchHistory(
    uid: string,
    send: (payload: LocationStreamPayload) => void,
    fail: (error: unknown) => void,
  ): LocationStreamUnsubscribe {
    return getFirestore()
      .collection("users")
      .doc(uid)
      .collection("locationHistory")
      .orderBy("createdAt", "desc")
      .limit(100)
      .onSnapshot((snapshot) => {
        send({
          items: snapshot.docs.map((doc) => ({
            id: doc.id,
            ...serializedFirestoreMap(doc.data()),
          })),
        });
      }, fail);
  }

  private watchCleanupSchedule(
    send: (payload: LocationStreamPayload) => void,
    fail: (error: unknown) => void,
  ): LocationStreamUnsubscribe {
    return getFirestore().doc(cleanupSchedulePath).onSnapshot((snapshot) => {
      send({schedule: serializeFirestoreValue(snapshot.data() ?? {})});
    }, fail);
  }

  private watchAnonymousUserCleanup(
    send: (payload: LocationStreamPayload) => void,
    fail: (error: unknown) => void,
  ): LocationStreamUnsubscribe {
    return getFirestore()
      .doc(anonymousUserCleanupConfigPath())
      .onSnapshot((snapshot) => {
        const data = snapshot.data() ?? {};
        send({
          config: {
            enabled: data.enabled !== false,
            inactivityDays: readInactivityDays(data.inactivityDays),
            lastRunAt: serializeFirestoreValue(data.lastRunAt),
            lastDeletedCount: data.lastDeletedCount,
          },
        });
      }, fail);
  }

  private watchGlobalInterval(
    send: (payload: LocationStreamPayload) => void,
    fail: (error: unknown) => void,
  ): LocationStreamUnsubscribe {
    return getFirestore()
      .doc(locationTrackingSettingsPath)
      .onSnapshot((snapshot) => {
        const data = snapshot.data();
        send(locationIntervalResponse(
          readStoredLocationIntervalSeconds(
            data?.locationUpdateIntervalSeconds,
            data?.locationUpdateIntervalMinutes,
          ) ?? defaultLocationUpdateIntervalSeconds,
        ));
      }, fail);
  }
}

function readRequiredUid(value: string | undefined): string {
  if (typeof value !== "string" || value.trim().length === 0) {
    throw new HttpError(400, "invalid-uid", "The uid field is required.");
  }
  return value.trim();
}

function readInactivityDays(value: unknown): number {
  if (typeof value !== "number" || !Number.isInteger(value) || value < 1) {
    return 7;
  }
  return value;
}
