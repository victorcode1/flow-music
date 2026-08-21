/// Ensures a video completion is reported once while the player remains at
/// the end. Seeking or replaying resets the guard for the next completion.
class VideoCompletionGuard {
  bool _reported = false;

  bool update({required bool isCompleted}) {
    if (!isCompleted) {
      _reported = false;
      return false;
    }
    if (_reported) return false;

    _reported = true;
    return true;
  }
}
