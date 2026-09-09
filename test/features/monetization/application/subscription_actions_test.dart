import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/monetization/application/subscription_actions.dart';
import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/repositories/subscription_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('purchase requires a signed-in account', () async {
    final actions = SubscriptionActions(
      _FakeAuthRepository(),
      _FakeSubscriptionRepository(),
    );

    await expectLater(
      actions.purchase(PremiumOfferKind.monthly),
      throwsA(isA<SubscriptionFailure>()),
    );
  });

  test('purchase identifies RevenueCat with the Supabase user id', () async {
    final subscriptions = _FakeSubscriptionRepository();
    final actions = SubscriptionActions(
      _FakeAuthRepository(
        user: const AppUser(id: 'stable-user-id', email: 'user@example.com'),
      ),
      subscriptions,
    );

    final access = await actions.purchase(PremiumOfferKind.monthly);

    expect(subscriptions.identifiedUserId, 'stable-user-id');
    expect(subscriptions.purchasedKinds, [PremiumOfferKind.monthly]);
    expect(access.isActive, isTrue);
  });

  test('lifetime purchase uses the same stable account entitlement', () async {
    final subscriptions = _FakeSubscriptionRepository();
    final actions = SubscriptionActions(
      _FakeAuthRepository(
        user: const AppUser(id: 'stable-user-id', email: 'user@example.com'),
      ),
      subscriptions,
    );

    final access = await actions.purchase(PremiumOfferKind.lifetime);

    expect(subscriptions.identifiedUserId, 'stable-user-id');
    expect(subscriptions.purchasedKinds, [PremiumOfferKind.lifetime]);
    expect(access.productId, 'remove_ads_lifetime');
    expect(access.expiresAt, isNull);
  });
}

class _FakeAuthRepository implements AuthRepository {
  _FakeAuthRepository({this.user});

  final AppUser? user;

  @override
  Stream<AppUser?> get authStateChanges => Stream.value(user);

  @override
  AppUser? get currentUser => user;

  @override
  bool get isAvailable => true;

  @override
  Future<void> deleteAccount() async {}

  @override
  Future<void> sendPasswordReset(String email) async {}

  @override
  Future<AppUser> signIn({required String email, required String password}) =>
      throw UnimplementedError();

  @override
  Future<AppUser> signInWithGoogle() => throw UnimplementedError();

  @override
  Future<void> signOut() async {}

  @override
  Future<SignUpResult> signUp({
    required String email,
    required String password,
    String? displayName,
  }) => throw UnimplementedError();

  @override
  Future<void> updatePassword(String password) async {}
}

class _FakeSubscriptionRepository implements SubscriptionRepository {
  String? identifiedUserId;
  final purchasedKinds = <PremiumOfferKind>[];

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
  Future<List<PremiumOffer>> loadOffers() async => const [
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
  ];

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
