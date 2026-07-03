import {HttpError} from "../../../shared/errors/http-error";

export function mapIdentityToolkitError(message: string): HttpError {
  const code = message.split(" : ")[0];
  switch (code) {
  case "EMAIL_EXISTS":
    return new HttpError(
      409,
      "email-already-in-use",
      "An account already exists with this email.",
    );
  case "EMAIL_NOT_FOUND":
  case "INVALID_PASSWORD":
  case "INVALID_LOGIN_CREDENTIALS":
    return new HttpError(
      401,
      "invalid-credential",
      "Invalid email or password.",
    );
  case "USER_DISABLED":
    return new HttpError(403, "user-disabled", "The account is disabled.");
  case "INVALID_REFRESH_TOKEN":
  case "TOKEN_EXPIRED":
    return new HttpError(401, "invalid-session", "The session is invalid.");
  case "TOO_MANY_ATTEMPTS_TRY_LATER":
    return new HttpError(
      429,
      "too-many-requests",
      "Too many attempts. Try again later.",
    );
  case "OPERATION_NOT_ALLOWED":
    return new HttpError(
      403,
      "operation-not-allowed",
      "The requested authentication provider is not enabled.",
    );
  case "INVALID_IDP_RESPONSE":
  case "INVALID_ID_TOKEN":
  case "INVALID_OAUTH_RESPONSE":
    return new HttpError(
      401,
      "invalid-google-token",
      "The Google token is invalid.",
    );
  default:
    return new HttpError(400, "auth-request-failed", message);
  }
}

export function mapAdminAuthError(code: string): HttpError {
  switch (code) {
  case "auth/email-already-exists":
    return new HttpError(
      409,
      "email-already-in-use",
      "An account already exists with this email.",
    );
  case "auth/invalid-email":
    return new HttpError(400, "invalid-email", "The email is invalid.");
  case "auth/invalid-password":
    return new HttpError(
      400,
      "weak-password",
      "The password must have at least 6 characters.",
    );
  default:
    return new HttpError(500, "auth-admin-failed", code);
  }
}
