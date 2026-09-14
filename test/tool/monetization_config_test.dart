import 'package:flutter_test/flutter_test.dart';

import '../../tool/src/monetization_config.dart';

void main() {
  Map<String, Object?> configuration() => {
    'SUPABASE_URL': 'https://unitproject.supabase.co',
    'SUPABASE_PUBLISHABLE_KEY': 'sb_publishable_UnitTestOnly',
    'REVENUECAT_ANDROID_API_KEY': 'goog_UnitTestOnly',
    'REVENUECAT_IOS_API_KEY': 'appl_UnitTestOnly',
    'REVENUECAT_ENTITLEMENT_ID': 'remove_ads',
    'REVENUECAT_MONTHLY_PRODUCT_ID': 'remove_ads_monthly',
    'REVENUECAT_LIFETIME_PRODUCT_ID': 'remove_ads_lifetime',
    'ADMOB_ANDROID_BANNER_ID': 'ca-app-pub-1234567890123456/1234567890',
    'ADMOB_IOS_BANNER_ID': 'ca-app-pub-1234567890123456/2345678901',
    'AUTH_CALLBACK_URL': 'com.victorflores.streambeat://auth-callback',
    'GOOGLE_WEB_CLIENT_ID': '123456789012-webclient.apps.googleusercontent.com',
    'GOOGLE_IOS_CLIENT_ID': '123456789012-iosclient.apps.googleusercontent.com',
  };
  Map<String, Object?> plist() => {
    'GADApplicationIdentifier': 'ca-app-pub-1234567890123456~3456789012',
    'CFBundleURLTypes': [
      {
        'CFBundleURLSchemes': [
          'com.victorflores.streambeat',
          'com.googleusercontent.apps.123456789012-iosclient',
        ],
      },
    ],
  };

  test('Android checks do not require iOS keys', () {
    final config = configuration()
      ..remove('REVENUECAT_IOS_API_KEY')
      ..remove('ADMOB_IOS_BANNER_ID');
    expect(
      validateMonetizationConfig(
        config,
        platform: MonetizationPlatform.android,
      ),
      isEmpty,
    );
  });

  test('iOS checks native identifiers and its own public keys', () {
    expect(
      validateMonetizationConfig(
        configuration(),
        platform: MonetizationPlatform.ios,
        iosPlist: plist(),
      ),
      isEmpty,
    );
  });

  test('iOS rejects missing keys, wrong store keys and sample ad app', () {
    final config = configuration()
      ..['REVENUECAT_IOS_API_KEY'] = 'goog_WrongStore'
      ..['ADMOB_IOS_BANNER_ID'] = '';
    final native = plist()
      ..['GADApplicationIdentifier'] = 'ca-app-pub-3940256099942544~1458002511';
    final errors = validateMonetizationConfig(
      config,
      platform: MonetizationPlatform.ios,
      iosPlist: native,
    ).join('\n');
    expect(errors, contains('REVENUECAT_IOS_API_KEY'));
    expect(errors, contains('ADMOB_IOS_BANNER_ID'));
    expect(errors, contains('GADApplicationIdentifier'));
  });

  test('iOS rejects mismatched OAuth callback and AdMob publisher', () {
    final native = plist()
      ..['CFBundleURLTypes'] = []
      ..['GADApplicationIdentifier'] = 'ca-app-pub-9876543210987654~3456789012';
    final errors = validateMonetizationConfig(
      configuration(),
      platform: MonetizationPlatform.ios,
      iosPlist: native,
    ).join('\n');
    expect(errors, contains('editores diferentes'));
    expect(errors, contains('esquema invertido'));
    expect(errors, contains('esquema de retorno'));
  });

  test('placeholder and non-string values fail without casting errors', () {
    final config = configuration()
      ..['REVENUECAT_ANDROID_API_KEY'] = 'goog_YOUR_PUBLIC_SDK_KEY'
      ..['GOOGLE_WEB_CLIENT_ID'] = 123;
    expect(
      validateMonetizationConfig(
        config,
        platform: MonetizationPlatform.android,
      ),
      isNotEmpty,
    );
  });

  test('lifetime product configuration remains required', () {
    final config = configuration()..remove('REVENUECAT_LIFETIME_PRODUCT_ID');
    final errors = validateMonetizationConfig(
      config,
      platform: MonetizationPlatform.android,
    ).join('\n');
    expect(errors, contains('REVENUECAT_LIFETIME_PRODUCT_ID'));
    config['REVENUECAT_LIFETIME_PRODUCT_ID'] = 'wrong_product';
    expect(
      validateMonetizationConfig(
        config,
        platform: MonetizationPlatform.android,
      ),
      isNotEmpty,
    );
  });

  test('administrative secrets cannot be bundled in the client', () {
    final config = configuration()
      ..['SUPABASE_SERVICE_ROLE_KEY'] = 'never-print-this';
    final errors = validateMonetizationConfig(
      config,
      platform: MonetizationPlatform.android,
    ).join('\n');
    expect(errors, contains('SUPABASE_SERVICE_ROLE_KEY'));
    expect(errors, isNot(contains('never-print-this')));
  });
}
