import 'dart:convert';
import 'dart:io';

const _requiredAndroidKeys = <String>[
  'SUPABASE_URL',
  'SUPABASE_PUBLISHABLE_KEY',
  'REVENUECAT_ANDROID_API_KEY',
  'REVENUECAT_ENTITLEMENT_ID',
  'REVENUECAT_MONTHLY_PRODUCT_ID',
  'ADMOB_ANDROID_BANNER_ID',
  'AUTH_CALLBACK_URL',
];

Future<void> main(List<String> arguments) async {
  final path = arguments.isEmpty
      ? 'config/monetization.local.json'
      : arguments.single;
  final file = File(path);
  if (!await file.exists()) {
    _fail('No existe $path. Copia config/monetization.example.json primero.');
  }

  final Object? decoded;
  try {
    decoded = jsonDecode(await file.readAsString());
  } on FormatException catch (error) {
    _fail('El JSON de monetización no es válido: ${error.message}');
  }
  if (decoded is! Map<String, dynamic>) {
    _fail('La configuración debe ser un objeto JSON.');
  }
  final config = decoded;

  final missing = _requiredAndroidKeys
      .where((key) => (config[key] as String?)?.trim().isEmpty ?? true)
      .toList();
  if (missing.isNotEmpty) {
    _fail('Faltan valores de producción: ${missing.join(', ')}');
  }

  final supabaseUrl = config['SUPABASE_URL'] as String;
  final publishableKey = config['SUPABASE_PUBLISHABLE_KEY'] as String;
  final revenueCatKey = config['REVENUECAT_ANDROID_API_KEY'] as String;
  final bannerId = config['ADMOB_ANDROID_BANNER_ID'] as String;

  if (!supabaseUrl.startsWith('https://') ||
      !supabaseUrl.endsWith('.supabase.co')) {
    _fail('SUPABASE_URL no parece una URL de proyecto válida.');
  }
  if (!publishableKey.startsWith('sb_publishable_')) {
    _fail('Usa una clave publicable moderna de Supabase, no service_role.');
  }
  if (!revenueCatKey.startsWith('goog_')) {
    _fail('REVENUECAT_ANDROID_API_KEY debe ser la clave pública goog_*.');
  }
  if (!RegExp(r'^ca-app-pub-\d{16}/\d{10}$').hasMatch(bannerId) ||
      bannerId.contains('3940256099942544')) {
    _fail('ADMOB_ANDROID_BANNER_ID no es una unidad de producción válida.');
  }
  if (config['REVENUECAT_ENTITLEMENT_ID'] != 'remove_ads' ||
      config['REVENUECAT_MONTHLY_PRODUCT_ID'] != 'remove_ads_monthly') {
    _fail(
      'Los identificadores deben coincidir con remove_ads/remove_ads_monthly.',
    );
  }

  stdout.writeln('Configuración Android de monetización lista para release.');
}

Never _fail(String message) {
  stderr.writeln('ERROR: $message');
  exit(1);
}
