import 'package:flow_music/features/account/domain/entities/cloud_sync_access.dart';

abstract interface class CloudSyncAccessRepository {
  Future<CloudSyncAccess> verify();
}

class NoopCloudSyncAccessRepository implements CloudSyncAccessRepository {
  const NoopCloudSyncAccessRepository();
  @override
  Future<CloudSyncAccess> verify() async => const CloudSyncAccess.denied();
}
