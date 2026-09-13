import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/services/ad_visibility_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'a cached monthly entitlement cannot hide ads beyond its expiration',
    () {
      final expired = SubscriptionAccess(
        isResolved: true,
        serviceAvailable: true,
        isActive: true,
        productId: 'remove_ads_monthly',
        expiresAt: DateTime.now().subtract(const Duration(seconds: 1)),
      );
      expect(expired.isActive, isFalse);
      expect(
        AdVisibilityPolicy.shouldShow(access: expired, adsSupported: true),
        isTrue,
      );
    },
  );
  test('lifetime still hides ads without granting monthly cloud', () {
    const lifetime = SubscriptionAccess(
      isResolved: true,
      serviceAvailable: true,
      isActive: true,
      productId: 'remove_ads_lifetime',
    );
    expect(lifetime.isActive, isTrue);
    expect(lifetime.hasMonthlySubscription, isFalse);
    expect(
      AdVisibilityPolicy.shouldShow(access: lifetime, adsSupported: true),
      isFalse,
    );
  });
}
