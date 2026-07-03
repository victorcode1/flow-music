export type AuthHttpRequest = {
  email?: unknown;
  password?: unknown;
  displayName?: unknown;
  refreshToken?: unknown;
  googleIdToken?: unknown;
};

export type AuthUserResponse = {
  id: string;
  email?: string;
  displayName?: string;
  photoUrl?: string;
  isAnonymous: boolean;
  claims: Record<string, unknown>;
};

export type AuthSessionResponse = {
  idToken: string;
  refreshToken: string;
  expiresIn: number;
  expiresAt: number;
};

export type AuthResponse = {
  user: AuthUserResponse;
  session: AuthSessionResponse;
};

export type IdentityToolkitSessionResponse = {
  localId: string;
  email?: string;
  displayName?: string;
  photoUrl?: string;
  idToken: string;
  refreshToken: string;
  expiresIn: string;
};

export type SecureTokenResponse = {
  user_id: string;
  id_token: string;
  refresh_token: string;
  expires_in: string;
};

export type IdentityToolkitError = {
  error?: {
    message?: string;
  };
};
