import 'package:flutter/foundation.dart';

/// Configuracion publica inyectada en compilacion con `--dart-define`.
///
/// Las claves de Supabase, RevenueCat y AdMob usadas por el cliente son
/// identificadores publicos. Las claves administrativas y secretos de webhook
/// nunca deben agregarse a esta clase ni al binario de la aplicacion.
class AppEnvironment {
  const AppEnvironment();

  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
  );

  static const revenueCatAndroidApiKey = String.fromEnvironment(
    'REVENUECAT_ANDROID_API_KEY',
  );
  static const revenueCatIosApiKey = String.fromEnvironment(
    'REVENUECAT_IOS_API_KEY',
  );
  static const revenueCatEntitlementId = String.fromEnvironment(
    'REVENUECAT_ENTITLEMENT_ID',
    defaultValue: 'remove_ads',
  );
  static const revenueCatMonthlyProductId = String.fromEnvironment(
    'REVENUECAT_MONTHLY_PRODUCT_ID',
    defaultValue: 'remove_ads_monthly',
  );

  static const admobAndroidBannerId = String.fromEnvironment(
    'ADMOB_ANDROID_BANNER_ID',
  );
  static const admobIosBannerId = String.fromEnvironment('ADMOB_IOS_BANNER_ID');

  static const authCallbackUrl = String.fromEnvironment(
    'AUTH_CALLBACK_URL',
    defaultValue: 'com.victorflores.streambeat://auth-callback',
  );

  /// OAuth client identifiers are public configuration values. The matching
  /// Google client secret stays only in the Supabase provider configuration.
  static const googleWebClientId = String.fromEnvironment(
    'GOOGLE_WEB_CLIENT_ID',
  );
  static const googleIosClientId = String.fromEnvironment(
    'GOOGLE_IOS_CLIENT_ID',
  );

  static bool get hasSupabaseConfiguration =>
      supabaseUrl.trim().isNotEmpty && supabasePublishableKey.trim().isNotEmpty;

  static bool get supportsNativeMonetization =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  static String get revenueCatApiKey {
    if (!supportsNativeMonetization) return '';
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => revenueCatAndroidApiKey,
      TargetPlatform.iOS => revenueCatIosApiKey,
      _ => '',
    };
  }

  static String get admobBannerId {
    if (!supportsNativeMonetization) return '';
    if (kDebugMode) {
      return switch (defaultTargetPlatform) {
        TargetPlatform.android => 'ca-app-pub-3940256099942544/9214589741',
        TargetPlatform.iOS => 'ca-app-pub-3940256099942544/2435281174',
        _ => '',
      };
    }
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => admobAndroidBannerId,
      TargetPlatform.iOS => admobIosBannerId,
      _ => '',
    };
  }
}
