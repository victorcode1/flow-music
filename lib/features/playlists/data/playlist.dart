import 'package:flow_music/features/library/data/downloaded_audio.dart';

class Playlist {
  const Playlist({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    return Playlist(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      createdAt:
          DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt:
          DateTime.tryParse(json['updatedAt'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      items: rawItems is List
          ? rawItems
                .whereType<Map>()
                .map((item) => DownloadedAudio.fromJson(Map.from(item)))
                .toList()
          : const <DownloadedAudio>[],
    );
  }

  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<DownloadedAudio> items;

  int get itemCount => items.length;

  Playlist copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<DownloadedAudio>? items,
  }) {
    return Playlist(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

String playlistItemKey(DownloadedAudio audio) {
  if (audio.videoId.isNotEmpty) {
    return '${audio.mediaType.name}:${audio.videoId}';
  }
  return '${audio.mediaType.name}:${audio.filePath}';
}
