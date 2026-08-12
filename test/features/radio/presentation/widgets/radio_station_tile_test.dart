import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/presentation/widgets/radio_station_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('clips tile ink to its local Material boundary', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RadioStationTile(
            station: RadioStation.fromJson(const {
              'stationuuid': 'test-station',
              'name': 'Test Radio',
              'url': 'https://radio.example.test/stream',
              'country': 'Panama',
            }),
            onTap: _noop,
          ),
        ),
      ),
    );

    final localMaterials = tester
        .widgetList<Material>(
          find.descendant(
            of: find.byType(RadioStationTile),
            matching: find.byType(Material),
          ),
        )
        .where((material) => material.clipBehavior == Clip.antiAlias);

    expect(localMaterials, hasLength(1));
    expect(localMaterials.single.shape, isA<RoundedRectangleBorder>());
  });
}

void _noop() {}
