import 'package:flow_music/domain/repository/audio_repo.dart';
import 'package:flow_music/domain/repository/user_imp.dart';

import 'http_repo.dart';

abstract class GenealRepo {
  AudioRepo get audioRepository;
  UserImp get userRepository;
  HttpRepo get httpRepo;
}
