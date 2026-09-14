import 'dart:convert';
import 'dart:io';

import 'src/monetization_config.dart';

Future<void> main(List<String> arguments) async {
  var platform = MonetizationPlatform.android;
  var path = 'config/monetization.local.json';
  var plistPath = 'ios/Runner/Info.plist';
  var hasPath = false;
  for (final argument in arguments) {
    if (argument == '--help' || argument == '-h') {
      stdout.writeln(
        'dart run tool/verify_monetization_config.dart [config.json] '
        '[--platform=android|ios] [--ios-plist=ios/Runner/Info.plist]',
      );
      return;
    } else if (argument.startsWith('--platform=')) {
      final name = argument.substring('--platform='.length);
      platform = switch (name) {
        'android' => MonetizationPlatform.android,
        'ios' => MonetizationPlatform.ios,
        _ => _fail('Plataforma no admitida: usa android o ios.'),
      };
    } else if (argument.startsWith('--ios-plist=')) {
      plistPath = argument.substring('--ios-plist='.length);
    } else if (!argument.startsWith('-') && !hasPath) {
      path = argument;
      hasPath = true;
    } else {
      _fail('Argumentos no válidos. Consulta --help.');
    }
  }
  final file = File(path);
  if (!await file.exists()) {
    _fail('No existe $path. Usa config/monetization.example.json como base.');
  }
  final Object? decoded;
  try {
    decoded = jsonDecode(await file.readAsString());
  } on FormatException {
    _fail('El JSON de monetización no es válido.');
  }
  if (decoded is! Map<String, dynamic>) {
    _fail('La configuración debe ser un objeto JSON.');
  }
  Map<String, Object?>? iosPlist;
  if (platform == MonetizationPlatform.ios) {
    if (!Platform.isMacOS) _fail('La validación nativa de iOS requiere macOS.');
    final result = await Process.run('/usr/bin/plutil', [
      '-convert',
      'json',
      '-o',
      '-',
      plistPath,
    ]);
    if (result.exitCode != 0) _fail('No se pudo leer el plist de iOS.');
    final value = jsonDecode(result.stdout as String);
    if (value is! Map<String, dynamic>) _fail('El plist de iOS no es válido.');
    iosPlist = value;
  }
  final errors = validateMonetizationConfig(
    decoded,
    platform: platform,
    iosPlist: iosPlist,
  );
  if (errors.isNotEmpty) _fail(errors.join('\n'));
  stdout.writeln(
    'Validación local de monetización ${platform.name}: correcta. '
    'Esto no confirma la configuración remota ni las compras sandbox.',
  );
}

Never _fail(String message) {
  stderr.writeln('ERROR: $message');
  exit(1);
}
