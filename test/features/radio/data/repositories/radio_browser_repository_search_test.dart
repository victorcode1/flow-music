import 'package:flow_music/features/radio/data/repositories/radio_browser_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  test('search sends station name and country code together', () async {
    Uri? searchUri;
    final client = MockClient((request) async {
      if (request.url.host == 'all.api.radio-browser.info') {
        return http.Response('[{"name":"radio.example.test"}]', 200);
      }

      searchUri = request.url;
      return http.Response('[]', 200);
    });
    final repository = RadioBrowserRepository(client: client);

    await repository.searchStations(name: 'Rock FM', countryCode: 'pa');

    expect(searchUri?.path, '/json/stations/search');
    expect(searchUri?.queryParameters['name'], 'Rock FM');
    expect(searchUri?.queryParameters['countrycode'], 'PA');
  });
}
