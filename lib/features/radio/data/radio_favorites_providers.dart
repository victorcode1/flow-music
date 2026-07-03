import 'package:flow_music/features/auth/data/providers/auth_providers.dart';
import 'package:flow_music/features/radio/data/radio_favorites_remote_data_source.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:flow_music/features/radio/data/radio_favorites_sync.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'radio_favorites_providers.g.dart';

@Riverpod(keepAlive: true)
RadioFavoritesSync radioFavoritesSync(Ref ref) {
  return RadioFavoritesSync(
    localRepository: const RadioFavoritesRepository(),
    remoteDataSource: RadioFavoritesRemoteDataSource(
      ref.watch(authenticatedFunctionClientProvider),
    ),
  );
}
