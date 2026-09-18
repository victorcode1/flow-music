import 'package:flow_music/features/account/data/supabase_auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  test('Apple identities require fresh authorization before deletion', () {
    final user = _user(
      providers: const ['email', 'apple'],
      identities: const [
        UserIdentity(
          id: 'apple-subject',
          userId: 'user-id',
          identityData: {'sub': 'apple-subject'},
          identityId: 'identity-id',
          provider: 'apple',
          createdAt: null,
          lastSignInAt: null,
        ),
      ],
    );

    expect(userUsesAppleIdentity(user), isTrue);
  });

  test('non-Apple accounts delete without an Apple authorization sheet', () {
    expect(userUsesAppleIdentity(_user(providers: const ['email'])), isFalse);
    expect(userUsesAppleIdentity(null), isFalse);
  });
}

User _user({required List<String> providers, List<UserIdentity>? identities}) {
  return User(
    id: 'user-id',
    appMetadata: {'providers': providers},
    userMetadata: const {},
    aud: 'authenticated',
    createdAt: '2026-09-14T00:00:00Z',
    identities: identities,
  );
}
