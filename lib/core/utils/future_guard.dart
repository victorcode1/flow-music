import 'dart:async';

/// Helpers for futures that live in widget state before a builder listens.
extension FutureErrorGuard<T> on Future<T> {
  /// Marks this future's errors as already handled.
  ///
  /// A future stored inside `setState` is only attached to its [FutureBuilder]
  /// on the next frame. Without this guard, a failure that lands in that window
  /// escapes to the zone and is reported as a fatal unhandled error, even
  /// though the UI renders its error state normally.
  ///
  /// Listeners added afterwards still receive the value or the error.
  Future<T> guarded() => this..ignore();
}
