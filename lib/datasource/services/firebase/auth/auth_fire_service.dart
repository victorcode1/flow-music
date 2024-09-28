import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider, EmailAuthProvider;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final actionCodeSettings = ActionCodeSettings(
  url: 'https://flutterfire-e2e-tests.firebaseapp.com',
  handleCodeInApp: true,
  androidMinimumVersion: '1',
  androidPackageName: 'io.flutter.plugins.firebase_ui.firebase_ui_example',
  iOSBundleId: 'io.flutter.plugins.fireabaseUiExample',
);

class AuthFireService {
  late FirebaseAuth _auth;

  static final AuthFireService _instance = AuthFireService._internal();
  factory AuthFireService() => _instance;
  AuthFireService._internal() {
    _auth = FirebaseAuth.instance;

    debugPrint('Auth initialized');
  }

  Stream<User?> get user => _auth.authStateChanges();
  
  User? get currentUser => _auth.currentUser;

  Future<void> logAuth() async {
    return await _auth.signOut();
  }
}
