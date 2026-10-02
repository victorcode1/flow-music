import 'package:flow_music/features/account/application/local_user_data_coordinator.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';

class AccountSessionActions {
  const AccountSessionActions(this._auth, this._localData);
  final AuthRepository _auth;
  final LocalUserDataCoordinator _localData;

  Future<void> signOut() async {
    await _localData.flushCurrentUser();
    await _auth.signOut();
    // Restore this device's guest library without fetching or uploading data.
    await _localData.selectCurrentUser();
  }

  Future<void> deleteAccount() async {
    final userId = _auth.currentUser?.id;
    await _auth.deleteAccount();
    await _localData.deleteLocalAccount(userId);
    await _localData.selectCurrentUser();
  }
}
