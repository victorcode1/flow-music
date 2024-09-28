import 'package:flow_music/datasource/services/data_repo/data_store_repo.dart';

abstract class DomainDataRepository {
  DataStoreRepo get data;

  Stream<bool> get isAdmin;
}
