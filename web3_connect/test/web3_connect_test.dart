import 'package:flutter_test/flutter_test.dart';

import 'package:web3_connect/web3_connect.dart';

void main() {
  test('connect to wallet', () {
    final w3c = Web3Connect();
    expect(w3c.connect(), null);
  });

  test('kill session', () {
    final w3c = Web3Connect();
    w3c.connect();
    expect(w3c.disconnect(), null);
  });
}
