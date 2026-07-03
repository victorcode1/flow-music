import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/auth_providers.dart';
import '../../domain/entities/auth_user.dart';

part 'auth_notifier.g.dart';

/// Stream notifier que expone el usuario actual al resto de la app. Es la
/// fuente de verdad para gatear navegacion y exponer la sesion HTTP actual.
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Stream<AuthUser?> build() {
    return ref.watch(authRepositoryProvider).authStateChanges;
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final user = await ref
        .read(authRepositoryProvider)
        .signInWithEmail(email: email, password: password);
    state = AsyncData(user);
  }

  Future<void> registerWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final user = await ref
        .read(authRepositoryProvider)
        .registerWithEmail(
          email: email,
          password: password,
          displayName: displayName,
        );
    state = AsyncData(user);
  }

  Future<void> signInWithGoogle() async {
    final user = await ref.read(authRepositoryProvider).signInWithGoogle();
    state = AsyncData(user);
  }

  Future<void> signInWithGoogleIdToken(String googleIdToken) async {
    final user = await ref
        .read(authRepositoryProvider)
        .signInWithGoogleIdToken(googleIdToken);
    state = AsyncData(user);
  }

  Future<void> ensureAnonymousSession() async {
    final repository = ref.read(authRepositoryProvider);
    final current = repository.currentUser;
    if (current != null && !current.isAnonymous) return;

    try {
      final user = await repository.signInAnonymously();
      state = AsyncData(user);
    } catch (error, stackTrace) {
      debugPrint('Anonymous sign-in skipped: $error');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  Future<AuthUser?> refreshCurrentUser() async {
    final user = await ref.read(authRepositoryProvider).refreshCurrentUser();
    state = AsyncData(user);
    return user;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await ref.read(authRepositoryProvider).sendPasswordResetEmail(email);
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
    state = const AsyncData(null);
  }
}
