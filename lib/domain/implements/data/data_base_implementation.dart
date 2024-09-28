import 'package:flow_music/datasource/services/data_repo/data_store_repo.dart';
import 'package:flow_music/domain/repository/data_repo.dart';

class DataBaseImplementation extends DomainDataRepository {
  final DataStoreRepo _data;

  DataBaseImplementation({required DataStoreRepo data}) : _data = data;

  @override
  DataStoreRepo get data => _data;

  @override
  Stream<bool> get isAdmin => _data.isAdmin(user: null);
}
