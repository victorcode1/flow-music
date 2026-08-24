import 'package:flow_music/features/account/domain/entities/app_user.dart';

abstract interface class AuthRepository {
  AppUser? get currentUser;

  Stream<AppUser?> get authStateChanges;

  bool get isAvailable;

  Future<AppUser> signIn({required String email, required String password});

  Future<AppUser> signInWithGoogle();

  Future<SignUpResult> signUp({
    required String email,
    required String password,
    String? displayName,
  });

  Future<void> sendPasswordReset(String email);

  Future<void> updatePassword(String password);

  Future<void> deleteAccount();

  Future<void> signOut();
}

class AuthFailure implements Exception {
  const AuthFailure(this.message, {this.code});

  final String message;
  final String? code;

  @override
  String toString() => message;
}
