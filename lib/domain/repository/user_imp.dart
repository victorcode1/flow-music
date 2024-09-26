import 'package:firebase_auth/firebase_auth.dart';

abstract class UserImp {
  Stream<User?> get user;
  Future<void> logAuth();
  Future<String?> get imagenPerfil;
}
