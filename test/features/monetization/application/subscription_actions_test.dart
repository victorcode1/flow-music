import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/monetization/application/subscription_actions.dart';
import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/repositories/subscription_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final kind in PremiumOfferKind.values) {
    test('guest can purchase $kind without an account', () async {
      final subscriptions = _FakeSubscriptionRepository();
      final actions = SubscriptionActions(_FakeAuthRepository(), subscriptions);
      final access = await actions.purchase(kind);
      expect(subscriptions.identities, [null]);
      expect(subscriptions.purchasedKinds, [kind]);
      expect(access.isActive, isTrue);
    });
  }

  test('guest can restore without an account', () async {
    final subscriptions = _FakeSubscriptionRepository();
    final access = await SubscriptionActions(
      _FakeAuthRepository(),
      subscriptions,
    ).restore();
    expect(subscriptions.identities, [null]);
    expect(subscriptions.restoreCalls, 1);
    expect(access.isActive, isTrue);
  });

  test('signed-in restoration uses the account identity', () async {
    final subscriptions = _FakeSubscriptionRepository();
    await SubscriptionActions(
      _FakeAuthRepository(
        user: const AppUser(id: 'stable-user-id', email: 'user@example.com'),
      ),
      subscriptions,
    ).restore();
    expect(subscriptions.identities, ['stable-user-id']);
    expect(subscriptions.restoreCalls, 1);
  });

  test('purchase identifies RevenueCat with the Supabase user id', () async {
    final subscriptions = _FakeSubscriptionRepository();
    final actions = SubscriptionActions(
      _FakeAuthRepository(
        user: const AppUser(id: 'stable-user-id', email: 'user@example.com'),
      ),
      subscriptions,
    );

    final access = await actions.purchase(PremiumOfferKind.small);

    expect(subscriptions.identifiedUserId, 'stable-user-id');
    expect(subscriptions.purchasedKinds, [PremiumOfferKind.small]);
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

    final access = await actions.purchase(PremiumOfferKind.large);

    expect(subscriptions.identifiedUserId, 'stable-user-id');
    expect(subscriptions.purchasedKinds, [PremiumOfferKind.large]);
    expect(access.productId, 'streambeat_support_large');
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
  Future<AppUser> signInWithApple() => throw UnimplementedError();

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
  final identities = <String?>[];
  int restoreCalls = 0;
  final purchasedKinds = <PremiumOfferKind>[];

  @override
  bool get isAvailable => true;

  @override
  void dispose() {}

  @override
  Future<SubscriptionAccess> identify(String? userId) async {
    identifiedUserId = userId;
    identities.add(userId);
    return const SubscriptionAccess.free();
  }

  @override
  Future<void> initialize({String? userId}) async {}

  @override
  Future<List<PremiumOffer>> loadOffers() async => const [
    PremiumOffer(
      kind: PremiumOfferKind.small,
      productId: 'streambeat_support_small',
      priceLabel: r'$0.99',
      period: 'P1M',
    ),
    PremiumOffer(
      kind: PremiumOfferKind.large,
      productId: 'streambeat_support_large',
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
      productId: kind == PremiumOfferKind.large
          ? 'streambeat_support_large'
          : 'streambeat_support_small',
    );
  }

  @override
  Future<SubscriptionAccess> refresh() async => const SubscriptionAccess.free();

  @override
  Future<SubscriptionAccess> restore() async {
    restoreCalls++;
    return const SubscriptionAccess(
      isResolved: true,
      serviceAvailable: true,
      isActive: true,
    );
  }

  @override
  Stream<SubscriptionAccess> watchAccess() =>
      Stream.value(const SubscriptionAccess.free());
}
