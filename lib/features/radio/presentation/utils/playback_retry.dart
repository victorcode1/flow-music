import 'dart:async';

typedef PlaybackAttempt = Future<void> Function();
typedef PlaybackFailureCallback = void Function(Object error);

/// Runs an initial playback attempt followed by exactly one automatic retry.
///
/// UI concerns stay in the caller through the callbacks, which also makes the
/// retry policy deterministic and independently testable.
Future<bool> runPlaybackWithAutomaticRetry({
  required PlaybackAttempt attempt,
  PlaybackAttempt? retryAttempt,
  required PlaybackFailureCallback onAutomaticRetry,
  required PlaybackFailureCallback onFinalFailure,
  bool Function()? shouldContinue,
  Duration retryDelay = const Duration(milliseconds: 700),
}) async {
  try {
    await attempt();
    return true;
  } catch (error) {
    if (shouldContinue?.call() == false) return false;
    onAutomaticRetry(error);
  }

  if (retryDelay > Duration.zero) await Future<void>.delayed(retryDelay);
  if (shouldContinue?.call() == false) return false;

  try {
    await (retryAttempt ?? attempt)();
    return true;
  } catch (error) {
    if (shouldContinue?.call() == false) return false;
    onFinalFailure(error);
    return false;
  }
}
