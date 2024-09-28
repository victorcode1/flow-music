import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flow_music/datasource/services/data_repo/data_storage.dart';
import 'package:flutter/material.dart';

class StorageFire extends DataStorage {
  late FirebaseStorage _storage;
  //singleton
  static final StorageFire _instance = StorageFire._internal();
  StorageFire._internal() {
    _storage = FirebaseStorage.instance;
    debugPrint('StorageFire initialized ');
  }
  factory StorageFire() => _instance;

  @override
  Future<String> saveImageRadio(File file) {
    final Reference ref =
        _storage.ref().child('radio/${DateTime.now().toString()}');
    final UploadTask uploadTask = ref.putFile(file);
    return uploadTask
        .then((TaskSnapshot snapshot) => snapshot.ref.getDownloadURL());
  }
}
