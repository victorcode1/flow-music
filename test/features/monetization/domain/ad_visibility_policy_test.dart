import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/services/ad_visibility_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdVisibilityPolicy', () {
    test('shows an ad for a resolved free user independently of playback', () {
      expect(
        AdVisibilityPolicy.shouldShow(
          access: const SubscriptionAccess.free(),
          adsSupported: true,
        ),
        isTrue,
      );
    });

    test('never shows an ad before subscription status is resolved', () {
      expect(
        AdVisibilityPolicy.shouldShow(
          access: const SubscriptionAccess.loading(),
          adsSupported: true,
        ),
        isFalse,
      );
    });

    test('never shows an ad when subscription service is unavailable', () {
      expect(
        AdVisibilityPolicy.shouldShow(
          access: const SubscriptionAccess.unavailable(),
          adsSupported: true,
        ),
        isFalse,
      );
    });

    test('hides the ad for premium users', () {
      expect(
        AdVisibilityPolicy.shouldShow(
          access: const SubscriptionAccess(
            isResolved: true,
            serviceAvailable: true,
            isActive: true,
          ),
          adsSupported: true,
        ),
        isFalse,
      );
    });

    test('hides ads on unsupported platforms', () {
      expect(
        AdVisibilityPolicy.shouldShow(
          access: const SubscriptionAccess.free(),
          adsSupported: false,
        ),
        isFalse,
      );
    });
  });
}
