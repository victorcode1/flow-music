import 'package:flow_music/domain/repository/audio_imp.dart';
import 'package:flow_music/domain/repository/user_imp.dart';

abstract class GenealImp {
  AudioImp get audioRepository;
  UserImp get userRepository;
}
