import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../domain/entities/auth_user.dart';
import '../models/auth_session.dart';
import 'auth_token_store.dart';

const String authSessionBoxName = 'auth_session';
const String _sessionKey = 'current';

class AuthSessionStore {
  const AuthSessionStore({required AuthTokenStore tokenStore})
    : _tokenStore = tokenStore;

  final AuthTokenStore _tokenStore;

  Box get _box => Hive.box(authSessionBoxName);

  AuthUser? readUser() {
    try {
      final decoded = _readSessionJson();
      final userJson = decoded?['user'];
      if (userJson is! Map<String, dynamic>) return null;
      return authUserFromJson(userJson);
    } catch (error, stackTrace) {
      debugPrint('AuthSessionStore read user failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }

  Future<AuthSession?> read() async {
    try {
      await migrateLegacySensitiveFields();

      final user = readUser();
      if (user == null) return null;

      final tokens = await _tokenStore.read();
      return AuthSession(
        user: user,
        idToken: tokens?.idToken,
        refreshToken: tokens?.refreshToken,
        expiresAtMs: tokens?.expiresAtMs,
      );
    } catch (error, stackTrace) {
      debugPrint('AuthSessionStore read failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }

  Future<AuthUser?> readBackgroundUser() async {
    try {
      final raw = await _tokenStore.readBackgroundUserJson();
      if (raw == null || raw.isEmpty) return null;
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return authUserFromJson(
        decoded.map((key, value) => MapEntry(key.toString(), value)),
      );
    } catch (error, stackTrace) {
      debugPrint('AuthSessionStore read background user failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }

  Future<void> syncBackgroundUserMirror() async {
    await migrateLegacySensitiveFields();
    final user = readUser();
    if (user == null) {
      await _tokenStore.clearBackgroundUserJson();
      return;
    }
    await _tokenStore.writeBackgroundUserJson(jsonEncode(authUserToJson(user)));
  }

  Future<void> write(AuthSession session) async {
    await _box.put(_sessionKey, jsonEncode(session.toJson()));
    await _tokenStore.writeBackgroundUserJson(
      jsonEncode(authUserToJson(session.user)),
    );

    if (session.idToken == null &&
        session.refreshToken == null &&
        session.expiresAtMs == null) {
      await _tokenStore.clear();
      return;
    }

    await _tokenStore.write(
      AuthSessionTokens(
        idToken: session.idToken,
        refreshToken: session.refreshToken,
        expiresAtMs: session.expiresAtMs,
      ),
    );
  }

  Future<void> migrateLegacySensitiveFields() async {
    final decoded = _readSessionJson();
    if (decoded == null) return;
    final legacy = AuthSession.fromJson(decoded);
    if (legacy == null) return;

    final hasLegacyTokens =
        legacy.idToken != null ||
        legacy.refreshToken != null ||
        legacy.expiresAtMs != null;
    if (!hasLegacyTokens) return;

    await write(legacy);
  }

  Future<void> clear() async {
    await Future.wait([
      _box.delete(_sessionKey),
      _tokenStore.clear(),
      _tokenStore.clearBackgroundUserJson(),
    ]);
  }

  Map<String, dynamic>? _readSessionJson() {
    final raw = _box.get(_sessionKey);
    if (raw is! String || raw.isEmpty) return null;
    final decoded = jsonDecode(raw);
    if (decoded is! Map) return null;
    return decoded.map((key, value) => MapEntry(key.toString(), value));
  }
}
