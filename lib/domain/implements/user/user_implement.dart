import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/datasource/services/firebase/auth/auth_fire_service.dart';
import 'package:flow_music/domain/repository/user_imp.dart';

class UserImplement extends UserImp {
  final AuthFireService _firebaseAuthService;

  UserImplement({
    required AuthFireService firebaseRepo,
  }) : _firebaseAuthService = firebaseRepo;

  @override
  Stream<User?> get user => _firebaseAuthService.user;

  @override
  Future<void> logAuth() async {
    return _firebaseAuthService.logAuth();
  }

  @override
  Future<String?> get imagenPerfil async {
    final user = _firebaseAuthService.currentUser;
    if (user != null) {
      return user.photoURL;
    }
    return null;
  }

  @override
  Stream<User?> get userStream {
    return _firebaseAuthService.user;
  }

  @override
  User? get currentUser => _firebaseAuthService.currentUser;
}
