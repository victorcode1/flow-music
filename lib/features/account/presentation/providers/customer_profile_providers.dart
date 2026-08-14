import 'package:flow_music/core/backend/backend_providers.dart';
import 'package:flow_music/features/account/data/supabase_customer_profile_repository.dart';
import 'package:flow_music/features/account/domain/repositories/customer_profile_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final customerProfileRepositoryProvider = Provider<CustomerProfileRepository>((
  ref,
) {
  final client = ref.watch(supabaseClientProvider);
  return client == null
      ? const NoopCustomerProfileRepository()
      : SupabaseCustomerProfileRepository(client);
});
