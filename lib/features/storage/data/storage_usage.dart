class StorageUsage {
  const StorageUsage({
    required this.downloadBytes,
    required this.downloadCount,
    required this.offlineBytes,
    required this.offlineCount,
    required this.cacheBytes,
  });

  final int downloadBytes;
  final int downloadCount;
  final int offlineBytes;
  final int offlineCount;
  final int cacheBytes;

  int get totalBytes => downloadBytes + offlineBytes + cacheBytes;
}
