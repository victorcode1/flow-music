import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/services/ad_visibility_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdVisibilityPolicy', () {
    test('shows one ad for a resolved free user while audio is idle', () {
      expect(
        AdVisibilityPolicy.shouldShow(
          access: const SubscriptionAccess.free(),
          audioSessionActive: false,
          adsSupported: true,
        ),
        isTrue,
      );
    });

    test('never shows an ad before subscription status is resolved', () {
      expect(
        AdVisibilityPolicy.shouldShow(
          access: const SubscriptionAccess.loading(),
          audioSessionActive: false,
          adsSupported: true,
        ),
        isFalse,
      );
    });

    test('never shows an ad when subscription service is unavailable', () {
      expect(
        AdVisibilityPolicy.shouldShow(
          access: const SubscriptionAccess.unavailable(),
          audioSessionActive: false,
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
          audioSessionActive: false,
          adsSupported: true,
        ),
        isFalse,
      );
    });

    test('hides the ad while the radio session is active', () {
      expect(
        AdVisibilityPolicy.shouldShow(
          access: const SubscriptionAccess.free(),
          audioSessionActive: true,
          adsSupported: true,
        ),
        isFalse,
      );
    });
  });
}
