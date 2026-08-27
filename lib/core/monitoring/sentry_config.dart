import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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
        ..environment = _environment.isEmpty ? 'production' : _environment
        ..tracesSampleRate = _resolveTracesSampleRate()
        // Native Android crashes can otherwise arrive with only an unknown
        // address. Tombstones add thread and loaded-library context without
        // enabling PII collection.
        ..enableTombstone = true
        ..sendDefaultPii = false
        // Radio streams are third-party resources. audioplayers reports an
        // unavailable/unsupported stream as AndroidAudioError before our
        // playback retry layer can refresh the URL and show recoverable UI.
        // Do not report those expected failures as fatal production crashes.
        ..beforeSend = _beforeSend
        ..debug = _debug;
    }, appRunner: appRunner);
  }

  static SentryEvent? _beforeSend(SentryEvent event, Hint hint) {
    return isRecoverableRadioPlaybackError(event) ? null : event;
  }

  @visibleForTesting
  static bool isRecoverableRadioPlaybackError(SentryEvent event) {
    final throwable = event.throwable;
    if (throwable is PlatformException &&
        throwable.code == 'AndroidAudioError' &&
        _isFailedRadioSource('${throwable.message} ${throwable.details}')) {
      return true;
    }

    return event.exceptions?.any((exception) {
          final description = '${exception.type} ${exception.value}';
          return description.contains('PlatformException') &&
              description.contains('AndroidAudioError') &&
              _isFailedRadioSource(description);
        }) ??
        false;
  }

  static bool _isFailedRadioSource(String description) {
    return description.contains('Failed to set source') &&
        (description.contains('MEDIA_ERROR_UNKNOWN') ||
            description.contains('MEDIA_ERROR_SYSTEM'));
  }

  static double _resolveTracesSampleRate() {
    final configuredRate = double.tryParse(_tracesSampleRate);
    if (configuredRate != null && configuredRate >= 0 && configuredRate <= 1) {
      return configuredRate;
    }

    return 0.1;
  }
}
