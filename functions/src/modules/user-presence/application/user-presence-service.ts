import {FieldValue, getFirestore} from "firebase-admin/firestore";

export class UserPresenceService {
  async startSession(params: {
    uid: string;
    sessionId: string;
    user: Record<string, unknown>;
    metadata: Record<string, unknown>;
  }): Promise<{ok: true}> {
    const timestamp = FieldValue.serverTimestamp();
    const userRef = getFirestore().collection("users").doc(params.uid);
    const sessionRef = userRef.collection("sessions").doc(params.sessionId);
    const userData = removeUndefinedFields({
      email: params.user.email,
      displayName: params.user.displayName,
      photoUrl: params.user.photoUrl,
      isAnonymous: params.user.isAnonymous === true,
      isOnline: true,
      appState: "foreground",
      activeSessionId: params.sessionId,
      lastOpenedAt: timestamp,
      lastSeenAt: timestamp,
      lastOnlineAt: timestamp,
      presenceUpdatedAt: timestamp,
      updatedAt: timestamp,
      openCount: FieldValue.increment(1),
      ...params.metadata,
    });
    const sessionData = removeUndefinedFields({
      startedAt: timestamp,
      lastSeenAt: timestamp,
      isActive: true,
      appState: "foreground",
      ...params.metadata,
    });

    const batch = getFirestore().batch();
    batch.set(userRef, userData, {merge: true});
    batch.set(sessionRef, sessionData, {merge: true});
    await batch.commit();
    return {ok: true};
  }

  async updatePresence(params: {
    uid: string;
    sessionId: string;
    isOnline: boolean;
    appState: string;
  }): Promise<{ok: true}> {
    const timestamp = FieldValue.serverTimestamp();
    const userRef = getFirestore().collection("users").doc(params.uid);
    const sessionRef = userRef.collection("sessions").doc(params.sessionId);
    const batch = getFirestore().batch();
    batch.set(
      userRef,
      {
        isOnline: params.isOnline,
        appState: params.appState,
        lastSeenAt: timestamp,
        presenceUpdatedAt: timestamp,
        updatedAt: timestamp,
        [params.isOnline ? "lastOnlineAt" : "lastOfflineAt"]: timestamp,
      },
      {merge: true},
    );
    batch.set(
      sessionRef,
      {
        isActive: params.isOnline,
        appState: params.appState,
        lastSeenAt: timestamp,
      },
      {merge: true},
    );
    await batch.commit();
    return {ok: true};
  }

  async endSession(params: {
    uid: string;
    sessionId: string;
    appState: string;
  }): Promise<{ok: true}> {
    const timestamp = FieldValue.serverTimestamp();
    const userRef = getFirestore().collection("users").doc(params.uid);
    const sessionRef = userRef.collection("sessions").doc(params.sessionId);
    const batch = getFirestore().batch();
    batch.set(
      userRef,
      {
        isOnline: false,
        appState: params.appState,
        lastSeenAt: timestamp,
        lastOfflineAt: timestamp,
        presenceUpdatedAt: timestamp,
        updatedAt: timestamp,
        activeSessionId: FieldValue.delete(),
      },
      {merge: true},
    );
    batch.set(
      sessionRef,
      {
        isActive: false,
        appState: params.appState,
        lastSeenAt: timestamp,
        endedAt: timestamp,
      },
      {merge: true},
    );
    await batch.commit();
    return {ok: true};
  }
}

function removeUndefinedFields(data: Record<string, unknown>) {
  return Object.fromEntries(
    Object.entries(data).filter(([, value]) => value !== undefined),
  );
}
