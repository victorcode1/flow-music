import '../../domain/entities/auth_user.dart';

class AuthSession {
  const AuthSession({
    required this.user,
    this.idToken,
    this.refreshToken,
    this.expiresAtMs,
  });

  final AuthUser user;
  final String? idToken;
  final String? refreshToken;
  final int? expiresAtMs;

  bool get isAnonymous => user.isAnonymous;

  bool get canRefresh {
    return !isAnonymous && refreshToken != null && refreshToken!.isNotEmpty;
  }

  bool get shouldRefresh {
    final expiresAt = expiresAtMs;
    if (expiresAt == null) return false;
    final refreshAt = DateTime.now().millisecondsSinceEpoch + 60000;
    return refreshAt >= expiresAt;
  }

  Map<String, Object?> toJson() {
    return {'user': _userToJson(user)};
  }

  static AuthSession? fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    if (userJson is! Map<String, dynamic>) return null;
    final user = _userFromJson(userJson);
    if (user == null) return null;
    return AuthSession(
      user: user,
      idToken: json['idToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expiresAtMs: json['expiresAtMs'] as int?,
    );
  }
}

Map<String, Object?> authUserToJson(AuthUser user) {
  return _userToJson(user);
}

AuthUser? authUserFromJson(Map<String, dynamic> json) {
  return _userFromJson(json);
}

Map<String, Object?> _userToJson(AuthUser user) {
  return {
    'id': user.id,
    'email': user.email,
    'displayName': user.displayName,
    'photoUrl': user.photoUrl,
    'isAnonymous': user.isAnonymous,
    'claims': user.claims,
  };
}

AuthUser? _userFromJson(Map<String, dynamic> json) {
  final id = json['id'];
  if (id is! String || id.isEmpty) return null;
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
