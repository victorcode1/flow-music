import 'package:flow_music/features/account/data/apple_auth_gateway.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('hashAppleNonce uses the SHA-256 representation required by Apple', () {
    expect(
      hashAppleNonce('streambeat-nonce'),
      '4830a11cf26137325a8c0a4b1d777ac275e057956285418f0388cfa78de073bb',
    );
  });
}
