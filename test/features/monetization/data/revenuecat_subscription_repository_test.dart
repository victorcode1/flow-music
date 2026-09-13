import 'package:flow_music/features/monetization/data/revenuecat_subscription_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
