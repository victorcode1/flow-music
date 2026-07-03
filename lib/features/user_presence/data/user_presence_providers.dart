import 'package:flow_music/features/auth/data/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_presence_repository.dart';

part 'user_presence_providers.g.dart';

@Riverpod(keepAlive: true)
UserPresenceRepository userPresenceRepository(Ref ref) {
  return UserPresenceRepository(
    client: ref.watch(authenticatedFunctionClientProvider),
  );
}
