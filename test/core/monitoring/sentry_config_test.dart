import 'package:flow_music/core/monitoring/sentry_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() {
  test('does not initialize Sentry outside release builds', () async {
    expect(kReleaseMode, isFalse);

    var appRunnerCalled = false;
    await SentryConfig.initialize(
      appRunner: () {
        appRunnerCalled = true;
      },
    );

    expect(appRunnerCalled, isTrue);
    expect(Sentry.isEnabled, isFalse);
  });

  test('filters recoverable Android radio source failures', () {
    final event = SentryEvent(
      throwable: PlatformException(
        code: 'AndroidAudioError',
        message: 'Failed to set source.',
        details: 'MEDIA_ERROR_UNKNOWN {what:1}, MEDIA_ERROR_SYSTEM',
      ),
    );

    expect(SentryConfig.isRecoverableRadioPlaybackError(event), isTrue);
  });

  test('keeps unrelated Android audio failures', () {
    final event = SentryEvent(
      throwable: PlatformException(
        code: 'AndroidAudioError',
        message: 'Audio focus was denied.',
      ),
    );

    expect(SentryConfig.isRecoverableRadioPlaybackError(event), isFalse);
  });
}
