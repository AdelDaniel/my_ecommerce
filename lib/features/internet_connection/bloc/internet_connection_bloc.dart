import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart'
    show ConnectivityResult;
import 'package:equatable/equatable.dart';
import 'package:my_ecommerce/features/internet_connection/infrastructure/network.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnection> {
  final AbstractNetworkInfo _connectionCheck;
  InternetConnectionBloc({required AbstractNetworkInfo connectionCheck})
      : _connectionCheck = connectionCheck,
        super(const InternetConnection(isConnected: false)) {
    _checkConnectionStream();
    on<CheckConnection>(_onCheckConnection);
    on<SetConnectionToFalse>(_onSetConnectionToFalse);
  }

  void _onSetConnectionToFalse(event, Emitter<InternetConnection> emit) {
    emit(const InternetConnection(isConnected: false));
  }

  FutureOr<void> _onCheckConnection(
    event,
    Emitter<InternetConnection> emit,
  ) async {
    try {
      final bool isConnected = await _connectionCheck.isConnected;
      emit(InternetConnection(isConnected: isConnected));
    } catch (e) {
      emit(const InternetConnection(isConnected: false));
    }
  }

  void _checkConnectionStream() {
    _connectionCheck
        .checkConnectionStream()
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        add(const SetConnectionToFalse());
      } else {
        add(const CheckConnection());
      }
    });
  }
}
