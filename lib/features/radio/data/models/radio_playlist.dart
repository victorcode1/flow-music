import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';

/// Coleccion de emisoras agrupadas por el usuario. Es independiente de las
/// listas de canciones porque la unidad es `RadioStation`, no
/// `DownloadedAudio`.
class RadioPlaylist {
  const RadioPlaylist({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  factory RadioPlaylist.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    return RadioPlaylist(
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
                .map(
                  (item) =>
                      RadioStation.fromJson(Map<String, dynamic>.from(item)),
                )
                .toList()
          : const <RadioStation>[],
    );
  }

  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<RadioStation> items;

  int get itemCount => items.length;

  RadioPlaylist copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<RadioStation>? items,
  }) {
    return RadioPlaylist(
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

String radioPlaylistItemKey(RadioStation station) {
  return RadioFavoritesRepository.keyFor(station);
}
