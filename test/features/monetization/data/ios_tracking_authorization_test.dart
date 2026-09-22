import 'dart:async';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flow_music/features/monetization/data/ios_tracking_authorization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const channel = MethodChannel('app_tracking_transparency');
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  final calls = <String>[];
  var initialStatus = TrackingStatus.notDetermined;
  var decision = TrackingStatus.authorized;
  Completer<int>? pendingDecision;

  void iosTest(String name, Future<void> Function(WidgetTester) body) {
    testWidgets(name, (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      try {
        await body(tester);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    });
  }

  setUp(() {
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    calls.clear();
    initialStatus = TrackingStatus.notDetermined;
    decision = TrackingStatus.authorized;
    pendingDecision = null;
    binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
      call,
    ) async {
      calls.add(call.method);
      if (call.method == 'getTrackingAuthorizationStatus') {
        return initialStatus.index;
      }
      return pendingDecision?.future ?? decision.index;
    });
  });

  tearDown(() {
    binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
    debugDefaultTargetPlatformOverride = null;
  });

  iosTest('waits for the native decision before permitting ads', (
    tester,
  ) async {
    pendingDecision = Completer<int>();
    var completed = false;
    final preparation = prepareIosTrackingAuthorization().then((value) {
      completed = true;
      return value;
    });
    await tester.pump();
    await tester.pump();
    expect(calls, [
      'getTrackingAuthorizationStatus',
      'requestTrackingAuthorization',
    ]);
    expect(completed, isFalse);
    pendingDecision!.complete(TrackingStatus.authorized.index);
    await tester.pump();
    expect(await preparation, isTrue);
  });

  for (final status in [
    TrackingStatus.denied,
    TrackingStatus.restricted,
    TrackingStatus.authorized,
  ]) {
    iosTest('respects existing ${status.name} without another prompt', (
      tester,
    ) async {
      initialStatus = status;
      final preparation = prepareIosTrackingAuthorization();
      await tester.pump();
      await tester.pump();
      expect(await preparation, isTrue);
      expect(calls, ['getTrackingAuthorizationStatus']);
    });
  }

  iosTest('blocks ads when the system prompt is interrupted', (tester) async {
    decision = TrackingStatus.notDetermined;
    final preparation = prepareIosTrackingAuthorization();
    await tester.pump();
    await tester.pump();
    expect(await preparation, isFalse);
  });

  iosTest('waits until foreground before asking for permission', (
    tester,
  ) async {
    binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    final preparation = prepareIosTrackingAuthorization();
    await tester.pump();
    expect(calls, isEmpty);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump();
    expect(await preparation, isTrue);
  });

  iosTest('does not invoke ATT on Android', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    expect(await prepareIosTrackingAuthorization(), isTrue);
    expect(calls, isEmpty);
  });
}
