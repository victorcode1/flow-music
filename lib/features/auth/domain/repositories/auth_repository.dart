import '../entities/auth_user.dart';

/// Contrato de autenticacion expuesto al dominio. La implementacion concreta
/// vive en `data/` y habla con el backend HTTP.
abstract class AuthRepository {
  AuthUser? get currentUser;
  Stream<AuthUser?> get authStateChanges;

  Future<AuthUser?> refreshCurrentUser();

  Future<AuthUser?> signInWithEmail({
    required String email,
    required String password,
  });

  Future<AuthUser?> registerWithEmail({
    required String email,
    required String password,
    required String displayName,
  });

  Future<AuthUser?> signInWithGoogle();

  Future<AuthUser?> signInWithGoogleIdToken(String googleIdToken);

  Future<AuthUser?> signInAnonymously();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signOut();
}

/// Excepcion mapeada por la capa data cuando una operacion remota
/// falla. La UI decide como traducirla a un mensaje internacionalizado.
class AuthException implements Exception {
  const AuthException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => 'AuthException($code): $message';
}
