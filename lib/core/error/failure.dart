import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.

  const Failure([this.detailedMsg = ""]);
  final String detailedMsg;
  String get mainMessage;

  @override
  List<String> get props => [mainMessage, detailedMsg];
}

// Remember, the Repository will catch the Exceptions and return them using the Either type as Failures.
// For this reason, Failure types usually exactly map to Exception types.

// General failures
class ServerFailure extends Failure {
  const ServerFailure({required String detailedMsg}) : super(detailedMsg);

  @override
  String get mainMessage => "Oops! Server Failure!";
}

class CacheFailure extends Failure {
  const CacheFailure({String detailedMsg = ""}) : super(detailedMsg);

  @override
  String get mainMessage => "Oops! Cache Failure!";
}

class LocalFailure extends Failure {
  const LocalFailure({String detailedMsg = ""}) : super(detailedMsg);

  @override
  String get mainMessage => "Oops! Local Failure!";
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({String detailedMsg = ""}) : super(detailedMsg);

  @override
  String get mainMessage => "Oops! No Internet eConnection!";
}
