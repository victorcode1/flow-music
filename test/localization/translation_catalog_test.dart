import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  const localeFiles = <String>[
    'assets/translations/en.json',
    'assets/translations/es.json',
    'assets/translations/pt-BR.json',
  ];

  test('all locale catalogs expose the same keys and placeholders', () {
    final catalogs = <String, Map<String, dynamic>>{
      for (final path in localeFiles)
        path: jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>,
    };
    final reference = catalogs[localeFiles.first]!;

    for (final entry in catalogs.entries.skip(1)) {
      expect(
        entry.value.keys.toSet(),
        reference.keys.toSet(),
        reason: '${entry.key} must match ${localeFiles.first}',
      );
      for (final key in reference.keys) {
        expect(
          _placeholders(entry.value[key] as String),
          _placeholders(reference[key] as String),
          reason: 'Placeholders for "$key" must match in ${entry.key}',
        );
      }
    }
  });

  test('Brazilian Portuguese catalog contains production copy', () {
    final catalog =
        jsonDecode(File(localeFiles.last).readAsStringSync())
            as Map<String, dynamic>;

    expect(catalog['portuguese_brazil'], 'Português (Brasil)');
    expect(catalog['radio'], 'Rádio');
    expect(catalog['share_station_message'], contains('StreamBeat'));
    expect(catalog.values.whereType<String>(), everyElement(isNotEmpty));
  });
}

List<String> _placeholders(String value) {
  return RegExp(
    r'\{[^}]*\}',
  ).allMatches(value).map((match) => match.group(0)!).toList(growable: false);
}
