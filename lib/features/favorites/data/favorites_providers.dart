import 'package:flow_music/features/auth/data/providers/auth_providers.dart';
import 'package:flow_music/features/favorites/data/favorites_remote_data_source.dart';
import 'package:flow_music/features/favorites/data/favorites_repository.dart';
import 'package:flow_music/features/favorites/data/favorites_sync.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_providers.g.dart';

/// Provider del sync de favoritos. Vive en `data/` y NO importa controllers
/// para evitar ciclos: la registry global y el controller lo consumen, no
/// al reves.
@Riverpod(keepAlive: true)
FavoritesSync favoritesSync(Ref ref) {
  return FavoritesSync(
    localRepository: const FavoritesRepository(),
    remoteDataSource: FavoritesRemoteDataSource(
      ref.watch(authenticatedFunctionClientProvider),
    ),
  );
}
