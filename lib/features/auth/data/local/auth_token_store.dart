import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _idTokenKey = 'flow_auth_id_token';
const String _refreshTokenKey = 'flow_auth_refresh_token';
const String _expiresAtMsKey = 'flow_auth_expires_at_ms';
const String _backgroundUserKey = 'flow_auth_background_user';

class AuthTokenStore {
  const AuthTokenStore(this._storage);

  final FlutterSecureStorage _storage;

  Future<AuthSessionTokens?> read() async {
    final idToken = await _storage.read(key: _idTokenKey);
    final refreshToken = await _storage.read(key: _refreshTokenKey);
    final expiresAtText = await _storage.read(key: _expiresAtMsKey);
    final expiresAtMs = expiresAtText == null
        ? null
        : int.tryParse(expiresAtText);

    if ((idToken == null || idToken.isEmpty) &&
        (refreshToken == null || refreshToken.isEmpty)) {
      return null;
    }

    return AuthSessionTokens(
      idToken: idToken,
      refreshToken: refreshToken,
      expiresAtMs: expiresAtMs,
    );
  }

  Future<void> write(AuthSessionTokens tokens) async {
    await Future.wait([
      _writeOrDelete(_idTokenKey, tokens.idToken),
      _writeOrDelete(_refreshTokenKey, tokens.refreshToken),
      _writeOrDelete(_expiresAtMsKey, tokens.expiresAtMs?.toString()),
    ]);
  }

  Future<void> clear() async {
    await Future.wait([
      _storage.delete(key: _idTokenKey),
      _storage.delete(key: _refreshTokenKey),
      _storage.delete(key: _expiresAtMsKey),
    ]);
  }

  Future<String?> readBackgroundUserJson() {
    return _storage.read(key: _backgroundUserKey);
  }

  Future<void> writeBackgroundUserJson(String json) {
    return _writeOrDelete(_backgroundUserKey, json);
  }

  Future<void> clearBackgroundUserJson() {
    return _storage.delete(key: _backgroundUserKey);
  }

  Future<void> _writeOrDelete(String key, String? value) {
    if (value == null || value.isEmpty) {
      return _storage.delete(key: key);
    }
    return _storage.write(key: key, value: value);
  }
}

class AuthSessionTokens {
  const AuthSessionTokens({this.idToken, this.refreshToken, this.expiresAtMs});

  final String? idToken;
  final String? refreshToken;
  final int? expiresAtMs;
}
