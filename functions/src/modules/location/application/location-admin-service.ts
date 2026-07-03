import {getAuth} from "firebase-admin/auth";
import {FieldPath, FieldValue, getFirestore} from "firebase-admin/firestore";
import {HttpsError} from "firebase-functions/v2/https";

import {bootstrapLocationAdminEmails} from "../../../config/env";
import {
  normalizeEmail,
  readStoredInt,
} from "../../../shared/validation/primitives";
import {
  AdminAccessResponse,
  CallableAuthContext,
  LocationHistoryCleanupSchedule,
} from "../domain/location.types";

const locationHistoryCleanupConfigPath = "settings/locationHistoryCleanup";
const defaultLocationHistoryCleanupHour = 6;
const defaultLocationHistoryCleanupMinute = 0;
const defaultLocationHistoryCleanupTimezone = "America/Panama";
const cleanupBatchSize = 450;
const locationTrackingSettingsPath = "settings/locationTracking";
const userBatchSize = 450;

export class LocationAdminService {
  bootstrapEmails(): Set<string> {
    return new Set(
      bootstrapLocationAdminEmails
        .value()
        .split(",")
        .map((email) => normalizeEmail(email))
        .filter((email): email is string => email != null),
    );
  }

  canManageDashboardAccess(token: Record<string, unknown>): boolean {
    return token.admin === true || token.locationAdmin === true;
  }

  assertDashboardAdmin(auth: CallableAuthContext): void {
    if (!auth) {
      throw new HttpsError("unauthenticated", "Authentication is required.");
    }
    if (!this.canManageDashboardAccess(auth.token)) {
      throw new HttpsError(
        "permission-denied",
        "Only admins can manage location history cleanup.",
      );
    }
  }

  async setDashboardClaim(
    uid: string,
    enabled: boolean,
  ): Promise<AdminAccessResponse> {
    const auth = getAuth();
    const user = await auth.getUser(uid);
    const claims = {...(user.customClaims ?? {})};

    if (enabled) {
      claims.locationAdmin = true;
    } else {
      delete claims.locationAdmin;
    }

    await auth.setCustomUserClaims(uid, claims);
    return {
      uid,
      email: user.email,
      claims,
    };
  }

  async deleteAllLocationHistoryEntries(): Promise<number> {
    const firestore = getFirestore();
    let deletedCount = 0;

    while (true) {
      const snapshot = await firestore
        .collectionGroup("locationHistory")
        .limit(cleanupBatchSize)
        .get();
      if (snapshot.empty) return deletedCount;

      const batch = firestore.batch();
      for (const doc of snapshot.docs) {
        batch.delete(doc.ref);
      }
      await batch.commit();
      deletedCount += snapshot.size;
    }
  }

  async updateCleanupSchedule(params: {
    enabled: boolean;
    hour: number;
    minute: number;
    timezone: string;
    updatedBy?: string;
  }): Promise<LocationHistoryCleanupSchedule> {
    await getFirestore()
      .doc(locationHistoryCleanupConfigPath)
      .set(
        {
          enabled: params.enabled,
          hour: params.hour,
          minute: params.minute,
          timezone: params.timezone,
          updatedAt: FieldValue.serverTimestamp(),
          updatedBy: params.updatedBy,
        },
        {merge: true},
      );

    return {
      enabled: params.enabled,
      hour: params.hour,
      minute: params.minute,
      timezone: params.timezone,
    };
  }

  async updateAllUsersLocationInterval(seconds: number): Promise<number> {
    const firestore = getFirestore();
    const timestamp = FieldValue.serverTimestamp();
    const minutes = Math.max(1, Math.ceil(seconds / 60));
    await firestore.doc(locationTrackingSettingsPath).set(
      {
        locationUpdateIntervalSeconds: seconds,
        locationUpdateIntervalMinutes: minutes,
        updatedAt: timestamp,
      },
      {merge: true},
    );

    let updatedCount = 0;
    let lastDocument:
      FirebaseFirestore.QueryDocumentSnapshot<FirebaseFirestore.DocumentData> |
      undefined;

    while (true) {
      let query = firestore
        .collection("users")
        .orderBy(FieldPath.documentId())
        .limit(userBatchSize);
      if (lastDocument) {
        query = query.startAfter(lastDocument);
      }

      const snapshot = await query.get();
      if (snapshot.empty) return updatedCount;

      const batch = firestore.batch();
      for (const doc of snapshot.docs) {
        batch.set(
          doc.ref,
          {
            locationUpdateIntervalSeconds: seconds,
            locationUpdateIntervalMinutes: minutes,
            updatedAt: timestamp,
          },
          {merge: true},
        );
      }
      await batch.commit();
      updatedCount += snapshot.size;
      lastDocument = snapshot.docs[snapshot.docs.length - 1];
    }
  }

  async readCleanupSchedule(): Promise<LocationHistoryCleanupSchedule> {
    const snapshot = await getFirestore()
      .doc(locationHistoryCleanupConfigPath)
      .get();
    const data = snapshot.data() ?? {};

    return {
      enabled: data.enabled !== false,
      hour: readStoredInt(
        data.hour,
        defaultLocationHistoryCleanupHour,
        0,
        23,
      ),
      minute: readStoredInt(
        data.minute,
        defaultLocationHistoryCleanupMinute,
        0,
        59,
      ),
      timezone:
        typeof data.timezone === "string" && data.timezone.trim().length > 0 ?
          data.timezone.trim() :
          defaultLocationHistoryCleanupTimezone,
      lastRunKey:
        typeof data.lastRunKey === "string" ? data.lastRunKey : undefined,
    };
  }

  async markCleanupRun(params: {
    dateKey: string;
    deletedCount: number;
  }): Promise<void> {
    await getFirestore().doc(locationHistoryCleanupConfigPath).set(
      {
        lastRunAt: FieldValue.serverTimestamp(),
        lastRunKey: params.dateKey,
        lastDeletedCount: params.deletedCount,
      },
      {merge: true},
    );
  }
}

export const defaultLocationTimezone = defaultLocationHistoryCleanupTimezone;
export const minLocationUpdateIntervalSeconds = 10;
export const maxLocationUpdateIntervalSeconds = 7 * 24 * 60 * 60;
