import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract final class SentryConfig {
  static const enabled = kReleaseMode;

  // Sentry DSNs are public client keys. Auth tokens must never be added here.
  static const _dsn = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue:
        'https://efc98c8f2b5d28f7fe9187848a09d022@o4505761305198592.ingest.us.sentry.io/4506309866487808',
  );
  static const _environment = String.fromEnvironment('SENTRY_ENVIRONMENT');
  static const _tracesSampleRate = String.fromEnvironment(
    'SENTRY_TRACES_SAMPLE_RATE',
  );
  static const _debug = bool.fromEnvironment('SENTRY_DEBUG');

  static Future<void> initialize({required AppRunner appRunner}) {
    if (!enabled) {
      return Future<void>.sync(appRunner);
    }

    return SentryFlutter.init((options) {
      options
        ..dsn = _dsn
        ..tracesSampleRate = _resolveTracesSampleRate()
        ..sendDefaultPii = false
        ..debug = _debug;

      if (_environment.isNotEmpty) {
        options.environment = _environment;
      }
    }, appRunner: appRunner);
  }

  static double _resolveTracesSampleRate() {
    final configuredRate = double.tryParse(_tracesSampleRate);
    if (configuredRate != null && configuredRate >= 0 && configuredRate <= 1) {
      return configuredRate;
    }

    return 0.1;
  }
}
