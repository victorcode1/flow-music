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
        kind: PremiumOfferKind.monthly,
        productId: 'remove_ads_monthly',
        priceLabel: r'$0.99',
        period: 'P1M',
      ),
      PremiumOffer(
        kind: PremiumOfferKind.lifetime,
        productId: 'remove_ads_lifetime',
        priceLabel: r'$9.99',
      ),
    ],
    SubscriptionAccess access = const SubscriptionAccess.free(),
    AppUser? signedInUser = user,
  }) async {
    final subscriptions = _TrackingSubscriptionRepository();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(const _AvailableAuth()),
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

  testWidgets('shows monthly and lifetime choices with store prices', (
    tester,
  ) async {
    await pumpCard(tester);

    expect(
      find.widgetWithIcon(FilledButton, Icons.autorenew_rounded),
      findsOneWidget,
    );
    expect(
      find.widgetWithIcon(OutlinedButton, Icons.all_inclusive_rounded),
      findsOneWidget,
    );
    expect(find.text('retry'), findsNothing);
  });

  testWidgets(
    'shows products before sign-in and opens account instead of purchasing',
    (tester) async {
      final subscriptions = await pumpCard(tester, signedInUser: null);
      expect(
        find.widgetWithIcon(FilledButton, Icons.autorenew_rounded),
        findsOneWidget,
      );
      expect(
        find.widgetWithIcon(OutlinedButton, Icons.all_inclusive_rounded),
        findsOneWidget,
      );
      await tester.tap(
        find.widgetWithIcon(OutlinedButton, Icons.all_inclusive_rounded),
      );
      await tester.pumpAndSettle();
      expect(find.byType(BottomSheet), findsOneWidget);
      expect(subscriptions.purchasedKinds, isEmpty);
    },
  );

  testWidgets('does not offer a purchase without store prices', (tester) async {
    await pumpCard(tester, offers: const []);
    expect(
      find.widgetWithIcon(FilledButton, Icons.autorenew_rounded),
      findsNothing,
    );
    expect(
      find.widgetWithIcon(OutlinedButton, Icons.all_inclusive_rounded),
      findsNothing,
    );
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

  testWidgets('routes lifetime selection to the lifetime package', (
    tester,
  ) async {
    final subscriptions = await pumpCard(tester);

    await tester.tap(
      find.widgetWithIcon(OutlinedButton, Icons.all_inclusive_rounded),
    );
    await tester.pumpAndSettle();

    expect(subscriptions.purchasedKinds, [PremiumOfferKind.lifetime]);
  });

  testWidgets('offers retry while the lifetime product is propagating', (
    tester,
  ) async {
    await pumpCard(
      tester,
      offers: const [
        PremiumOffer(
          kind: PremiumOfferKind.monthly,
          productId: 'remove_ads_monthly',
          priceLabel: r'$0.99',
          period: 'P1M',
        ),
      ],
    );

    expect(find.text('retry'), findsOneWidget);
    expect(
      find.widgetWithIcon(OutlinedButton, Icons.all_inclusive_rounded),
      findsNothing,
    );
  });

  testWidgets(
    'lifetime owners can add monthly cloud without buying lifetime again',
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

      expect(
        find.widgetWithIcon(FilledButton, Icons.autorenew_rounded),
        findsOneWidget,
      );
      expect(
        find.widgetWithIcon(OutlinedButton, Icons.all_inclusive_rounded),
        findsNothing,
      );
    },
  );

  testWidgets('monthly cloud subscribers are not asked to buy again', (
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
    expect(
      find.widgetWithIcon(FilledButton, Icons.autorenew_rounded),
      findsNothing,
    );
    expect(
      find.widgetWithIcon(OutlinedButton, Icons.all_inclusive_rounded),
      findsNothing,
    );
  });
}

class _AvailableAuth extends UnavailableAuthRepository {
  const _AvailableAuth();

  @override
  bool get isAvailable => true;

  @override
  AppUser? get currentUser =>
      const AppUser(id: 'test-user', email: 'user@example.com');
}

class _TrackingSubscriptionRepository implements SubscriptionRepository {
  final purchasedKinds = <PremiumOfferKind>[];

  @override
  bool get isAvailable => true;

  @override
  void dispose() {}

  @override
  Future<SubscriptionAccess> identify(String? userId) async =>
      const SubscriptionAccess.free();

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
      productId: kind == PremiumOfferKind.lifetime
          ? 'remove_ads_lifetime'
          : 'remove_ads_monthly',
    );
  }

  @override
  Future<SubscriptionAccess> refresh() async => const SubscriptionAccess.free();

  @override
  Future<SubscriptionAccess> restore() async => const SubscriptionAccess.free();

  @override
  Stream<SubscriptionAccess> watchAccess() =>
      Stream.value(const SubscriptionAccess.free());
}
