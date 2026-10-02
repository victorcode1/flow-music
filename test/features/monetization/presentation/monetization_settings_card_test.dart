import 'package:flow_music/features/account/data/unavailable_auth_repository.dart';
import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/presentation/providers/account_providers.dart';
import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/repositories/subscription_repository.dart';
import 'package:flow_music/features/monetization/presentation/providers/ad_providers.dart';
import 'package:flow_music/features/monetization/presentation/providers/monetization_providers.dart';
import 'package:flow_music/features/monetization/presentation/widgets/monetization_settings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  const user = AppUser(id: 'test-user', email: 'user@example.com');

  Future<_TrackingSubscriptionRepository> pumpCard(
    WidgetTester tester, {
    List<PremiumOffer> offers = const [
      PremiumOffer(
        kind: PremiumOfferKind.small,
        productId: 'streambeat_support_small',
        priceLabel: r'$0.99',
      ),
      PremiumOffer(
        kind: PremiumOfferKind.medium,
        productId: 'streambeat_support_medium',
        priceLabel: r'$2.99',
      ),
      PremiumOffer(
        kind: PremiumOfferKind.large,
        productId: 'streambeat_support_large',
        priceLabel: r'$4.99',
      ),
    ],
    SubscriptionAccess access = const SubscriptionAccess.free(),
    AppUser? signedInUser = user,
    bool authAvailable = true,
  }) async {
    final subscriptions = _TrackingSubscriptionRepository();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(
            _AvailableAuth(signedInUser, authAvailable),
          ),
          authUserProvider.overrideWith((ref) => Stream.value(signedInUser)),
          subscriptionRepositoryProvider.overrideWithValue(subscriptions),
          subscriptionAccessProvider.overrideWith(
            (ref) => Stream.value(access),
          ),
          premiumOffersProvider.overrideWith((ref) async => offers),
          privacyOptionsRequiredProvider.overrideWith((ref) async => false),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(child: MonetizationSettingsCard()),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return subscriptions;
  }

  testWidgets(
    'offers three contribution amounts without subscriptions or lifetime sale',
    (tester) async {
      await pumpCard(tester);

      expect(find.byKey(const ValueKey('contribution-small')), findsOneWidget);
      expect(find.byKey(const ValueKey('contribution-large')), findsOneWidget);
      expect(find.byKey(const ValueKey('contribution-medium')), findsOneWidget);
      expect(find.text('subscribe_monthly_action'), findsNothing);
      expect(find.text('buy_lifetime_action'), findsNothing);
      expect(find.text('retry'), findsNothing);
    },
  );

  for (final kind in PremiumOfferKind.values) {
    testWidgets('guest $kind purchase opens store without account sheet', (
      tester,
    ) async {
      final subscriptions = await pumpCard(tester, signedInUser: null);
      final button = find.byKey(ValueKey('contribution-${kind.name}'));
      await tester.tap(button);
      await tester.pumpAndSettle();
      expect(find.byType(BottomSheet), findsNothing);
      expect(subscriptions.purchasedKinds, [kind]);
      expect(subscriptions.identifiedUserId, isNull);
    });
  }

  testWidgets('guest restores without registration', (tester) async {
    final subscriptions = await pumpCard(tester, signedInUser: null);
    await tester.tap(find.text('restore_purchase'));
    await tester.pumpAndSettle();
    expect(subscriptions.restoreCalls, 1);
    expect(find.byType(BottomSheet), findsNothing);
  });

  testWidgets('store remains available when account service is unavailable', (
    tester,
  ) async {
    final subscriptions = await pumpCard(
      tester,
      signedInUser: null,
      authAvailable: false,
    );
    await tester.tap(find.byKey(const ValueKey('contribution-large')));
    await tester.pumpAndSettle();
    expect(subscriptions.purchasedKinds, [PremiumOfferKind.large]);
    expect(find.text('monetization_unavailable'), findsNothing);
  });

  testWidgets('guest may separately open the optional account sheet', (
    tester,
  ) async {
    final subscriptions = await pumpCard(tester, signedInUser: null);
    await tester.tap(find.text('auth_sign_in_button'));
    await tester.pumpAndSettle();
    expect(find.byType(BottomSheet), findsOneWidget);
    expect(subscriptions.purchasedKinds, isEmpty);
  });

  testWidgets('does not offer a purchase without store prices', (tester) async {
    await pumpCard(tester, offers: const []);
    expect(find.byKey(const ValueKey('contribution-small')), findsNothing);
    expect(find.byKey(const ValueKey('contribution-large')), findsNothing);
    expect(find.text('retry'), findsOneWidget);
    expect(find.text('restore_purchase'), findsOneWidget);
  });

  testWidgets('sign-out keeps account deletion unchecked by default', (
    tester,
  ) async {
    await pumpCard(tester);
    await tester.ensureVisible(find.text('auth_sign_out'));
    await tester.tap(find.text('auth_sign_out'));
    await tester.pumpAndSettle();
    expect(
      tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value,
      isFalse,
    );
    await tester.tap(find.widgetWithText(TextButton, 'cancel'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('account deletion during sign-out needs a second confirmation', (
    tester,
  ) async {
    await pumpCard(tester);
    await tester.ensureVisible(find.text('auth_sign_out'));
    await tester.tap(find.text('auth_sign_out'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(CheckboxListTile));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'auth_sign_out'));
    await tester.pumpAndSettle();
    expect(find.text('auth_sign_out_delete_warning_title'), findsOneWidget);
    await tester.tap(find.widgetWithText(TextButton, 'cancel'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('routes large contribution to its store package', (tester) async {
    final subscriptions = await pumpCard(tester);

    await tester.tap(find.byKey(const ValueKey('contribution-large')));
    await tester.pumpAndSettle();

    expect(subscriptions.purchasedKinds, [PremiumOfferKind.large]);
  });

  testWidgets('offers retry while contribution products are propagating', (
    tester,
  ) async {
    await pumpCard(
      tester,
      offers: const [
        PremiumOffer(
          kind: PremiumOfferKind.small,
          productId: 'remove_ads_monthly',
          priceLabel: r'$0.99',
          period: 'P1M',
        ),
      ],
    );

    expect(find.text('retry'), findsOneWidget);
    expect(find.byKey(const ValueKey('contribution-large')), findsNothing);
  });

  testWidgets(
    'historical owners retain access without being asked to contribute',
    (tester) async {
      await pumpCard(
        tester,
        access: const SubscriptionAccess(
          isResolved: true,
          serviceAvailable: true,
          isActive: true,
          productId: 'remove_ads_lifetime',
        ),
      );

      expect(find.byKey(const ValueKey('contribution-small')), findsNothing);
      expect(find.byKey(const ValueKey('contribution-large')), findsNothing);
    },
  );

  testWidgets('historical monthly subscribers are not asked to buy again', (
    tester,
  ) async {
    await pumpCard(
      tester,
      access: const SubscriptionAccess(
        isResolved: true,
        serviceAvailable: true,
        isActive: true,
        userId: 'test-user',
        productId: 'remove_ads_monthly',
        hasMonthlySubscription: true,
      ),
    );
    expect(find.byKey(const ValueKey('contribution-small')), findsNothing);
    expect(find.byKey(const ValueKey('contribution-large')), findsNothing);
    expect(find.byKey(const Key('cloud-sync-status')), findsNothing);
    expect(find.byKey(const Key('cloud-library-details')), findsNothing);
    expect(find.byIcon(Icons.cloud_outlined), findsNothing);
    expect(find.byKey(const Key('export-local-library')), findsOneWidget);
  });
}

class _AvailableAuth extends UnavailableAuthRepository {
  const _AvailableAuth(this.user, this.available);
  final AppUser? user;
  final bool available;

  @override
  bool get isAvailable => available;

  @override
  AppUser? get currentUser => user;
}

class _TrackingSubscriptionRepository implements SubscriptionRepository {
  final purchasedKinds = <PremiumOfferKind>[];
  String? identifiedUserId;
  int restoreCalls = 0;

  @override
  bool get isAvailable => true;

  @override
  void dispose() {}

  @override
  Future<SubscriptionAccess> identify(String? userId) async {
    identifiedUserId = userId;
    return const SubscriptionAccess.free();
  }

  @override
  Future<void> initialize({String? userId}) async {}

  @override
  Future<List<PremiumOffer>> loadOffers() async => const [];

  @override
  Future<SubscriptionAccess> purchase(PremiumOfferKind kind) async {
    purchasedKinds.add(kind);
    return SubscriptionAccess(
      isResolved: true,
      serviceAvailable: true,
      isActive: true,
      productId: 'streambeat_support_${kind.name}',
    );
  }

  @override
  Future<SubscriptionAccess> refresh() async => const SubscriptionAccess.free();

  @override
  Future<SubscriptionAccess> restore() async {
    restoreCalls++;
    return const SubscriptionAccess.free();
  }

  @override
  Stream<SubscriptionAccess> watchAccess() =>
      Stream.value(const SubscriptionAccess.free());
}
