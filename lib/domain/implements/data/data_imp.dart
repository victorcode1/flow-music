import 'package:flow_music/datasource/services/data_repo/data_store_repo.dart';
import 'package:flow_music/domain/repository/data_repo.dart';

class DataImp extends DataRepo {
  final DataStoreRepo _data;
  DataImp({required DataStoreRepo data}) : _data = data;

  @override
  DataStoreRepo get data => _data;
}
