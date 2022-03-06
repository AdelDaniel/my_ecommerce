import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_ecommerce/features/internet_connection/infrastructure/check_connection_using_url.dart';
import 'package:my_ecommerce/features/internet_connection/infrastructure/network.dart';
import 'network_test.mocks.dart';

// class MockConnectivity extends Mock implements Connectivity {}

// class MockCheckConnectionUsingUrl extends Mock
//     implements CheckConnectionUsingUrl {}

@GenerateMocks([Connectivity, CheckConnectionUsingUrl])
void main() {
  late ConnectivityPlusNetworkInfoRepository
      connectivityPlusNetworkInfoRepository;
  late MockConnectivity mockConnectivity;
  late MockCheckConnectionUsingUrl mockCheckConnectionUsingUrl;
  // TODO:: connection_check_cubit
  // late MockConnectionCheckCubit mockConnectionCheckCubit;
  // final tConnectionFuture = Future.value(true);

  setUp(() {
    mockCheckConnectionUsingUrl = MockCheckConnectionUsingUrl();
    mockConnectivity = MockConnectivity();
    connectivityPlusNetworkInfoRepository =
        ConnectivityPlusNetworkInfoRepository(
      connectivity: mockConnectivity,
      checkConnectionUsingUrl: mockCheckConnectionUsingUrl,
    );
  });

  group('connectivityPlusNetworkInfoRepository tests..', () {
    group('checkConnectionUsingUrl is true.. ', () {
      setUp(() {
        when(mockCheckConnectionUsingUrl.checkConnectionUsingUrl)
            .thenAnswer((_) async => true);
      });

      test('should return true when ConnectivityResult.mobile', () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.mobile);
        // act
        // NOTICE: We're NOT awaiting the result
        // we are test Future.value(true) ::: not testing true or false
        // (true or false) is a bool value :::  (Future.value(true)) is address value
        final actualResult =
            await connectivityPlusNetworkInfoRepository.isConnected;
        // assert
        verify(mockConnectivity.checkConnectivity());
        // Utilizing Dart's default referential equality.
        // Only references to the same object are equal.
        expect(actualResult, true);
      });
      test('should return true when ConnectivityResult.wifi', () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) => Future.value(ConnectivityResult.wifi));
        // act
        // NOTICE: We're NOT awaiting the result
        // we are test Future.value(true) ::: not testing true or false
        // (true or false) is a bool value :::  (Future.value(true)) is address value
        final actualResult =
            await connectivityPlusNetworkInfoRepository.isConnected;
        // assert
        verify(mockConnectivity.checkConnectivity());
        // Utilizing Dart's default referential equality.
        // Only references to the same object are equal.
        expect(actualResult, true);
      });

      test('should return False when ConnectivityResult.none', () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) => Future.value(ConnectivityResult.none));
        // act
        final actualResult =
            await connectivityPlusNetworkInfoRepository.isConnected;
        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(actualResult, false);
      });
    });

    group('checkConnectionUsingUrl is False.. ', () {
      setUp(() {
        when(mockCheckConnectionUsingUrl.checkConnectionUsingUrl)
            .thenAnswer((_) async => false);
      });

      test('should return False when ConnectivityResult.mobile', () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.mobile);
        // act
        final actualResult =
            await connectivityPlusNetworkInfoRepository.isConnected;
        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(actualResult, false);
      });
      test('should return False when ConnectivityResult.wifi', () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) => Future.value(ConnectivityResult.wifi));
        // act
        final actualResult =
            await connectivityPlusNetworkInfoRepository.isConnected;
        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(actualResult, false);
      });

      test('should return False when ConnectivityResult.none', () async {
        // arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) => Future.value(ConnectivityResult.none));
        // act
        final actualResult =
            await connectivityPlusNetworkInfoRepository.isConnected;
        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(actualResult, false);
      });
    });
  });
}
