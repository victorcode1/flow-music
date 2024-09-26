import 'package:flow_music/datasource/model/song_id_response.dart';

abstract class SongResultDataRepo {
  Future<SongIdResponde?> songSerch({required String songId});
}
