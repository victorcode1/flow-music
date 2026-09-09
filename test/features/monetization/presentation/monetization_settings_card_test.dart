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
  }) async {
    final subscriptions = _TrackingSubscriptionRepository();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(const _AvailableAuth()),
          authUserProvider.overrideWith((ref) => Stream.value(user)),
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

  testWidgets('active Premium access hides both purchase choices', (
    tester,
  ) async {
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
