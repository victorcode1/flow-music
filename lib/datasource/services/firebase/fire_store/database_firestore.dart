import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/datasource/services/data_repo/data_store_repo.dart';
import 'package:flutter/material.dart';

class DatabaseFirestore extends DataStoreRepo {
  late FirebaseFirestore _firestore;

  //sigelton
  static final DatabaseFirestore _instance = DatabaseFirestore._internal();
  DatabaseFirestore._internal() {
    _firestore = FirebaseFirestore.instance;
    _firestore.settings = const Settings(persistenceEnabled: true);
    debugPrint('FFireStore initialized ');
  }
  factory DatabaseFirestore() => _instance;

  @override
  Future saveUser({required User user}) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'status': 'active',
        'numberPhone': user.phoneNumber,
        'uid': user.uid,
        'email': user.email,
        'photoURL': user.photoURL,
        'displayName': user.displayName,
        'lastLogin': DateTime.now(),
        'logAuth': false,
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
        'deletedAt': null,
        'logAuthDate': null,
        'role': user.email == 'victorflores20511@gmail.com' ? 'admin' : 'user',
      });
      debugPrint('User ${user.uid} saved to Firestore.');
    } catch (e, s) {
      debugPrintStack(label: 'Failed to save user: $e', stackTrace: s);
      throw Exception('Failed to save user: $e');
    }
  }

  @override
  Future logAuth() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return await _firestore.collection('users').doc(user!.uid).update({
        'logAuth': true,
        'logAuthDate': DateTime.now(),
      }).then((value) {
        debugPrint('User ${user.uid} logAuth to Firestore.');
      });
    } catch (e, s) {
      debugPrintStack(label: 'Failed to logAuth: $e', stackTrace: s);
      throw Exception('Failed to logAuth: $e');
    }
  }

  @override
  void saveRadio(String text, String text2) {
    try {
      _firestore.collection('radio').add({
        'name': text,
        'url': text2,
      });

      debugPrint('Radio saved to Firestore.');
    } catch (e, s) {
      debugPrintStack(label: 'Failed to saveRadio: $e', stackTrace: s);
      throw Exception('Failed to saveRadio: $e');
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> get listRadio =>
      _firestore.collection('radio').snapshots();
}
