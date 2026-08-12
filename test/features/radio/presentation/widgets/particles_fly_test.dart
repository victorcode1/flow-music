import 'package:flow_music/features/radio/presentation/widgets/particles_fly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('animates without rebuilding its child every frame', (
    tester,
  ) async {
    var childBuilds = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: SizedBox(
            width: 320,
            height: 480,
            child: ParticlesFly(
              child: Builder(
                builder: (context) {
                  childBuilds++;
                  return const ColoredBox(color: Colors.transparent);
                },
              ),
            ),
          ),
        ),
      ),
    );

    expect(childBuilds, 1);
    await tester.pump(const Duration(milliseconds: 16));
    await tester.pump(const Duration(milliseconds: 250));
    await tester.pump(const Duration(milliseconds: 250));

    expect(tester.takeException(), isNull);
    expect(childBuilds, 1);
  });
}
