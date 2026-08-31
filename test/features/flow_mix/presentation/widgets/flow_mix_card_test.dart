import 'package:flow_music/features/flow_mix/domain/flow_mix_mood.dart';
import 'package:flow_music/features/flow_mix/presentation/controllers/flow_mix_controller.dart';
import 'package:flow_music/features/flow_mix/presentation/widgets/flow_mix_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('offers every Flow Mix mood from the home card', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: SingleChildScrollView(child: FlowMixCard())),
        ),
      ),
    );

    expect(find.byKey(const Key('flow-mix-card')), findsOneWidget);
    for (final mood in FlowMixMood.values) {
      expect(find.byKey(Key('flow-mix-${mood.name}')), findsOneWidget);
    }
  });

  testWidgets('shows progress and disables moods while building a mix', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          flowMixControllerProvider.overrideWithBuild(
            (ref, notifier) => const FlowMixState(
              status: FlowMixStatus.loading,
              mood: FlowMixMood.relax,
            ),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(body: SingleChildScrollView(child: FlowMixCard())),
        ),
      ),
    );

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    for (final mood in FlowMixMood.values) {
      final chip = tester.widget<ActionChip>(
        find.byKey(Key('flow-mix-${mood.name}')),
      );
      expect(chip.onPressed, isNull);
    }
  });
}
