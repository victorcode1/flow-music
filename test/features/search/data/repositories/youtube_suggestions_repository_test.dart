import 'package:flow_music/features/search/data/repositories/youtube_suggestions_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('pipedSearchUriForQuery', () {
    test('includes the required search filter', () {
      final uri = pipedSearchUriForQuery('Top hits 2026');

      expect(uri.host, 'api.piped.private.coffee');
      expect(uri.path, '/search');
      expect(uri.queryParameters['q'], 'Top hits 2026');
      expect(uri.queryParameters['filter'], 'all');
    });
  });
}
