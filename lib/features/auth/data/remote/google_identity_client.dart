import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repositories/auth_repository.dart';

/// Client ID OAuth de tipo Web. En web `google_sign_in` v7 exige un clientId
/// explicito; en movil se resuelve con la configuracion nativa. Se inyecta con
/// `--dart-define=GOOGLE_WEB_CLIENT_ID=...apps.googleusercontent.com`.
const String _googleWebClientId = String.fromEnvironment(
  'GOOGLE_WEB_CLIENT_ID',
  defaultValue:
      '497161889607-1rnjaag9plnscd5nv4qhlnpchfh3si0h.apps.googleusercontent.com',
);

class GoogleIdentityClient {
  GoogleIdentityClient({GoogleSignIn? googleSignIn})
    : _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final GoogleSignIn _googleSignIn;
  bool _initialized = false;

  Stream<String> get idTokenEvents {
    return _googleSignIn.authenticationEvents
        .asyncMap((event) {
          return switch (event) {
            GoogleSignInAuthenticationEventSignIn(user: final user) =>
              _idTokenFor(user),
            GoogleSignInAuthenticationEventSignOut() => '',
          };
        })
        .where((idToken) => idToken.isNotEmpty);
  }

  Future<void> initialize() {
    return _initialize();
  }

  Future<String> requestIdToken() async {
    await _initialize();

    if (!_googleSignIn.supportsAuthenticate()) {
      throw const AuthException(
        'google-unsupported-platform',
        'Google no esta disponible en esta plataforma.',
      );
    }

    try {
      final account = await _googleSignIn.authenticate(
        scopeHint: const ['email', 'profile'],
      );
      final idToken = account.authentication.idToken;
      if (idToken == null || idToken.isEmpty) {
        throw const AuthException(
          'google-id-token-missing',
          'Google no devolvio un token valido.',
        );
      }
      return idToken;
    } on GoogleSignInException catch (error) {
      throw AuthException(
        _codeForGoogleError(error.code),
        _messageForGoogleError(error.code),
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _initialize();
      await _googleSignIn.signOut();
    } on GoogleSignInException {
      return;
    }
  }

  Future<void> _initialize() async {
    if (_initialized) return;

    if (kIsWeb && _googleWebClientId.isEmpty) {
      throw const AuthException(
        'google-client-configuration-error',
        'Google Sign-In no esta configurado para esta app.',
      );
    }

    try {
      await _googleSignIn.initialize(
        clientId: _googleWebClientId.isEmpty ? null : _googleWebClientId,
      );
    } on GoogleSignInException catch (error) {
      throw AuthException(
        _codeForGoogleError(error.code),
        _messageForGoogleError(error.code),
      );
    }
    _initialized = true;
  }
}

String _idTokenFor(GoogleSignInAccount account) {
  final idToken = account.authentication.idToken;
  if (idToken == null || idToken.isEmpty) {
    throw const AuthException(
      'google-id-token-missing',
      'Google no devolvio un token valido.',
    );
  }
  return idToken;
}

String _codeForGoogleError(GoogleSignInExceptionCode code) {
  return switch (code) {
    GoogleSignInExceptionCode.canceled => 'google-canceled',
    GoogleSignInExceptionCode.interrupted => 'google-interrupted',
    GoogleSignInExceptionCode.clientConfigurationError =>
      'google-client-configuration-error',
    GoogleSignInExceptionCode.providerConfigurationError =>
      'google-provider-configuration-error',
    GoogleSignInExceptionCode.uiUnavailable => 'google-ui-unavailable',
    GoogleSignInExceptionCode.userMismatch => 'google-user-mismatch',
    GoogleSignInExceptionCode.unknownError => 'google-unknown',
  };
}

String _messageForGoogleError(GoogleSignInExceptionCode code) {
  return switch (code) {
    GoogleSignInExceptionCode.canceled => 'Inicio con Google cancelado.',
    GoogleSignInExceptionCode.interrupted =>
      'Inicio con Google interrumpido. Intenta de nuevo.',
    GoogleSignInExceptionCode.clientConfigurationError =>
      'Google Sign-In no esta configurado para esta app.',
    GoogleSignInExceptionCode.providerConfigurationError =>
      'Google Sign-In no esta disponible o esta mal configurado.',
    GoogleSignInExceptionCode.uiUnavailable =>
      'Google no pudo mostrar la pantalla de inicio.',
    GoogleSignInExceptionCode.userMismatch =>
      'La cuenta de Google no coincide con la sesion actual.',
    GoogleSignInExceptionCode.unknownError =>
      'No pudimos iniciar sesion con Google.',
  };
}
