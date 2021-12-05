import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.

  const Failure();

  String get message;

  @override
  List<Object?> get props => [message];
}

// Remember, the Repository will catch the Exceptions and return them using the Either type as Failures.
// For this reason, Failure types usually exactly map to Exception types.

// General failures
class ServerFailure extends Failure {
  static const String _mesage = "Oops! Server Failure!";
  const ServerFailure();

  @override
  String get message => _mesage;
}

class CacheFailure extends Failure {
  static const String _mesage = "Oops! Cache Failure!";
  const CacheFailure();

  @override
  String get message => _mesage;
}
