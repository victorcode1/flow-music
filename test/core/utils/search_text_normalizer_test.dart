import 'package:flow_music/core/utils/search_text_normalizer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ignores case, diacritics, whitespace and punctuation', () {
    expect(normalizeSearchText('MÁXIMA-FM 102.5'), 'maximafm1025');
    expect(normalizeSearchText('maxima fm 102 5'), 'maximafm1025');
    expect(
      searchTextContains('Radio Máxima-FM 102.5', 'MAXIMA FM 102 5'),
      isTrue,
    );
  });

  test('normalizes Spanish and extended Latin characters', () {
    expect(normalizeSearchText('Música Española'), 'musicaespanola');
    expect(normalizeSearchText('Straße & Cœur'), 'strassecoeur');
  });

  test('keeps word boundaries for the remote API query', () {
    expect(normalizeSearchQuery('  MÁXIMA-FM...102.5  '), 'maxima fm 102 5');
  });
}
