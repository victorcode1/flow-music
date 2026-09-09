class CloudSyncAccess {
  const CloudSyncAccess({required this.allowed, this.accessUntil});
  const CloudSyncAccess.denied() : this(allowed: false);

  final bool allowed;
  final DateTime? accessUntil;

  bool get isCurrent =>
      allowed && accessUntil != null && accessUntil!.isAfter(DateTime.now());
}

enum CloudSyncState { localOnly, verifying, synced, pending, unavailable }
