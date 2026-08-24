import 'package:flow_music/core/config/app_environment.dart';
import 'package:flow_music/features/account/data/google_auth_gateway.dart';
import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository implements AuthRepository {
  const SupabaseAuthRepository(this._client, this._googleAuth);

  final SupabaseClient _client;
  final GoogleAuthGateway _googleAuth;

  @override
  AppUser? get currentUser => _mapUser(_client.auth.currentUser);

  @override
  bool get isAvailable => true;

  @override
  Stream<AppUser?> get authStateChanges => _client.auth.onAuthStateChange.map(
    (state) => _mapUser(state.session?.user ?? _client.auth.currentUser),
  );

  @override
  Future<AppUser> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email.trim(),
        password: password,
      );
      final user = _mapUser(response.user);
      if (user == null) {
        throw const AuthFailure('No se pudo recuperar la cuenta.');
      }
      return user;
    } on AuthException catch (error) {
      throw AuthFailure(error.message, code: error.code);
    }
  }

  @override
  Future<AppUser> signInWithGoogle() async {
    try {
      final tokens = await _googleAuth.authenticate();
      final response = await _client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: tokens.idToken,
        accessToken: tokens.accessToken,
      );
      final user = _mapUser(response.user);
      if (user == null) {
        throw const AuthFailure('No se pudo recuperar la cuenta de Google.');
      }
      return user;
    } on GoogleAuthGatewayFailure catch (error) {
      throw AuthFailure(error.message, code: error.code);
    } on AuthException catch (error) {
      throw AuthFailure(error.message, code: error.code);
    }
  }

  @override
  Future<SignUpResult> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email.trim(),
        password: password,
        emailRedirectTo: AppEnvironment.authCallbackUrl,
        data: {
          if (displayName != null && displayName.trim().isNotEmpty)
            'display_name': displayName.trim(),
        },
      );
      final user = _mapUser(response.user);
      if (user == null) {
        throw const AuthFailure('No se pudo crear la cuenta.');
      }
      return SignUpResult(
        user: user,
        requiresConfirmation: response.session == null,
      );
    } on AuthException catch (error) {
      throw AuthFailure(error.message, code: error.code);
    }
  }

  @override
  Future<void> sendPasswordReset(String email) async {
    try {
      await _client.auth.resetPasswordForEmail(
        email.trim(),
        redirectTo: AppEnvironment.authCallbackUrl,
      );
    } on AuthException catch (error) {
      throw AuthFailure(error.message, code: error.code);
    }
  }

  @override
  Future<void> updatePassword(String password) async {
    try {
      await _client.auth.updateUser(UserAttributes(password: password));
    } on AuthException catch (error) {
      throw AuthFailure(error.message, code: error.code);
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await _client.functions.invoke('delete-account');
      await _client.auth.signOut(scope: SignOutScope.local);
    } on FunctionException catch (error) {
      throw AuthFailure(
        'No se pudo eliminar la cuenta.',
        code: 'delete_account_${error.status}',
      );
    } on AuthException catch (error) {
      throw AuthFailure(error.message, code: error.code);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } on AuthException catch (error) {
      throw AuthFailure(error.message, code: error.code);
    }

    // Supabase is the source of truth for the app session. Clearing Google's
    // local account chooser is best-effort and must not turn a successful
    // Supabase sign-out into a user-facing failure.
    try {
      await _googleAuth.signOut();
    } on GoogleAuthGatewayFailure {
      // The next Google authentication can still present the account chooser.
    }
  }

  AppUser? _mapUser(User? user) {
    if (user == null) return null;
    final metadata = user.userMetadata;
    final displayName =
        metadata?['display_name'] ??
        metadata?['full_name'] ??
        metadata?['name'];
    return AppUser(
      id: user.id,
      email: user.email ?? '',
      displayName: displayName is String ? displayName : null,
      emailConfirmed: user.emailConfirmedAt != null,
    );
  }
}
