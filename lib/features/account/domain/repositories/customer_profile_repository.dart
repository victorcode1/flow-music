import 'package:flow_music/features/account/domain/entities/app_user.dart';

abstract interface class CustomerProfileRepository {
  Future<void> sync(AppUser user);
}

class NoopCustomerProfileRepository implements CustomerProfileRepository {
  const NoopCustomerProfileRepository();

  @override
  Future<void> sync(AppUser user) async {}
}
