import 'package:flow_music/features/auth/data/providers/auth_providers.dart';
import 'package:flow_music/features/radio/data/radio_playlists_remote_data_source.dart';
import 'package:flow_music/features/radio/data/radio_playlists_repository.dart';
import 'package:flow_music/features/radio/data/radio_playlists_sync.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'radio_playlists_providers.g.dart';

@Riverpod(keepAlive: true)
RadioPlaylistsSync radioPlaylistsSync(Ref ref) {
  return RadioPlaylistsSync(
    localRepository: const RadioPlaylistsRepository(),
    remoteDataSource: RadioPlaylistsRemoteDataSource(
      ref.watch(authenticatedFunctionClientProvider),
    ),
  );
}
