import 'dart:async';
import 'dart:math';

import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../local/auth_session_store.dart';
import '../models/auth_session.dart';
import '../remote/auth_api_client.dart';
import '../remote/google_identity_client.dart';

class HttpAuthRepository implements AuthRepository {
  HttpAuthRepository({
    required AuthApiClient apiClient,
    required AuthSessionStore sessionStore,
    required GoogleIdentityClient googleIdentityClient,
  }) : _apiClient = apiClient,
       _sessionStore = sessionStore,
       _googleIdentityClient = googleIdentityClient;

  final AuthApiClient _apiClient;
  final AuthSessionStore _sessionStore;
  final GoogleIdentityClient _googleIdentityClient;
  final StreamController<AuthUser?> _authController =
      StreamController<AuthUser?>.broadcast();

  @override
  AuthUser? get currentUser => _sessionStore.readUser();

  @override
  Stream<AuthUser?> get authStateChanges async* {
    await _sessionStore.migrateLegacySensitiveFields();
    yield currentUser;
    yield* _authController.stream;
  }

  @override
  Future<AuthUser?> refreshCurrentUser() async {
    final stored = await _sessionStore.read();
    if (stored == null) return null;
    if (stored.isAnonymous) return stored.user;

    var session = stored;
    if (stored.shouldRefresh && stored.canRefresh) {
      session = await _apiClient.refreshSession(stored.refreshToken!);
      await _sessionStore.write(session);
    }

    final idToken = session.idToken;
    if (idToken == null || idToken.isEmpty) return session.user;

    final user = await _apiClient.currentUser(idToken);
    final updated = AuthSession(
      user: user,
      idToken: session.idToken,
      refreshToken: session.refreshToken,
      expiresAtMs: session.expiresAtMs,
    );
    await _sessionStore.write(updated);
    _authController.add(user);
    return user;
  }

  @override
  Future<AuthUser?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final session = await _apiClient.signInWithEmail(
      email: email,
      password: password,
    );
    await _sessionStore.write(session);
    _authController.add(session.user);
    return session.user;
  }

  @override
  Future<AuthUser?> signInWithGoogle() async {
    final googleIdToken = await _googleIdentityClient.requestIdToken();
    return signInWithGoogleIdToken(googleIdToken);
  }

  @override
  Future<AuthUser?> signInWithGoogleIdToken(String googleIdToken) async {
    final session = await _apiClient.signInWithGoogleIdToken(googleIdToken);
    await _sessionStore.write(session);
    _authController.add(session.user);
    return session.user;
  }

  @override
  Future<AuthUser?> registerWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final session = await _apiClient.registerWithEmail(
      email: email,
      password: password,
      displayName: displayName,
    );
    await _sessionStore.write(session);
    _authController.add(session.user);
    return session.user;
  }

  @override
  Future<AuthUser?> signInAnonymously() async {
    final current = currentUser;
    if (current != null) return current;

    final user = AuthUser(
      id: _anonymousId(),
      displayName: 'Usuario anonimo',
      isAnonymous: true,
    );
    await _sessionStore.write(AuthSession(user: user));
    _authController.add(user);
    return user;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return _apiClient.sendPasswordResetEmail(email);
  }

  @override
  Future<void> signOut() async {
    await _sessionStore.clear();
    await _googleIdentityClient.signOut();
    _authController.add(null);
  }

  String _anonymousId() {
    final random = Random.secure().nextInt(1 << 31);
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return 'anon_${timestamp}_$random';
  }
}
