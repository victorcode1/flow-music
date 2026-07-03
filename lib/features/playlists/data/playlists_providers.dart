import 'package:flow_music/features/auth/data/providers/auth_providers.dart';
import 'package:flow_music/features/playlists/data/playlists_remote_data_source.dart';
import 'package:flow_music/features/playlists/data/playlists_repository.dart';
import 'package:flow_music/features/playlists/data/playlists_sync.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playlists_providers.g.dart';

@Riverpod(keepAlive: true)
PlaylistsSync playlistsSync(Ref ref) {
  return PlaylistsSync(
    localRepository: const PlaylistsRepository(),
    remoteDataSource: PlaylistsRemoteDataSource(
      ref.watch(authenticatedFunctionClientProvider),
    ),
  );
}
