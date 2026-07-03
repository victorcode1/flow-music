/// Cancion marcada como favorita por el usuario.
///
/// Se persiste en la caja Hive `favorites` como JSON, indexada por
/// [videoId]. Es un DTO ligero: titulo, autor, thumbnail y fecha en que se
/// marco para poder ordenar.
class FavoriteSong {
  const FavoriteSong({
    required this.videoId,
    required this.title,
    required this.author,
    required this.thumbnailUrl,
    required this.addedAt,
  });

  factory FavoriteSong.fromJson(Map<String, dynamic> json) {
    return FavoriteSong(
      videoId: json['videoId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      author: json['author'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
      addedAt:
          DateTime.tryParse(json['addedAt'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  final String videoId;
  final String title;
  final String author;
  final String thumbnailUrl;
  final DateTime addedAt;

  Map<String, dynamic> toJson() {
    return {
      'videoId': videoId,
      'title': title,
      'author': author,
      'thumbnailUrl': thumbnailUrl,
      'addedAt': addedAt.toIso8601String(),
    };
  }
}
