import 'package:flow_music/features/auth/data/providers/auth_providers.dart';
import 'package:flow_music/features/home/data/location_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_location_record.dart';
import 'user_location_repository.dart';

part 'user_location_providers.g.dart';

@Riverpod(keepAlive: true)
LocationService locationService(Ref ref) {
  return const LocationService();
}

@Riverpod(keepAlive: true)
UserLocationRepository userLocationRepository(Ref ref) {
  return UserLocationRepository(
    client: ref.watch(authenticatedFunctionClientProvider),
    locationService: ref.watch(locationServiceProvider),
  );
}

@riverpod
Stream<List<UserLocationRecord>> usersWithLocations(Ref ref) {
  return ref.watch(userLocationRepositoryProvider).watchUsersWithLocations();
}

@riverpod
Stream<Duration> globalLocationUpdateInterval(Ref ref) {
  return ref
      .watch(userLocationRepositoryProvider)
      .watchGlobalLocationUpdateInterval();
}

@riverpod
Stream<List<UserProfileRecord>> anonymousUsers(Ref ref) {
  return ref.watch(userLocationRepositoryProvider).watchAnonymousUsers();
}

@riverpod
Stream<List<UserLocationHistoryEntry>> userLocationHistory(
  Ref ref,
  String uid,
) {
  return ref.watch(userLocationRepositoryProvider).watchLocationHistory(uid);
}

@riverpod
Stream<LocationHistoryCleanupSchedule> locationHistoryCleanupSchedule(Ref ref) {
  return ref
      .watch(userLocationRepositoryProvider)
      .watchLocationHistoryCleanupSchedule();
}

@riverpod
Stream<AnonymousUserCleanupConfig> anonymousUserCleanupConfig(Ref ref) {
  return ref
      .watch(userLocationRepositoryProvider)
      .watchAnonymousUserCleanupConfig();
}
