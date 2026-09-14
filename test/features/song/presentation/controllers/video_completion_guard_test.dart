import 'package:flow_music/features/song/presentation/controllers/video_completion_guard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('reports each video completion exactly once', () {
    final guard = VideoCompletionGuard();

    expect(guard.update(isCompleted: false), isFalse);
    expect(guard.update(isCompleted: true), isTrue);
    expect(guard.update(isCompleted: true), isFalse);

    // Seeking back for repeat or replay arms the next completion.
    expect(guard.update(isCompleted: false), isFalse);
    expect(guard.update(isCompleted: true), isTrue);
  });
}
