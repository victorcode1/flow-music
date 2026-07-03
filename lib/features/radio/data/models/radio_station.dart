class RadioStation {
  const RadioStation({
    required this.stationUuid,
    required this.name,
    required this.url,
    required this.urlResolved,
    required this.homepage,
    required this.favicon,
    required this.tags,
    required this.country,
    required this.countryCode,
    required this.language,
    required this.codec,
    required this.bitrate,
    required this.votes,
    required this.clickCount,
    required this.lastCheckOk,
    required this.latitude,
    required this.longitude,
    required this.rawData,
  });

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return RadioStation(
      stationUuid: json['stationuuid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
      urlResolved: json['url_resolved'] as String? ?? '',
      homepage: json['homepage'] as String? ?? '',
      favicon: json['favicon'] as String? ?? '',
      tags: json['tags'] as String? ?? '',
      country: json['country'] as String? ?? '',
      countryCode: json['countrycode'] as String? ?? '',
      language: json['language'] as String? ?? '',
      codec: json['codec'] as String? ?? '',
      bitrate: json['bitrate'] as int? ?? 0,
      votes: json['votes'] as int? ?? 0,
      clickCount: json['clickcount'] as int? ?? 0,
      lastCheckOk: json['lastcheckok'] as int? ?? 0,
      latitude: _parseCoordinate(json['geo_lat']),
      longitude: _parseCoordinate(json['geo_long']),
      rawData: Map.unmodifiable(json),
    );
  }

  final String stationUuid;
  final String name;
  final String url;
  final String urlResolved;
  final String homepage;
  final String favicon;
  final String tags;
  final String country;
  final String countryCode;
  final String language;
  final String codec;
  final int bitrate;
  final int votes;
  final int clickCount;
  final int lastCheckOk;
  final double? latitude;
  final double? longitude;
  final Map<String, dynamic> rawData;

  String get artworkUrl {
    final normalizedUrl = favicon.trim();
    if (normalizedUrl.isEmpty) return '';

    final uri = Uri.tryParse(normalizedUrl);
    if (uri == null || uri.host.isEmpty) return '';

    final scheme = uri.scheme.toLowerCase();
    if (scheme != 'http' && scheme != 'https') return '';

    return uri.toString();
  }

  String get streamUrl => urlResolved.isNotEmpty ? urlResolved : url;
  bool get isPlayable => streamUrl.isNotEmpty;
  bool get hasGeoPoint => latitude != null && longitude != null;

  Map<String, dynamic> toJson() => Map<String, dynamic>.from(rawData);
}

double? _parseCoordinate(Object? value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value.trim());
  return null;
}
