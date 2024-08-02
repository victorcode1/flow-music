import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_fire.g.dart';

@riverpod
class AppFire extends _$AppFire {
  @override
  FutureOr<FirebaseApp?> build() => Future.value(null);

  void add({required FirebaseApp app}) {
    state = AsyncData(app);
  }
}
