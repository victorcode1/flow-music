class CloudLibraryStatus {
  const CloudLibraryStatus({
    required this.hasBackup,
    required this.bytesUsed,
    required this.maxBytes,
    this.updatedAt,
    this.deleteAfter,
    this.noticeRequired = false,
  });
  factory CloudLibraryStatus.fromJson(Map<String, dynamic> json) =>
      CloudLibraryStatus(
        hasBackup: json['has_backup'] == true,
        bytesUsed: (json['bytes_used'] as num?)?.toInt() ?? 0,
        maxBytes: (json['max_bytes'] as num?)?.toInt() ?? 2097152,
        updatedAt: DateTime.tryParse(json['updated_at'] as String? ?? ''),
        deleteAfter: DateTime.tryParse(json['delete_after'] as String? ?? ''),
        noticeRequired: json['notice_required'] == true,
      );
  final bool hasBackup;
  final int bytesUsed;
  final int maxBytes;
  final DateTime? updatedAt;
  final DateTime? deleteAfter;
  final bool noticeRequired;
}

class CloudLibraryFailure implements Exception {
  const CloudLibraryFailure(this.code);
  final String code;
}
