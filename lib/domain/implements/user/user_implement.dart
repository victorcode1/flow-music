import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/datasource/services/firebase/auth/auth_fire_service.dart';
import 'package:flow_music/domain/repository/data_repo.dart';
import 'package:flow_music/domain/repository/user_imp.dart';

class UserImplement extends UserImp {
  final AuthFireService _firebaseRepo;
  final DataRepo _dataRepository;

  UserImplement(
      {required AuthFireService firebaseRepo, required DataRepo dataRepository})
      : _firebaseRepo = firebaseRepo,
        _dataRepository = dataRepository;

  @override
  Stream<User?> get user => _firebaseRepo.user;

  @override
  Future<void> logAuth() async {
    return _firebaseRepo.logAuth();
  }

  @override
  Future<String?> get imagenPerfil async {
    final user = _firebaseRepo.currentUser;
    if (user != null) {
      return user.photoURL;
    }
    return null;
  }

  @override
  Stream<User?> get userStream {
    return _firebaseRepo.user;
  }
}
