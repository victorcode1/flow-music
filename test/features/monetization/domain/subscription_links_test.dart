import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/services/subscription_links.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  SubscriptionAccess access({String? store, String? url}) => SubscriptionAccess(
    isResolved: true,
    serviceAvailable: true,
    isActive: true,
    store: store,
    managementUrl: url,
  );

  test('keeps the store-provided subscription management URL', () {
    const url =
        'https://play.google.com/store/account/subscriptions?sku=remove_ads_monthly&package=com.victorflores.streambeat';
    expect(SubscriptionLinks.management(access(url: url)).toString(), url);
  });

  test('uses the purchase store, not the current device', () {
    expect(
      SubscriptionLinks.management(access(store: 'appStore'))?.host,
      'apps.apple.com',
    );
    expect(
      SubscriptionLinks.management(access(store: 'playStore'))?.host,
      'play.google.com',
    );
    expect(SubscriptionLinks.management(access(store: 'unknownStore')), isNull);
    expect(SubscriptionLinks.management(null), isNull);
  });

  test('rejects untrusted management URLs', () {
    for (final url in [
      'http://apps.apple.com/account/subscriptions',
      'https://apps.apple.com.evil.test/account/subscriptions',
      'https://victim@play.google.com/store/account/subscriptions',
      'https://play.google.com:444/store/account/subscriptions',
      'https://play.google.com/other',
      'javascript:alert(1)',
    ]) {
      expect(
        SubscriptionLinks.management(access(url: url)),
        isNull,
        reason: url,
      );
    }
  });
}
