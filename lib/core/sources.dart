import 'package:audioplayers/audioplayers.dart';

class UrlSource extends Source {
  final String url;

  @override
  final String? mimeType;

  UrlSource(this.url, {this.mimeType});

  @override
  Future<void> setOnPlayer(AudioPlayer player) {
    return player.setSourceUrl(url, mimeType: mimeType);
  }

  @override
  String toString() {
    return 'UrlSource(url: $url, mimeType: $mimeType)';
  }
}
