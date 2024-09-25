import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/datasource/services/firebase/auth/auth_fire.dart';
import 'package:flow_music/domain/repository/user_imp.dart';

class UserImplement extends UserImp {
  final AuthFire _firebaseRepo;

  UserImplement({required AuthFire firebaseRepo})
      : _firebaseRepo = firebaseRepo;

  @override
  Stream<User?> get user => _firebaseRepo.user;

  @override
  Future<void> logAuth() {
    return _firebaseRepo.logAuth();
  }
}
