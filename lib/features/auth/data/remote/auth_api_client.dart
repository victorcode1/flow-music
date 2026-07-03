import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/auth_session.dart';

const String defaultFlowAuthApiBaseUrl =
    'https://us-central1-flowmusic-5715a.cloudfunctions.net';

class AuthApiClient {
  const AuthApiClient({
    this.baseUrl = const String.fromEnvironment(
      'FLOW_AUTH_API_BASE_URL',
      defaultValue: defaultFlowAuthApiBaseUrl,
    ),
  });

  final String baseUrl;

  Future<AuthSession> registerWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final json = await _post('authRegister', {
      'email': email,
      'password': password,
      'displayName': displayName,
    });
    return _sessionFromJson(json);
  }

  Future<AuthSession> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final json = await _post('authLogin', {
      'email': email,
      'password': password,
    });
    return _sessionFromJson(json);
  }

  Future<AuthSession> signInWithGoogleIdToken(String idToken) async {
    final json = await _post('authGoogleLogin', {'googleIdToken': idToken});
    return _sessionFromJson(json);
  }

  Future<AuthSession> refreshSession(String refreshToken) async {
    final json = await _post('authRefreshSession', {
      'refreshToken': refreshToken,
    });
    return _sessionFromJson(json);
  }

  Future<AuthUser> currentUser(String idToken) async {
    final response = await http.get(
      _uri('authCurrentUser'),
      headers: {'x-flow-auth-token': idToken},
    );
    final json = _decodeResponse(response);
    final userJson = json['user'];
    if (userJson is! Map<String, dynamic>) {
      throw const AuthException('invalid-response', 'Respuesta invalida.');
    }
    return _userFromJson(userJson);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _post('authPasswordReset', {'email': email});
  }

  Future<Map<String, dynamic>> _post(
    String functionName,
    Map<String, Object?> body,
  ) async {
    final response = await http.post(
      _uri(functionName),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(body),
    );
    return _decodeResponse(response);
  }

  Map<String, dynamic> _decodeResponse(http.Response response) {
    final decoded = response.body.isEmpty ? null : jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (decoded is Map<String, dynamic>) return decoded;
      throw const AuthException('invalid-response', 'Respuesta invalida.');
    }

    final error = decoded is Map<String, dynamic>
        ? decoded
        : const <String, dynamic>{};
    final code = error['code'] as String? ?? 'auth-request-failed';
    final message = error['message'] as String? ?? 'Error de autenticacion.';
    throw AuthException(code, _messageForCode(code, message));
  }

  Uri _uri(String functionName) {
    final normalized = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    return Uri.parse('$normalized/$functionName');
  }
}

AuthSession _sessionFromJson(Map<String, dynamic> json) {
  final userJson = json['user'];
  final sessionJson = json['session'];
  if (userJson is! Map<String, dynamic> ||
      sessionJson is! Map<String, dynamic>) {
    throw const AuthException('invalid-response', 'Respuesta invalida.');
  }

  return AuthSession(
    user: _userFromJson(userJson),
    idToken: sessionJson['idToken'] as String?,
    refreshToken: sessionJson['refreshToken'] as String?,
    expiresAtMs: sessionJson['expiresAt'] as int?,
  );
}

AuthUser _userFromJson(Map<String, dynamic> json) {
  final id = json['id'];
  if (id is! String || id.isEmpty) {
    throw const AuthException('invalid-response', 'Respuesta invalida.');
  }
  final claims = json['claims'];
  return AuthUser(
    id: id,
    email: json['email'] as String?,
    displayName: json['displayName'] as String?,
    photoUrl: json['photoUrl'] as String?,
    isAnonymous: json['isAnonymous'] == true,
    claims: claims is Map
        ? claims.map((key, value) => MapEntry(key.toString(), value))
        : const <String, Object?>{},
  );
}

String _messageForCode(String code, String fallback) {
  return switch (code) {
    'email-already-in-use' => 'Ya existe una cuenta con ese correo.',
    'invalid-email' => 'El correo no es valido.',
    'user-disabled' => 'La cuenta esta deshabilitada.',
    'user-not-found' => 'No se encontro un usuario con ese correo.',
    'invalid-credential' => 'Correo o contrasena invalida.',
    'weak-password' => 'La contrasena es muy debil.',
    'operation-not-allowed' =>
      'El inicio con correo no esta habilitado en el servidor.',
    'google-sign-in-disabled' =>
      'El inicio con Google no esta habilitado en el servidor.',
    'invalid-google-token' => 'Google no devolvio una sesion valida.',
    'too-many-requests' => 'Demasiados intentos. Intenta mas tarde.',
    'network-request-failed' => 'Sin conexion al servidor de autenticacion.',
    _ => fallback,
  };
}
