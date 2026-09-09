import 'dart:async';

import 'package:flow_music/core/analytics/product_analytics.dart';
import 'package:flow_music/core/engagement/subscription_promo_coordinator.dart';
import 'package:flow_music/core/routes/app_navigator_key.dart';
import 'package:flow_music/core/routes/routes.dart' as app_routes;
import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/presentation/providers/monetization_providers.dart';
import 'package:flow_music/features/monetization/presentation/widgets/subscription_promo_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('shows and dismisses promo from above the router Navigator', (
    tester,
  ) async {
    final harness = _Harness();
    addTearDown(harness.dispose);
    await harness.mount(tester);
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(harness.coordinator.shown, 1);
    expect(harness.sink.events, ['subscription_promo_shown']);

    await tester.tap(
      find.widgetWithText(TextButton, 'subscription_promo_later'),
    );
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
    expect(harness.router.routeInformationProvider.value.uri.path, '/home');

    harness.access.add(const SubscriptionAccess.free());
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
    expect(harness.coordinator.shown, 1);
  });

  testWidgets('promo action opens settings using the existing router', (
    tester,
  ) async {
    final harness = _Harness();
    addTearDown(harness.dispose);
    await harness.mount(tester);
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    await tester.tap(
      find.widgetWithText(FilledButton, 'subscription_promo_action'),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(harness.router.routeInformationProvider.value.uri.path, '/settings');
    expect(harness.sink.events, [
      'subscription_promo_shown',
      'subscription_promo_opened',
    ]);
  });

  testWidgets(
    'missing Navigator does not consume promo and retries on rebuild',
    (tester) async {
      final harness = _Harness()..navigatorVisible.value = false;
      addTearDown(harness.dispose);
      await harness.mount(tester);
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byType(AlertDialog), findsNothing);
      expect(harness.coordinator.shown, 0);
      expect(harness.sink.events, isEmpty);

      harness.navigatorVisible.value = true;
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(harness.coordinator.shown, 1);
    },
  );

  testWidgets('disposing before the delay does not open or count a promo', (
    tester,
  ) async {
    final harness = _Harness();
    addTearDown(harness.dispose);
    await harness.mount(tester);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 3));
    expect(tester.takeException(), isNull);
    expect(harness.coordinator.shown, 0);
  });

  testWidgets('disposing while saving display does not use disposed ref', (
    tester,
  ) async {
    final harness = _Harness();
    final persisted = Completer<void>();
    harness.coordinator.persistence = persisted.future;
    addTearDown(harness.dispose);
    await harness.mount(tester);
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
    persisted.complete();
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  for (final entry in {
    'Premium': const SubscriptionAccess(
      isResolved: true,
      serviceAvailable: true,
      isActive: true,
    ),
    'loading': const SubscriptionAccess.loading(),
    'unavailable': const SubscriptionAccess.unavailable(),
  }.entries) {
    testWidgets('${entry.key} access never opens a promo', (tester) async {
      final harness = _Harness();
      addTearDown(harness.dispose);
      await harness.mount(tester, initialAccess: entry.value);
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byType(AlertDialog), findsNothing);
      expect(harness.coordinator.shown, 0);
    });
  }

  testWidgets('Premium acquired during delay prevents the queued promotion', (
    tester,
  ) async {
    final harness = _Harness();
    addTearDown(harness.dispose);
    await harness.mount(tester);
    harness.access.add(
      const SubscriptionAccess(
        isResolved: true,
        serviceAvailable: true,
        isActive: true,
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.byType(AlertDialog), findsNothing);
    expect(harness.coordinator.shown, 0);
  });
}

class _Harness {
  final navigatorKey = GlobalKey<NavigatorState>();
  final navigatorVisible = ValueNotifier(true);
  final access = StreamController<SubscriptionAccess>();
  final coordinator = _PromoCoordinator();
  final sink = _AnalyticsSink();
  late final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(path: '/home', builder: (_, _) => const Scaffold()),
      GoRoute(path: '/settings', builder: (_, _) => const Scaffold()),
    ],
  );

  Future<void> mount(
    WidgetTester tester, {
    SubscriptionAccess initialAccess = const SubscriptionAccess.free(),
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appNavigatorKeyProvider.overrideWithValue(navigatorKey),
          app_routes.routeProvider.overrideWith(() => _TestRoute(router)),
          subscriptionAccessProvider.overrideWith((_) => access.stream),
          subscriptionPromoCoordinatorProvider.overrideWithValue(coordinator),
          productAnalyticsProvider.overrideWithValue(
            ProductAnalytics(
              sink: sink,
              anonymousId: 'test',
              sessionId: 'test',
              platform: 'test',
              appVersion: 'test',
              localeProvider: () => 'en',
            ),
          ),
        ],
        child: ValueListenableBuilder<bool>(
          valueListenable: navigatorVisible,
          builder: (_, visible, _) => MaterialApp.router(
            routerConfig: router,
            // Reproduce the production hierarchy, not a listener under home.
            builder: (_, child) => SubscriptionPromoListener(
              child: visible ? child! : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
    access.add(initialAccess);
    await tester.pump();
  }

  Future<void> dispose() async {
    router.dispose();
    navigatorVisible.dispose();
    await access.close();
  }
}

class _TestRoute extends app_routes.Route {
  _TestRoute(this.router);
  final GoRouter router;
  @override
  GoRouter build() => router;
}

class _PromoCoordinator implements SubscriptionPromoCoordinator {
  int launches = 0;
  int shown = 0;
  Future<void>? persistence;
  @override
  Future<void> recordLaunch() async => launches++;
  @override
  bool shouldShow({DateTime? now}) => shown == 0;
  @override
  Future<void> markShown({DateTime? now}) async {
    shown++;
    await persistence;
  }
}

class _AnalyticsSink implements AnalyticsEventSink {
  final events = <String>[];
  @override
  Future<void> write(Map<String, dynamic> event) async {
    events.add(event['event_name'] as String);
  }
}
