part of 'internet_connection_bloc.dart';

abstract class InternetConnectionEvent extends Equatable {
  const InternetConnectionEvent();
}

class CheckConnection extends InternetConnectionEvent {
  const CheckConnection();
  @override
  List<Object?> get props => [];
}

class SetConnectionToFalse extends InternetConnectionEvent {
  const SetConnectionToFalse();
  @override
  List<Object?> get props => [];
}
