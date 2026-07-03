import {authWebApiKey} from "../../../config/env";
import {HttpError} from "../../../shared/errors/http-error";
import {
  IdentityToolkitError,
  IdentityToolkitSessionResponse,
  SecureTokenResponse,
} from "../dto/auth.dto";
import {mapIdentityToolkitError} from "../domain/auth-errors";

const identityToolkitBaseUrl = "https://identitytoolkit.googleapis.com/v1";
const secureTokenBaseUrl = "https://securetoken.googleapis.com/v1";

export class IdentityToolkitClient {
  signInWithPassword(
    email: string,
    password: string,
  ): Promise<IdentityToolkitSessionResponse> {
    return this.post<IdentityToolkitSessionResponse>(
      `${identityToolkitBaseUrl}/accounts:signInWithPassword`,
      {
        email,
        password,
        returnSecureToken: true,
      },
    );
  }

  refreshSession(refreshToken: string): Promise<SecureTokenResponse> {
    return this.post<SecureTokenResponse>(
      `${secureTokenBaseUrl}/token`,
      {
        grant_type: "refresh_token",
        refresh_token: refreshToken,
      },
    );
  }

  signInWithGoogleIdToken(
    googleIdToken: string,
  ): Promise<IdentityToolkitSessionResponse> {
    const postBody = new URLSearchParams({
      id_token: googleIdToken,
      providerId: "google.com",
    });

    return this.post<IdentityToolkitSessionResponse>(
      `${identityToolkitBaseUrl}/accounts:signInWithIdp`,
      {
        postBody: postBody.toString(),
        requestUri: "http://localhost",
        returnIdpCredential: false,
        returnSecureToken: true,
      },
    );
  }

  async sendPasswordReset(email: string): Promise<void> {
    await this.post<unknown>(
      `${identityToolkitBaseUrl}/accounts:sendOobCode`,
      {
        requestType: "PASSWORD_RESET",
        email,
      },
    );
  }

  private async post<T>(
    url: string,
    body: Record<string, unknown>,
  ): Promise<T> {
    const key = authWebApiKey.value().trim();
    if (key.length === 0) {
      throw new HttpError(
        500,
        "auth-api-key-missing",
        "AUTH_WEB_API_KEY is not configured.",
      );
    }

    const response = await fetch(`${url}?key=${encodeURIComponent(key)}`, {
      method: "POST",
      headers: {"content-type": "application/json"},
      body: JSON.stringify(body),
    });
    const json = await response.json() as T | IdentityToolkitError;
    if (!response.ok) {
      const errorJson = json as IdentityToolkitError;
      const message =
        typeof errorJson.error?.message === "string" ?
          errorJson.error.message :
          "AUTH_REQUEST_FAILED";
      throw mapIdentityToolkitError(message);
    }
    return json as T;
  }
}
