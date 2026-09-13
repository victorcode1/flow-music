import 'dart:async';

import 'package:flow_music/core/utils/future_guard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'handles an early error while preserving it for a later listener',
    () async {
      final uncaught = <Object>[];
      final completed = Completer<void>();

      runZonedGuarded(
        () async {
          final source = Completer<int>();
          final guarded = source.future.guarded();

          source.completeError(StateError('temporary network failure'));
          await Future<void>.delayed(Duration.zero);

          await expectLater(guarded, throwsStateError);
          completed.complete();
        },
        (error, stackTrace) {
          uncaught.add(error);
          if (!completed.isCompleted) completed.complete();
        },
      );

      await completed.future.timeout(const Duration(seconds: 2));
      expect(uncaught, isEmpty);
    },
  );
}
