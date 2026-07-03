import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_status_controller.g.dart';

class CacheStatus {
  const CacheStatus({required this.diskFull, required this.acknowledged});

  /// True once a cache write failed because there is no room on disk.
  final bool diskFull;

  /// True once the user has dismissed the disk-full dialog so we don't
  /// show it again this session.
  final bool acknowledged;

  static const CacheStatus initial = CacheStatus(
    diskFull: false,
    acknowledged: false,
  );

  CacheStatus copyWith({bool? diskFull, bool? acknowledged}) {
    return CacheStatus(
      diskFull: diskFull ?? this.diskFull,
      acknowledged: acknowledged ?? this.acknowledged,
    );
  }

  bool get shouldShowDialog => diskFull && !acknowledged;
}

/// Tracks whether the device has run out of room for the autoplay cache.
/// Once flipped, the autoplay queue stops trying to write further files and
/// the UI shows a one-shot dialog so the user knows playback will still work
/// — just without the prefetched local cache.
@Riverpod(keepAlive: true)
class CacheStatusController extends _$CacheStatusController {
  @override
  CacheStatus build() => CacheStatus.initial;

  void markDiskFull() {
    if (state.diskFull) return;
    state = state.copyWith(diskFull: true);
  }

  void acknowledge() {
    if (state.acknowledged) return;
    state = state.copyWith(acknowledged: true);
  }
}
