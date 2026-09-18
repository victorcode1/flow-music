enum MonetizationPlatform { android, ios }

/// Local checks do not prove store approval, pricing or sandbox purchases.
List<String> validateMonetizationConfig(
  Map<String, Object?> config, {
  required MonetizationPlatform platform,
  Map<String, Object?>? iosPlist,
}) {
  final errors = <String>[];
  final isIos = platform == MonetizationPlatform.ios;
  final suffix = isIos ? 'IOS' : 'ANDROID';
  final revenueKey = 'REVENUECAT_${suffix}_API_KEY';
  final bannerKey = 'ADMOB_${suffix}_BANNER_ID';
  final required = [
    'SUPABASE_URL',
    'SUPABASE_PUBLISHABLE_KEY',
    revenueKey,
    'REVENUECAT_ENTITLEMENT_ID',
    'REVENUECAT_MONTHLY_PRODUCT_ID',
    'REVENUECAT_LIFETIME_PRODUCT_ID',
    bannerKey,
    'AUTH_CALLBACK_URL',
    'GOOGLE_WEB_CLIENT_ID',
    if (isIos) 'GOOGLE_IOS_CLIENT_ID',
  ];
  String value(String key) =>
      config[key] is String ? (config[key] as String).trim() : '';
  for (final key in required) {
    final text = value(key);
    if (text.isEmpty ||
        RegExp(r'YOUR_|example|0{10}', caseSensitive: false).hasMatch(text)) {
      errors.add('$key falta o contiene un valor de ejemplo.');
    }
  }
  for (final key in config.keys) {
    if (RegExp(
      r'SERVICE_ROLE|SECRET|PRIVATE_KEY|PASSWORD',
      caseSensitive: false,
    ).hasMatch(key)) {
      errors.add('$key no puede incluirse en la configuración del cliente.');
    }
  }
  final url = Uri.tryParse(value('SUPABASE_URL'));
  if (url == null ||
      url.scheme != 'https' ||
      url.userInfo.isNotEmpty ||
      !RegExp(r'^[a-z0-9]+\.supabase\.co$').hasMatch(url.host) ||
      (url.path.isNotEmpty && url.path != '/') ||
      url.hasQuery ||
      url.hasFragment) {
    errors.add('SUPABASE_URL no es una URL HTTPS de proyecto válida.');
  }
  if (!value('SUPABASE_PUBLISHABLE_KEY').startsWith('sb_publishable_')) {
    errors.add('Usa una clave publicable de Supabase, nunca service_role.');
  }
  final prefix = isIos ? 'appl_' : 'goog_';
  if (!RegExp('^$prefix[A-Za-z0-9]+\$').hasMatch(value(revenueKey))) {
    errors.add('$revenueKey debe ser una clave pública $prefix*.');
  }
  bool productionAdId(String id, String separator) =>
      RegExp('^ca-app-pub-[0-9]{16}$separator[0-9]{10}\$').hasMatch(id) &&
      !id.contains('3940256099942544') &&
      !id.contains('0000000000000000');
  if (!productionAdId(value(bannerKey), '/')) {
    errors.add('$bannerKey no es una unidad de producción válida.');
  }
  final oauthPattern = RegExp(r'^\d+-[a-z0-9]+\.apps\.googleusercontent\.com$');
  for (final key in [
    'GOOGLE_WEB_CLIENT_ID',
    if (isIos) 'GOOGLE_IOS_CLIENT_ID',
  ]) {
    if (!oauthPattern.hasMatch(value(key))) {
      errors.add('$key no es un cliente OAuth válido.');
    }
  }
  if (value('AUTH_CALLBACK_URL') !=
      'com.victorflores.streambeat://auth-callback') {
    errors.add(
      'AUTH_CALLBACK_URL debe coincidir con el esquema nativo de StreamBeat.',
    );
  }
  if (value('REVENUECAT_ENTITLEMENT_ID') != 'remove_ads' ||
      value('REVENUECAT_MONTHLY_PRODUCT_ID') != 'remove_ads_monthly' ||
      value('REVENUECAT_LIFETIME_PRODUCT_ID') != 'remove_ads_lifetime') {
    errors.add(
      'Los identificadores deben ser remove_ads/remove_ads_monthly/remove_ads_lifetime.',
    );
  }
  if (isIos) {
    for (final key in [
      'NSLocationWhenInUseUsageDescription',
      'NSLocationAlwaysAndWhenInUseUsageDescription',
    ]) {
      final purpose = iosPlist?[key];
      if (purpose is! String || purpose.trim().isEmpty) {
        errors.add('Info.plist: falta una descripción válida para $key.');
      }
    }
    final appId = iosPlist?['GADApplicationIdentifier'];
    if (appId is! String || !productionAdId(appId, '~')) {
      errors.add(
        'Info.plist: GADApplicationIdentifier sigue vacío o es de prueba.',
      );
    } else if (value(bannerKey).split('/').first != appId.split('~').first) {
      errors.add(
        'La app de AdMob y el banner iOS pertenecen a editores diferentes.',
      );
    }
    final schemes = <String>{};
    final urlTypes = iosPlist?['CFBundleURLTypes'];
    if (urlTypes is List) {
      for (final type in urlTypes.whereType<Map>()) {
        final items = type['CFBundleURLSchemes'];
        if (items is List) schemes.addAll(items.whereType<String>());
      }
    }
    final reversedClient = value(
      'GOOGLE_IOS_CLIENT_ID',
    ).split('.').reversed.join('.');
    if (!schemes.contains(reversedClient)) {
      errors.add(
        'Info.plist: falta el esquema invertido de GOOGLE_IOS_CLIENT_ID.',
      );
    }
    if (!schemes.contains('com.victorflores.streambeat')) {
      errors.add('Info.plist: falta el esquema de retorno de autenticación.');
    }
  }
  return errors;
}
