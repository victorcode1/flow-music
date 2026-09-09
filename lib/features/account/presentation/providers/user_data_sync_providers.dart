import 'package:flow_music/core/backend/backend_providers.dart';
import 'package:flow_music/features/account/application/account_session_actions.dart';
import 'package:flow_music/features/account/application/user_data_sync_coordinator.dart';
import 'package:flow_music/features/account/data/supabase_user_data_sync_repository.dart';
import 'package:flow_music/features/account/data/supabase_cloud_sync_access_repository.dart';
import 'package:flow_music/features/account/domain/entities/cloud_sync_access.dart';
import 'package:flow_music/features/account/domain/repositories/cloud_sync_access_repository.dart';
import 'package:flow_music/features/monetization/presentation/providers/monetization_providers.dart';
import 'package:flow_music/features/account/data/user_data_local_store.dart';
import 'package:flow_music/features/account/domain/repositories/user_data_sync_repository.dart';
import 'package:flow_music/features/account/presentation/providers/account_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userDataSyncRevisionProvider =
    NotifierProvider<UserDataSyncRevision, int>(UserDataSyncRevision.new);

class UserDataSyncRevision extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state++;
}

final userDataSyncRepositoryProvider = Provider<UserDataSyncRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return client == null
      ? const NoopUserDataSyncRepository()
      : SupabaseUserDataSyncRepository(client);
});

final userDataLocalStoreProvider = Provider<UserDataLocalStore>(
  (_) => const UserDataLocalStore(),
);

final cloudSyncAccessRepositoryProvider = Provider<CloudSyncAccessRepository>((
  ref,
) {
  final client = ref.watch(supabaseClientProvider);
  return client == null
      ? const NoopCloudSyncAccessRepository()
      : SupabaseCloudSyncAccessRepository(client);
});

final cloudSyncStateProvider = StreamProvider<CloudSyncState>(
  (ref) => ref.watch(userDataSyncCoordinatorProvider).watchState(),
);

final userDataSyncCoordinatorProvider = Provider<UserDataSyncCoordinator>((
  ref,
) {
  final coordinator = UserDataSyncCoordinator(
    ref.watch(authRepositoryProvider),
    ref.watch(userDataSyncRepositoryProvider),
    ref.watch(userDataLocalStoreProvider),
    ref.watch(subscriptionRepositoryProvider),
    ref.watch(cloudSyncAccessRepositoryProvider),
    onLocalDataChanged: () {
      ref.read(userDataSyncRevisionProvider.notifier).bump();
    },
  );
  ref.onDispose(coordinator.dispose);
  return coordinator;
});

final accountSessionActionsProvider = Provider<AccountSessionActions>((ref) {
  return AccountSessionActions(
    ref.watch(authRepositoryProvider),
    ref.watch(userDataSyncCoordinatorProvider),
  );
});
