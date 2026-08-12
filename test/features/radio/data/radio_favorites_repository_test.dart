import 'dart:io';

import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

void main() {
  test('ignores legacy owner metadata when reading favorites', () async {
    final tempDirectory = Directory.systemTemp.createTempSync(
      'streambeat-favorites-test-',
    );
    Hive.init(tempDirectory.path);
    final box = await Hive.openBox(radioFavoritesBoxName);

    addTearDown(() async {
      await box.close();
      await tempDirectory.delete(recursive: true);
    });

    await box.put('__owner_uid', 'legacy-user-id');

    expect(const RadioFavoritesRepository().readAll(), isEmpty);
  });
}
