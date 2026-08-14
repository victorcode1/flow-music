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
      actions.purchaseMonthly(),
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

    final access = await actions.purchaseMonthly();

    expect(subscriptions.identifiedUserId, 'stable-user-id');
    expect(access.isActive, isTrue);
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
  Future<SubscriptionOffer> loadMonthlyOffer() async => const SubscriptionOffer(
    productId: 'remove_ads_monthly',
    priceLabel: r'$1.00',
    period: 'P1M',
  );

  @override
  Future<SubscriptionAccess> purchaseMonthly() async =>
      const SubscriptionAccess(
        isResolved: true,
        serviceAvailable: true,
        isActive: true,
      );

  @override
  Future<SubscriptionAccess> refresh() async => const SubscriptionAccess.free();

  @override
  Future<SubscriptionAccess> restore() async => const SubscriptionAccess.free();

  @override
  Stream<SubscriptionAccess> watchAccess() =>
      Stream.value(const SubscriptionAccess.free());
}
