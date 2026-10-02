import 'package:flow_music/features/account/application/account_session_actions.dart';
import 'package:flow_music/features/account/application/local_user_data_coordinator.dart';
import 'package:flow_music/features/account/data/user_data_local_store.dart';
import 'package:flow_music/features/account/presentation/providers/account_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localUserDataRevisionProvider =
    NotifierProvider<LocalUserDataRevision, int>(LocalUserDataRevision.new);

class LocalUserDataRevision extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state++;
}

final userDataLocalStoreProvider = Provider<UserDataLocalStore>(
  (_) => const UserDataLocalStore(),
);

final localUserDataCoordinatorProvider = Provider<LocalUserDataCoordinator>((
  ref,
) {
  final coordinator = LocalUserDataCoordinator(
    ref.watch(authRepositoryProvider),
    ref.watch(userDataLocalStoreProvider),
    onLocalDataChanged: () {
      ref.read(localUserDataRevisionProvider.notifier).bump();
    },
  );
  ref.onDispose(coordinator.dispose);
  return coordinator;
});

final accountSessionActionsProvider = Provider<AccountSessionActions>((ref) {
  return AccountSessionActions(
    ref.watch(authRepositoryProvider),
    ref.watch(localUserDataCoordinatorProvider),
  );
});
