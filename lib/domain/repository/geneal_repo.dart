import 'package:flow_music/domain/repository/audio_repo.dart';
import 'package:flow_music/domain/repository/data_repo.dart';
import 'package:flow_music/domain/repository/image_picker_repo.dart';
import 'package:flow_music/domain/repository/storage_repo.dart';
import 'package:flow_music/domain/repository/user_imp.dart';

import 'http_repo.dart';

abstract class GenealRepo {
  ImagePickerRepo get imagePickerRepository;
  StorageRepo get storageRepository;
  DomainDataRepository get dataRepository;
  AudioRepo get audioRepository;
  UserImp get userRepository;
  HttpRepo get httpRepo;
}
