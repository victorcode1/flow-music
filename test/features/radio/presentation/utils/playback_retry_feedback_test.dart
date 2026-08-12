import 'package:flow_music/features/radio/presentation/utils/playback_retry_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows a SnackBar while the automatic retry starts', (
    tester,
  ) async {
    final messengerKey = GlobalKey<ScaffoldMessengerState>();
    await _pumpScaffold(tester, messengerKey);

    final notice = showAutomaticPlaybackRetryNotice(messengerKey.currentState);
    await tester.pump();

    expect(notice, isNotNull);
    expect(find.byType(SnackBar), findsOneWidget);
  });

  testWidgets('final SnackBar offers a manual retry action', (tester) async {
    final messengerKey = GlobalKey<ScaffoldMessengerState>();
    var retried = false;
    await _pumpScaffold(tester, messengerKey);

    showFinalPlaybackFailureNotice(
      messengerKey.currentState,
      onRetry: () => retried = true,
    );
    await tester.pump();

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.action, isNotNull);
    snackBar.action!.onPressed();
    expect(retried, isTrue);
  });
}

Future<void> _pumpScaffold(
  WidgetTester tester,
  GlobalKey<ScaffoldMessengerState> messengerKey,
) {
  return tester.pumpWidget(
    MaterialApp(
      scaffoldMessengerKey: messengerKey,
      home: const Scaffold(body: SizedBox.expand()),
    ),
  );
}
