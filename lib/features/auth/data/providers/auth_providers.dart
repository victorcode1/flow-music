import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/auth_repository.dart';
import '../local/auth_session_store.dart';
import '../local/auth_token_store.dart';
import '../remote/auth_api_client.dart';
import '../remote/authenticated_function_client.dart';
import '../remote/google_identity_client.dart';
import '../repositories/http_auth_repository.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthApiClient authApiClient(Ref ref) {
  return const AuthApiClient();
}

@Riverpod(keepAlive: true)
FlutterSecureStorage flutterSecureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@Riverpod(keepAlive: true)
AuthTokenStore authTokenStore(Ref ref) {
  return AuthTokenStore(ref.watch(flutterSecureStorageProvider));
}

@Riverpod(keepAlive: true)
AuthenticatedFunctionClient authenticatedFunctionClient(Ref ref) {
  return AuthenticatedFunctionClient(
    tokenStore: ref.watch(authTokenStoreProvider),
    apiClient: ref.watch(authApiClientProvider),
  );
}

@Riverpod(keepAlive: true)
AuthSessionStore authSessionStore(Ref ref) {
  return AuthSessionStore(tokenStore: ref.watch(authTokenStoreProvider));
}

@Riverpod(keepAlive: true)
GoogleIdentityClient googleIdentityClient(Ref ref) {
  return GoogleIdentityClient();
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return HttpAuthRepository(
    apiClient: ref.watch(authApiClientProvider),
    sessionStore: ref.watch(authSessionStoreProvider),
    googleIdentityClient: ref.watch(googleIdentityClientProvider),
  );
}
