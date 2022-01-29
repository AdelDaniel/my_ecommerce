import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'check_connection_using_url.dart';

// TODO:: connection_check_cubit
// import '../../features/connection_check/cubit/connection_check_cubit.dart';

abstract class AbstractNetworkInfo {
  const AbstractNetworkInfo();
  Future<bool> get isConnected;
  void checkConnectionStream();
}

class ConnectivityPlusNetworkInfoImpl implements AbstractNetworkInfo {
  final Connectivity connectivity;
  final CheckConnectionUsingUrl checkConnectionUsingUrl;
  // TODO:: connection_check_cubit
  // final ConnectionCheckCubit connectionCheckCubit;
  // const ConnectivityPlusNetworkInfoImpl(
  //     {required this.connectivity, required this.connectionCheckCubit});
  const ConnectivityPlusNetworkInfoImpl(
      {required this.connectivity, required this.checkConnectionUsingUrl});

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return checkConnectionUsingUrl.checkConnectionUsingUrl;
  }

  @override
  void checkConnectionStream() {
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      // TODO:: connection_check_cubit
      // if (result == ConnectivityResult.none) {
      //   connectionCheckCubit.notConnected();
      // } else {
      //   connectionCheckCubit.connected();
      // }
    });
  }
}
