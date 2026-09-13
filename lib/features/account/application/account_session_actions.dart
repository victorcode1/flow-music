import 'package:flow_music/features/account/application/user_data_sync_coordinator.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';

class AccountSessionActions {
  const AccountSessionActions(this._auth, this._userDataSync);
  final AuthRepository _auth;
  final UserDataSyncCoordinator _userDataSync;

  Future<void> signOut() async {
    await _userDataSync.flushCurrentUser();
    await _auth.signOut();
    // Account-scoped local copies survive offline sign-out; the guest session
    // cannot see them. The next login switches back to that account's data.
    await _userDataSync.synchronizeNow();
  }

  Future<void> deleteAccount() async {
    // Clear while the coordinator still knows which local account to delete.
    // The destructive action must succeed on the server before local deletion.
    final userId = _auth.currentUser?.id;
    await _auth.deleteAccount();
    await _userDataSync.deleteLocalAccount(userId);
  }
}
