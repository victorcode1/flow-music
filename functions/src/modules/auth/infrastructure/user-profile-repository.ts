import {getFirestore} from "firebase-admin/firestore";

export class UserProfileRepository {
  async merge(uid: string, data: Record<string, unknown>): Promise<void> {
    await getFirestore()
      .collection("users")
      .doc(uid)
      .set(removeUndefinedFields(data), {merge: true});
  }
}

function removeUndefinedFields(
  data: Record<string, unknown>,
): Record<string, unknown> {
  return Object.fromEntries(
    Object.entries(data).filter(([, value]) => value !== undefined),
  );
}
