import 'dart:io';

import 'package:flow_music/features/search/data/search_history_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() {
  late Directory temporaryDirectory;
  const repository = SearchHistoryRepository();

  setUpAll(() async {
    temporaryDirectory = await Directory.systemTemp.createTemp(
      'streambeat_search_history_test_',
    );
    Hive.init(temporaryDirectory.path);
    await Hive.openBox(searchHistoryBoxName);
  });

  setUp(() => Hive.box(searchHistoryBoxName).clear());

  tearDownAll(() async {
    await Hive.close();
    if (await temporaryDirectory.exists()) {
      await temporaryDirectory.delete(recursive: true);
    }
  });

  test('stores normalized searches with the newest one first', () async {
    await repository.record('  Bad   Bunny  ');
    await repository.record('Karol G');
    await repository.record('bad bunny');

    expect(repository.readAll(), ['bad bunny', 'Karol G']);
  });

  test('keeps a bounded history', () async {
    for (var index = 0; index < defaultSearchHistoryLimit + 3; index++) {
      await repository.record('query $index');
    }

    final history = repository.readAll();
    expect(history, hasLength(defaultSearchHistoryLimit));
    expect(history.first, 'query 14');
    expect(history.last, 'query 3');
  });

  test('removes individual entries and clears all persisted history', () async {
    await repository.record('Rosalía');
    await repository.record('Rauw Alejandro');

    await repository.remove('  ROSALÍA ');
    expect(repository.readAll(), ['Rauw Alejandro']);

    await repository.clear();
    expect(repository.readAll(), isEmpty);
  });

  test('ignores malformed values stored in the box', () async {
    await Hive.box(
      searchHistoryBoxName,
    ).put('recent_queries', [null, 12, '', '  usable query ', 'USABLE QUERY']);

    expect(repository.readAll(), ['usable query']);
  });
}
