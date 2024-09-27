import 'package:flow_music/domain/repository/audio_repo.dart';
import 'package:flow_music/domain/repository/data_repo.dart';
import 'package:flow_music/domain/repository/user_imp.dart';

import 'http_repo.dart';

abstract class GenealRepo {
  DataRepo get dataRepository;
  AudioRepo get audioRepository;
  UserImp get userRepository;
  HttpRepo get httpRepo;
}
