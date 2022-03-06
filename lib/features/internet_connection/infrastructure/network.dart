import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:my_ecommerce/features/internet_connection/infrastructure/check_connection_using_url.dart';

abstract class AbstractNetworkInfo {
  const AbstractNetworkInfo();
  Future<bool> get isConnected;
  Stream<ConnectivityResult> checkConnectionStream();
}

class ConnectivityPlusNetworkInfoRepository implements AbstractNetworkInfo {
  final Connectivity _connectivity;
  final CheckConnectionUsingUrl _checkConnectionUsingUrl;
  const ConnectivityPlusNetworkInfoRepository({
    required Connectivity connectivity,
    required CheckConnectionUsingUrl checkConnectionUsingUrl,
  })  : _connectivity = connectivity,
        _checkConnectionUsingUrl = checkConnectionUsingUrl;

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return _checkConnectionUsingUrl.checkConnectionUsingUrl;
  }

  @override
  Stream<ConnectivityResult> checkConnectionStream() {
    return _connectivity.onConnectivityChanged;
  }
}
