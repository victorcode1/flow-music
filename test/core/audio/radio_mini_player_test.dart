import 'package:audio_service/audio_service.dart';
import 'package:flow_music/core/audio/radio_mini_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('recognizes every audio preparation state', () {
    expect(isRadioPlaybackLoading(AudioProcessingState.loading), isTrue);
    expect(isRadioPlaybackLoading(AudioProcessingState.buffering), isTrue);
    expect(isRadioPlaybackLoading(AudioProcessingState.ready), isFalse);
    expect(isRadioPlaybackLoading(AudioProcessingState.error), isFalse);
  });

  testWidgets('mini player replaces play with a disabled loading indicator', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RadioMiniPlayerPrimaryControl(
            isLoading: true,
            isPlaying: false,
            tooltip: 'Cargando...',
            onPressed: null,
          ),
        ),
      ),
    );

    expect(
      find.byKey(const Key('radio-mini-player-loading-indicator')),
      findsOneWidget,
    );
    expect(find.byIcon(Icons.play_arrow_rounded), findsNothing);
    expect(find.byIcon(Icons.pause_rounded), findsNothing);

    final control = tester.widget<IconButton>(
      find.byKey(const Key('radio-mini-player-primary-control')),
    );
    expect(control.onPressed, isNull);
  });

  testWidgets('mini player restores pause after playback starts', (
    tester,
  ) async {
    var presses = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RadioMiniPlayerPrimaryControl(
            isLoading: false,
            isPlaying: true,
            tooltip: 'Pausar',
            onPressed: () => presses++,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.pause_rounded), findsOneWidget);
    expect(
      find.byKey(const Key('radio-mini-player-loading-indicator')),
      findsNothing,
    );

    await tester.tap(
      find.byKey(const Key('radio-mini-player-primary-control')),
    );
    expect(presses, 1);
  });
}
