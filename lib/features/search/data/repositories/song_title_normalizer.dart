/// Normalizes a song/video title to a key suitable for dedup.
///
/// YouTube returns many uploads of the same hit: "Despacito (Official Video)",
/// "Despacito (Lyrics)", "Despacito - Audio", "Despacito | Live", etc. We
/// collapse those into one key so the queue stops feeling like the same song
/// playing over and over.
String normalizeSongTitle(String title) {
  if (title.isEmpty) return '';

  var value = title.toLowerCase();

  // Drop everything inside (), [], {} — covers "(Official Video)",
  // "[HD]", "{Remastered}", etc.
  value = value.replaceAll(RegExp(r'[\(\[\{][^\)\]\}]*[\)\]\}]'), ' ');

  // Drop trailing "- Official Video" / "| Lyrics" style suffixes that survive
  // when there are no brackets.
  value = value.replaceAll(
    RegExp(
      r'(?:[-|–—:]\s*)?\b('
      r'official\s*(music\s*)?video|'
      r'official\s*audio|'
      r'official\s*lyric\s*video|'
      r'lyric\s*video|'
      r'lyrics?\s*video|'
      r'lyrics?|'
      r'music\s*video|'
      r'audio(\s*only)?|'
      r'visualizer|'
      r'video\s*oficial|'
      r'vídeo\s*oficial|'
      r'letra(\s*oficial)?|'
      r'en\s*vivo|'
      r'live(\s*session|\s*performance)?|'
      r'acoustic(\s*version)?|'
      r'unplugged|'
      r'remaster(ed)?(\s*\d{4})?|'
      r'remix|'
      r'extended(\s*version)?|'
      r'radio\s*edit|'
      r'hd|hq|4k'
      r')\b\s*',
      caseSensitive: false,
    ),
    ' ',
  );

  // Strip featuring credits: "feat. X", "ft X", "featuring X".
  value = value.replaceAll(
    RegExp(r'\b(feat\.?|ft\.?|featuring|con|w\/)\b[^-|–—]*'),
    ' ',
  );

  // Collapse separators and punctuation to a single space.
  value = value.replaceAll(RegExp(r'[\-|–—:_,.•]+'), ' ');
  value = value.replaceAll(RegExp(r"[^a-z0-9áéíóúñü\s]"), ' ');
  value = value.replaceAll(RegExp(r'\s+'), ' ').trim();

  return value;
}

/// Clave de deduplicacion para una pista de la cola.
///
/// [normalizeSongTitle] ya colapsa "(Official Video)" / "(Lyrics)" / "- Audio",
/// pero la misma cancion aparece ademas subida como "Artista - Cancion" en el
/// canal oficial y como "Cancion" en el canal "Artista - Topic". Quitamos el
/// nombre del artista del titulo para que ambas caigan en la misma clave y la
/// cola no repita la pista con otro videoId.
String songDedupKey({required String title, required String artist}) {
  final normalizedArtist = normalizeSongTitle(
    artist.replaceAll(RegExp(r'\s*-\s*topic\s*$', caseSensitive: false), ''),
  );
  var normalizedTitle = normalizeSongTitle(title);

  if (normalizedArtist.isNotEmpty) {
    if (normalizedTitle.startsWith('$normalizedArtist ')) {
      normalizedTitle = normalizedTitle
          .substring(normalizedArtist.length + 1)
          .trim();
    } else if (normalizedTitle.endsWith(' $normalizedArtist')) {
      normalizedTitle = normalizedTitle
          .substring(0, normalizedTitle.length - normalizedArtist.length - 1)
          .trim();
    }
  }

  return normalizedTitle;
}
