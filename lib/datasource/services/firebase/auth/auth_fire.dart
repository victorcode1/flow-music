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

class AuthFire {
  late FirebaseAuth _auth;

  static final AuthFire _instance = AuthFire._internal();
  factory AuthFire() => _instance;
  AuthFire._internal() {
    _auth = FirebaseAuth.instance;

    debugPrint('Auth initialized');
  }

  Stream<User?> get user => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<void> logAuth() async {
    return await _auth.signOut();
  }
}
