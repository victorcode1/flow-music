/// Converts user-facing text into a compact search key.
///
/// Case, diacritics, whitespace and punctuation are intentionally ignored, so
/// values such as `MÁXIMA-FM`, `maxima fm` and `Máxima.FM` compare equally.
String normalizeSearchText(String value) {
  return _foldDiacritics(
    value.trim().toLowerCase(),
  ).replaceAll(RegExp('[^a-z0-9]'), '');
}

/// Produces a Radio Browser-friendly query while preserving word boundaries.
String normalizeSearchQuery(String value) {
  final folded = _foldDiacritics(value.trim().toLowerCase());
  return folded
      .replaceAll(RegExp('[^a-z0-9]+'), ' ')
      .trim()
      .replaceAll(RegExp(r'\s+'), ' ');
}

bool searchTextContains(String candidate, String rawQuery) {
  final query = normalizeSearchText(rawQuery);
  return query.isEmpty || normalizeSearchText(candidate).contains(query);
}

String _foldDiacritics(String value) {
  var result = value;
  for (final entry in _diacriticReplacements.entries) {
    for (final character in entry.value.split('')) {
      result = result.replaceAll(character, entry.key);
    }
  }
  return result;
}

const Map<String, String> _diacriticReplacements = {
  'a': 'àáâãäåāăąǎ',
  'ae': 'æ',
  'c': 'çćĉċč',
  'd': 'ďđð',
  'e': 'èéêëēĕėęě',
  'g': 'ĝğġģ',
  'h': 'ĥħ',
  'i': 'ìíîïĩīĭįıǐ',
  'j': 'ĵ',
  'k': 'ķ',
  'l': 'ĺļľŀł',
  'n': 'ñńņňŉŋ',
  'o': 'òóôõöøōŏőǒ',
  'oe': 'œ',
  'r': 'ŕŗř',
  's': 'śŝşš',
  'ss': 'ß',
  't': 'ţťŧþ',
  'u': 'ùúûüũūŭůűųǔ',
  'w': 'ŵ',
  'y': 'ýÿŷ',
  'z': 'źżž',
};
