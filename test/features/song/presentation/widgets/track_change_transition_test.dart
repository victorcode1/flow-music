import 'package:flow_music/features/song/presentation/widgets/track_change_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _host({required String trackKey, required String label}) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: TrackChangeTransition(trackKey: trackKey, child: Text(label)),
      ),
    ),
  );
}

void main() {
  testWidgets('relays one track into the next instead of swapping it', (
    tester,
  ) async {
    await tester.pumpWidget(_host(trackKey: 'song-a', label: 'Song A'));
    expect(find.text('Song A'), findsOneWidget);

    await tester.pumpWidget(_host(trackKey: 'song-b', label: 'Song B'));
    await tester.pump(const Duration(milliseconds: 140));

    // A media transicion las dos conviven: una se va mientras la otra entra,
    // que es lo que reemplaza el brinco.
    expect(find.text('Song A'), findsOneWidget);
    expect(find.text('Song B'), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.text('Song A'), findsNothing);
    expect(find.text('Song B'), findsOneWidget);
  });

  testWidgets('no transition while the same song stays on screen', (
    tester,
  ) async {
    await tester.pumpWidget(_host(trackKey: 'song-a', label: 'Song A'));
    // Mismo videoId, metadatos que llegan despues: se actualiza en el sitio.
    await tester.pumpWidget(
      _host(trackKey: 'song-a', label: 'Song A - remaster'),
    );
    await tester.pump(const Duration(milliseconds: 140));

    expect(find.text('Song A'), findsNothing);
    expect(find.text('Song A - remaster'), findsOneWidget);
  });
}
