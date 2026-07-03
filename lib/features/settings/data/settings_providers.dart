import 'package:flow_music/features/auth/data/providers/auth_providers.dart';
import 'package:flow_music/features/settings/data/settings_local_data_source.dart';
import 'package:flow_music/features/settings/data/settings_remote_data_source.dart';
import 'package:flow_music/features/settings/data/settings_sync.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.g.dart';

@Riverpod(keepAlive: true)
SettingsSync settingsSync(Ref ref) {
  return SettingsSync(
    localDataSource: const SettingsLocalDataSource(),
    remoteDataSource: SettingsRemoteDataSource(
      ref.watch(authenticatedFunctionClientProvider),
    ),
  );
}
