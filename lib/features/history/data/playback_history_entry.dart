enum PlaybackHistoryKind {
  radio;

  static PlaybackHistoryKind fromName(String? name) {
    return PlaybackHistoryKind.values.firstWhere(
      (kind) => kind.name == name,
      orElse: () => PlaybackHistoryKind.radio,
    );
  }
}

class PlaybackHistoryEntry {
  const PlaybackHistoryEntry({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.thumbnailUrl,
    required this.playedAt,
    required this.playCount,
    required this.kind,
    this.stationData = const {},
  });

  factory PlaybackHistoryEntry.fromJson(Map<String, dynamic> json) {
    return PlaybackHistoryEntry(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
      playedAt:
          DateTime.tryParse(json['playedAt'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      playCount: json['playCount'] as int? ?? 1,
      kind: PlaybackHistoryKind.fromName(json['kind'] as String?),
      stationData: json['stationData'] is Map<String, dynamic>
          ? Map<String, dynamic>.unmodifiable(
              json['stationData'] as Map<String, dynamic>,
            )
          : const {},
    );
  }

  final String id;
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final DateTime playedAt;
  final int playCount;
  final PlaybackHistoryKind kind;
  final Map<String, dynamic> stationData;

  PlaybackHistoryEntry copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? thumbnailUrl,
    DateTime? playedAt,
    int? playCount,
    PlaybackHistoryKind? kind,
    Map<String, dynamic>? stationData,
  }) {
    return PlaybackHistoryEntry(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      playedAt: playedAt ?? this.playedAt,
      playCount: playCount ?? this.playCount,
      kind: kind ?? this.kind,
      stationData: stationData ?? this.stationData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'thumbnailUrl': thumbnailUrl,
      'playedAt': playedAt.toIso8601String(),
      'playCount': playCount,
      'kind': kind.name,
      if (stationData.isNotEmpty) 'stationData': stationData,
    };
  }
}
