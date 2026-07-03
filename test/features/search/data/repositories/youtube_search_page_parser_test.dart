import 'package:flow_music/features/search/data/repositories/youtube_search_page_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const parser = YouTubeSearchPageParser();

  group('YouTubeSearchPageParser', () {
    test('parses video suggestions from ytInitialData', () {
      const html = '''
<html>
  <head>
    <script>
      var ytInitialData = {
        "contents": {
          "twoColumnSearchResultsRenderer": {
            "primaryContents": {
              "sectionListRenderer": {
                "contents": [
                  {
                    "itemSectionRenderer": {
                      "contents": [
                        {
                          "videoRenderer": {
                            "videoId": "abc123",
                            "title": {
                              "runs": [
                                {"text": "Song "},
                                {"text": "One"}
                              ]
                            },
                            "ownerText": {
                              "runs": [
                                {"text": "Artist One"}
                              ]
                            },
                            "thumbnail": {
                              "thumbnails": [
                                {"url": "https://img.example.com/1.jpg"}
                              ]
                            },
                            "lengthText": {"simpleText": "3:10"}
                          }
                        },
                        {
                          "videoRenderer": {
                            "videoId": "def456",
                            "title": {"simpleText": "Song Two"},
                            "longBylineText": {
                              "runs": [
                                {"text": "Artist Two"}
                              ]
                            },
                            "thumbnail": {
                              "thumbnails": [
                                {"url": "//img.example.com/2.jpg"}
                              ]
                            },
                            "lengthText": {"simpleText": "4:03"}
                          }
                        },
                        {
                          "videoRenderer": {
                            "videoId": "abc123",
                            "title": {"simpleText": "Duplicate"},
                            "ownerText": {
                              "runs": [
                                {"text": "Artist Duplicate"}
                              ]
                            },
                            "thumbnail": {
                              "thumbnails": [
                                {"url": "https://img.example.com/dup.jpg"}
                              ]
                            }
                          }
                        }
                      ]
                    }
                  }
                ]
              }
            }
          }
        }
      };
    </script>
  </head>
</html>
''';

      final suggestions = parser.parseSuggestions(html, limit: 12);

      expect(suggestions, hasLength(2));
      expect(suggestions[0].videoId, 'abc123');
      expect(suggestions[0].displayText, 'Song One');
      expect(suggestions[0].channelTitle, 'Artist One');
      expect(suggestions[0].thumbnailUrl, 'https://img.example.com/1.jpg');
      expect(suggestions[0].duration, const Duration(minutes: 3, seconds: 10));
      expect(suggestions[1].videoId, 'def456');
      expect(suggestions[1].displayText, 'Song Two');
      expect(suggestions[1].channelTitle, 'Artist Two');
      expect(suggestions[1].thumbnailUrl, 'https://img.example.com/2.jpg');
      expect(suggestions[1].duration, const Duration(minutes: 4, seconds: 3));
    });

    test('keeps different uploads instead of filtering by title text', () {
      const html = '''
<html>
  <script>
    var ytInitialData = {
      "contents": [
        {
          "videoRenderer": {
            "videoId": "live123",
            "title": {"simpleText": "Song One - Live Performance"},
            "ownerText": {"simpleText": "Artist One"},
            "lengthText": {"simpleText": "5:10"}
          }
        },
        {
          "videoRenderer": {
            "videoId": "studio456",
            "title": {"simpleText": "Song One (Official Audio)"},
            "ownerText": {"simpleText": "Artist One"},
            "lengthText": {"simpleText": "3:10"}
          }
        }
      ]
    };
  </script>
</html>
''';

      final suggestions = parser.parseSuggestions(html, limit: 12);

      expect(suggestions, hasLength(2));
      expect(suggestions[0].videoId, 'live123');
      expect(suggestions[0].displayText, 'Song One - Live Performance');
      expect(suggestions[1].videoId, 'studio456');
      expect(suggestions[1].displayText, 'Song One (Official Audio)');
    });

    test('throws when ytInitialData is missing', () {
      expect(
        () => parser.parseSuggestions('<html></html>'),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
