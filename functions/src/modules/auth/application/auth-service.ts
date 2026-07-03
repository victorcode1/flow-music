import {getAuth, type UserRecord} from "firebase-admin/auth";
import {FieldValue} from "firebase-admin/firestore";

import {HttpError} from "../../../shared/errors/http-error";
import {
  AuthResponse,
  AuthSessionResponse,
  AuthUserResponse,
  IdentityToolkitSessionResponse,
} from "../dto/auth.dto";
import {IdentityToolkitClient} from "../infrastructure/identity-toolkit-client";
import {UserProfileRepository} from "../infrastructure/user-profile-repository";

export class AuthService {
  constructor(
    private readonly identityToolkit = new IdentityToolkitClient(),
    private readonly userProfiles = new UserProfileRepository(),
  ) {}

  async registerWithEmail(params: {
    email: string;
    password: string;
    displayName?: string;
  }): Promise<AuthResponse> {
    const created = await getAuth().createUser({
      email: params.email,
      password: params.password,
      displayName: params.displayName,
      emailVerified: false,
      disabled: false,
    });
    await this.userProfiles.merge(created.uid, {
      email: params.email,
      displayName: params.displayName,
      isAnonymous: false,
      createdAt: FieldValue.serverTimestamp(),
      lastOpenedAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    });

    const session = await this.identityToolkit.signInWithPassword(
      params.email,
      params.password,
    );
    return this.buildAuthResponse(session);
  }

  async loginWithEmail(params: {
    email: string;
    password: string;
  }): Promise<AuthResponse> {
    const session = await this.identityToolkit.signInWithPassword(
      params.email,
      params.password,
    );
    await this.userProfiles.merge(session.localId, {
      email: session.email ?? params.email,
      displayName: session.displayName,
      isAnonymous: false,
      lastOpenedAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    });
    return this.buildAuthResponse(session);
  }

  async loginWithGoogleIdToken(googleIdToken: string): Promise<AuthResponse> {
    const session = await this.identityToolkit.signInWithGoogleIdToken(
      googleIdToken,
    );
    await this.userProfiles.merge(session.localId, {
      email: session.email,
      displayName: session.displayName,
      photoUrl: session.photoUrl,
      isAnonymous: false,
      lastOpenedAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    });
    return this.buildAuthResponse(session);
  }

  async refreshSession(refreshToken: string): Promise<AuthResponse> {
    const refreshed = await this.identityToolkit.refreshSession(refreshToken);
    return this.buildAuthResponse({
      localId: refreshed.user_id,
      idToken: refreshed.id_token,
      refreshToken: refreshed.refresh_token,
      expiresIn: refreshed.expires_in,
    });
  }

  async getCurrentUser(idToken: string): Promise<AuthUserResponse> {
    const decoded = await getAuth().verifyIdToken(idToken);
    const user = await getAuth().getUser(decoded.uid);
    return this.userToResponse(user.uid, user);
  }

  sendPasswordReset(email: string): Promise<void> {
    return this.identityToolkit.sendPasswordReset(email);
  }

  private async buildAuthResponse(
    session: IdentityToolkitSessionResponse,
  ): Promise<AuthResponse> {
    const user = await getAuth().getUser(session.localId);
    return {
      user: this.userToResponse(session.localId, user),
      session: this.sessionToResponse(session),
    };
  }

  private sessionToResponse(
    session: IdentityToolkitSessionResponse,
  ): AuthSessionResponse {
    const expiresIn = Number(session.expiresIn);
    if (!Number.isFinite(expiresIn)) {
      throw new HttpError(
        500,
        "invalid-auth-session",
        "Authentication provider returned an invalid session.",
      );
    }
    return {
      idToken: session.idToken,
      refreshToken: session.refreshToken,
      expiresIn,
      expiresAt: Date.now() + expiresIn * 1000,
    };
  }

  private userToResponse(uid: string, user: UserRecord): AuthUserResponse {
    return {
      id: uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
      isAnonymous: false,
      claims: user.customClaims ?? {},
    };
  }
}
