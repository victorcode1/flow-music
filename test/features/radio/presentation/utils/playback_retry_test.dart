import 'package:flow_music/features/radio/presentation/utils/playback_retry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('retries automatically once and succeeds', () async {
    var attempts = 0;
    var automaticRetryNotices = 0;
    var finalFailureNotices = 0;

    final succeeded = await runPlaybackWithAutomaticRetry(
      attempt: () async {
        attempts++;
        if (attempts == 1) throw StateError('first attempt failed');
      },
      onAutomaticRetry: (_) => automaticRetryNotices++,
      onFinalFailure: (_) => finalFailureNotices++,
      retryDelay: Duration.zero,
    );

    expect(succeeded, isTrue);
    expect(attempts, 2);
    expect(automaticRetryNotices, 1);
    expect(finalFailureNotices, 0);
  });

  test('reports final failure after exactly two attempts', () async {
    var attempts = 0;
    var finalFailureNotices = 0;

    final succeeded = await runPlaybackWithAutomaticRetry(
      attempt: () async {
        attempts++;
        throw StateError('failed');
      },
      onAutomaticRetry: (_) {},
      onFinalFailure: (_) => finalFailureNotices++,
      retryDelay: Duration.zero,
    );

    expect(succeeded, isFalse);
    expect(attempts, 2);
    expect(finalFailureNotices, 1);
  });

  test('does not retry a station superseded by another selection', () async {
    var attempts = 0;
    var isCurrentSelection = true;

    final succeeded = await runPlaybackWithAutomaticRetry(
      attempt: () async {
        attempts++;
        isCurrentSelection = false;
        throw StateError('superseded');
      },
      onAutomaticRetry: (_) {},
      onFinalFailure: (_) {},
      shouldContinue: () => isCurrentSelection,
      retryDelay: Duration.zero,
    );

    expect(succeeded, isFalse);
    expect(attempts, 1);
  });

  test('can use a freshly resolved source for the second attempt', () async {
    final attempts = <String>[];

    final succeeded = await runPlaybackWithAutomaticRetry(
      attempt: () async {
        attempts.add('stale');
        throw StateError('stale URL');
      },
      retryAttempt: () async {
        attempts.add('fresh');
      },
      onAutomaticRetry: (_) {},
      onFinalFailure: (_) {},
      retryDelay: Duration.zero,
    );

    expect(succeeded, isTrue);
    expect(attempts, ['stale', 'fresh']);
  });
}
