import 'package:flow_music/core/monitoring/sentry_config.dart';
import 'package:flutter/foundation.dart';
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
}
