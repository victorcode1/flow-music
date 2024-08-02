import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FireCore {
  late final FirebaseApp _app;

  static final FireCore _instance = FireCore._internal();
  factory FireCore({required FirebaseApp data}) {
    _instance._app = data;
    debugPrint('FireCore init : ${_instance._app.name}');
    return _instance;
  }
  FireCore._internal();

  FirebaseApp get app => _app;
}
