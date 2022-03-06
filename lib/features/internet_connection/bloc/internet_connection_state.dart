part of 'internet_connection_bloc.dart';

class InternetConnection extends Equatable {
  final bool isConnected;
  const InternetConnection({required this.isConnected});
  @override
  List<Object?> get props => [isConnected];
}
