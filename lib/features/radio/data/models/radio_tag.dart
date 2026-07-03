class RadioTag {
  const RadioTag({required this.name, required this.stationCount});

  factory RadioTag.fromJson(Map<String, dynamic> json) {
    return RadioTag(
      name: json['name'] as String? ?? '',
      stationCount: json['stationcount'] as int? ?? 0,
    );
  }

  final String name;
  final int stationCount;
}
