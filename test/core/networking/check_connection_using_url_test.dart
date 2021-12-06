import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_ecommerce/core/networking/check_connection_using_url.dart';

import 'check_connection_using_url_test.mocks.dart';

@GenerateMocks([CustomInterNetAddress])
void main() {
  late MockCustomInterNetAddress mockCustomInterNetAddress;
  late CheckConnectionUsingUrl checkConnectionUsingUrl;

  setUp(() {
    mockCustomInterNetAddress = MockCustomInterNetAddress();
    checkConnectionUsingUrl = CheckConnectionUsingUrl(
        customInterNetAddress: mockCustomInterNetAddress);
  });

  test('should return true when lookup() return List<InternetAddress>',
      () async {
    // arrange
    when(mockCustomInterNetAddress.lookup)
        .thenAnswer((_) async => [InternetAddress('8.8.8.8')]);
// act
    final actualResult = await checkConnectionUsingUrl.checkConnectionUsingUrl;
// assertion
    verify(mockCustomInterNetAddress.lookup);
    expect(actualResult, true);
  });
  test('should return False when lookup() return empty List[]', () async {
    // arrange
    when(mockCustomInterNetAddress.lookup).thenAnswer((_) async => []);
// act
    final actualResult = await checkConnectionUsingUrl.checkConnectionUsingUrl;
// assertion
    verify(mockCustomInterNetAddress.lookup);
    expect(actualResult, false);
  });
}
