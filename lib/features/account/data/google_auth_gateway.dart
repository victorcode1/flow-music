import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthTokens {
  const GoogleAuthTokens({required this.idToken, this.accessToken});

  final String idToken;
  final String? accessToken;
}

abstract interface class GoogleAuthGateway {
  bool get isAvailable;

  Future<GoogleAuthTokens> authenticate();

  Future<void> signOut();
}

class GoogleAuthGatewayFailure implements Exception {
  const GoogleAuthGatewayFailure(this.message, {this.code});

  final String message;
  final String? code;
}

class NativeGoogleAuthGateway implements GoogleAuthGateway {
  static const _authorizationScopes = <String>['email'];

  NativeGoogleAuthGateway({
    required String webClientId,
    required String iosClientId,
    GoogleSignIn? googleSignIn,
  }) : _webClientId = webClientId.trim(),
       _iosClientId = iosClientId.trim(),
       _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final String _webClientId;
  final String _iosClientId;
  final GoogleSignIn _googleSignIn;
  Future<void>? _initialization;

  bool get _isNativeMobile =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  @override
  bool get isAvailable =>
      _isNativeMobile &&
      _webClientId.isNotEmpty &&
      (defaultTargetPlatform != TargetPlatform.iOS || _iosClientId.isNotEmpty);

  @override
  Future<GoogleAuthTokens> authenticate() async {
    if (!isAvailable) {
      throw const GoogleAuthGatewayFailure(
        'El acceso con Google todavía no está configurado.',
        code: 'google_not_configured',
      );
    }

    try {
      await (_initialization ??= _googleSignIn.initialize(
        clientId: defaultTargetPlatform == TargetPlatform.iOS
            ? _iosClientId
            : null,
        serverClientId: _webClientId,
      ));
      if (!_googleSignIn.supportsAuthenticate()) {
        throw const GoogleAuthGatewayFailure(
          'El acceso con Google no está disponible en este dispositivo.',
          code: 'google_unsupported',
        );
      }

      final account = await _googleSignIn.authenticate();
      final idToken = account.authentication.idToken;
      if (idToken == null || idToken.isEmpty) {
        throw const GoogleAuthGatewayFailure(
          'Google no devolvió una credencial válida.',
          code: 'google_missing_id_token',
        );
      }
      final authorization =
          await account.authorizationClient.authorizationForScopes(
            _authorizationScopes,
          ) ??
          await account.authorizationClient.authorizeScopes(
            _authorizationScopes,
          );
      return GoogleAuthTokens(
        idToken: idToken,
        accessToken: authorization.accessToken,
      );
    } on GoogleSignInException catch (error) {
      final cancelled =
          error.code == GoogleSignInExceptionCode.canceled ||
          error.code == GoogleSignInExceptionCode.interrupted;
      throw GoogleAuthGatewayFailure(
        cancelled
            ? 'Inicio de sesión cancelado.'
            : 'No se pudo iniciar sesión con Google.',
        code: cancelled ? 'cancelled' : error.code.name,
      );
    }
  }

  @override
  Future<void> signOut() async {
    final initialization = _initialization;
    if (initialization == null) return;
    try {
      await initialization;
      await _googleSignIn.signOut();
    } on GoogleSignInException catch (error) {
      throw GoogleAuthGatewayFailure(
        'La sesión local de Google no pudo cerrarse por completo.',
        code: error.code.name,
      );
    }
  }
}
