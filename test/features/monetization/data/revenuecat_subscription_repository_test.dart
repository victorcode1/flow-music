import 'package:flutter/services.dart';
import 'package:flow_music/features/monetization/domain/services/ad_visibility_policy.dart';
import 'package:flow_music/features/monetization/data/revenuecat_subscription_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('purchases_flutter');

  for (final productId in [
    'remove_ads_monthly',
    'remove_ads_lifetime',
    'streambeat_support_small',
    'streambeat_support_medium',
    'streambeat_support_large',
  ]) {
    test('restored guest $productId activates Premium and hides ads', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            expect(call.method, 'restorePurchases');
            return _customerInfo(productId);
          });
      final repository = RevenueCatSubscriptionRepository();
      addTearDown(() {
        repository.dispose();
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(channel, null);
      });
      final access = await repository.restore();
      expect(access.userId, isNull);
      expect(access.isActive, isTrue);
      expect(access.hasMonthlySubscription, productId == 'remove_ads_monthly');
      expect(
        AdVisibilityPolicy.shouldShow(access: access, adsSupported: true),
        isFalse,
      );
    });
  }

  test('expired guest subscription does not suppress ads', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          channel,
          (call) async => _customerInfo('remove_ads_monthly', expired: true),
        );
    final repository = RevenueCatSubscriptionRepository();
    addTearDown(() {
      repository.dispose();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });
    final access = await repository.restore();
    expect(access.isActive, isFalse);
    expect(access.hasMonthlySubscription, isFalse);
    expect(
      AdVisibilityPolicy.shouldShow(access: access, adsSupported: true),
      isTrue,
    );
  });

  test('matches a Google Play subscription product with its base plan', () {
    expect(
      revenueCatProductIdentifierMatches(
        'remove_ads_monthly:monthly-v1',
        'remove_ads_monthly',
      ),
      isTrue,
    );
  });

  test('matches a one-time product without a base plan suffix', () {
    expect(
      revenueCatProductIdentifierMatches(
        'remove_ads_lifetime',
        'remove_ads_lifetime',
      ),
      isTrue,
    );
  });

  test('does not match a different product with a shared prefix', () {
    expect(
      revenueCatProductIdentifierMatches(
        'remove_ads_monthly_extra:monthly-v1',
        'remove_ads_monthly',
      ),
      isFalse,
    );
  });
}

Map<String, Object?> _customerInfo(String productId, {bool expired = false}) {
  final monthly = productId == 'remove_ads_monthly';
  final expiry = monthly
      ? DateTime.now().add(Duration(days: expired ? -1 : 30)).toIso8601String()
      : null;
  final entitlement = {
    'identifier': 'remove_ads',
    'isActive': !expired,
    'willRenew': monthly && !expired,
    'latestPurchaseDate': '2026-09-01T00:00:00Z',
    'originalPurchaseDate': '2026-09-01T00:00:00Z',
    'productIdentifier': productId,
    'isSandbox': true,
    'store': 'APP_STORE',
    'expirationDate': expiry,
  };
  return {
    'entitlements': {
      'all': {'remove_ads': entitlement},
      'active': expired ? <String, Object?>{} : {'remove_ads': entitlement},
    },
    'allPurchaseDates': {productId: '2026-09-01T00:00:00Z'},
    'activeSubscriptions': monthly && !expired ? [productId] : <String>[],
    'allPurchasedProductIdentifiers': [productId],
    'nonSubscriptionTransactions': <Object?>[],
    'firstSeen': '2026-09-01T00:00:00Z',
    'originalAppUserId': r'$RCAnonymousID:guest-test',
    'allExpirationDates': {productId: expiry},
    'requestDate': DateTime.now().toIso8601String(),
  };
}
