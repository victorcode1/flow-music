import 'package:flow_music/core/backend/backend_providers.dart';
import 'package:flow_music/core/config/app_environment.dart';
import 'package:flow_music/features/account/data/google_auth_gateway.dart';
import 'package:flow_music/features/account/data/supabase_auth_repository.dart';
import 'package:flow_music/features/account/data/unavailable_auth_repository.dart';
import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final googleAuthGatewayProvider = Provider<GoogleAuthGateway>((ref) {
  return NativeGoogleAuthGateway(
    webClientId: AppEnvironment.googleWebClientId,
    iosClientId: AppEnvironment.googleIosClientId,
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return client == null
      ? const UnavailableAuthRepository()
      : SupabaseAuthRepository(client, ref.watch(googleAuthGatewayProvider));
});

final authUserProvider = StreamProvider<AppUser?>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return repository.authStateChanges;
});
