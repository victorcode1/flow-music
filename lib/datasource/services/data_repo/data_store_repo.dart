import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class DataStoreRepo {
  Stream<QuerySnapshot<Map<String, dynamic>>> get listRadio;

  Future saveUser({required User user});

  Future logAuth();

  void saveRadio(String text, String text2);
}
