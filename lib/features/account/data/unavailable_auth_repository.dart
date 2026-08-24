import 'dart:async';

import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';

class UnavailableAuthRepository implements AuthRepository {
  const UnavailableAuthRepository();

  static const _failure = AuthFailure(
    'El servicio de cuenta todavia no esta configurado.',
    code: 'service_unavailable',
  );

  @override
  Stream<AppUser?> get authStateChanges => Stream<AppUser?>.value(null);

  @override
  AppUser? get currentUser => null;

  @override
  bool get isAvailable => false;

  @override
  Future<void> sendPasswordReset(String email) => Future.error(_failure);

  @override
  Future<void> deleteAccount() => Future.error(_failure);

  @override
  Future<AppUser> signIn({required String email, required String password}) =>
      Future.error(_failure);

  @override
  Future<AppUser> signInWithGoogle() => Future.error(_failure);

  @override
  Future<void> signOut() async {}

  @override
  Future<SignUpResult> signUp({
    required String email,
    required String password,
    String? displayName,
  }) => Future.error(_failure);

  @override
  Future<void> updatePassword(String password) => Future.error(_failure);
}
