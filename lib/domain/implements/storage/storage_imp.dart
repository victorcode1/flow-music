import 'package:flow_music/datasource/services/data_repo/data_storage.dart';
import 'package:flow_music/domain/repository/storage_repo.dart';

class StorageImp extends StorageRepo {
  final DataStorage _storageService;

  StorageImp({required DataStorage storageService})
      : _storageService = storageService;

  @override
  DataStorage get dataStorage => _storageService;
}
