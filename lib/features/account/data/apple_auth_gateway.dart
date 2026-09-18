import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthTokens {
  const AppleAuthTokens({
    required this.idToken,
    required this.authorizationCode,
  });

  final String idToken;
  final String authorizationCode;
}

abstract interface class AppleAuthGateway {
  bool get isAvailable;

  Future<AppleAuthTokens> authenticate({required String rawNonce});
}

class AppleAuthGatewayFailure implements Exception {
  const AppleAuthGatewayFailure(this.message, {this.code});

  final String message;
  final String? code;
}

class NativeAppleAuthGateway implements AppleAuthGateway {
  const NativeAppleAuthGateway();

  @override
  bool get isAvailable =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Future<AppleAuthTokens> authenticate({required String rawNonce}) async {
    if (!isAvailable || !await SignInWithApple.isAvailable()) {
      throw const AppleAuthGatewayFailure(
        'El acceso con Apple no está disponible en este dispositivo.',
        code: 'apple_unsupported',
      );
    }

    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: const [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: hashAppleNonce(rawNonce),
      );
      final idToken = credential.identityToken;
      if (idToken == null || idToken.isEmpty) {
        throw const AppleAuthGatewayFailure(
          'Apple no devolvió una credencial válida.',
          code: 'apple_missing_id_token',
        );
      }
      return AppleAuthTokens(
        idToken: idToken,
        authorizationCode: credential.authorizationCode,
      );
    } on SignInWithAppleAuthorizationException catch (error) {
      final cancelled = error.code == AuthorizationErrorCode.canceled;
      throw AppleAuthGatewayFailure(
        cancelled
            ? 'Inicio de sesión cancelado.'
            : 'No se pudo iniciar sesión con Apple.',
        code: cancelled ? 'cancelled' : 'apple_${error.code.name}',
      );
    } on SignInWithAppleException catch (error) {
      throw AppleAuthGatewayFailure(
        'No se pudo iniciar sesión con Apple.',
        code: 'apple_${error.runtimeType}',
      );
    }
  }
}

@visibleForTesting
String hashAppleNonce(String rawNonce) =>
    sha256.convert(utf8.encode(rawNonce)).toString();
