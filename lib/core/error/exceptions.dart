class ServerException implements Exception {
  String get mainMessage => "Server Exceptions!";
  final String detailedMsg;
  const ServerException({this.detailedMsg = ""}) : super();
}

class LocalException implements Exception {
  String get mainMessage => "Local Exceptions!";
  final String detailedMsg;
  const LocalException({this.detailedMsg = ""}) : super();
}

class CacheException implements Exception {
  String get mainMessage => "Cache Exceptions!";
  final String detailedMsg;
  const CacheException({this.detailedMsg = ""}) : super();
}

class UserAuthenticationException implements Exception {
  String get mainMessage => "User Authentication Exceptions!";
  final String detailedMsg;
  const UserAuthenticationException({this.detailedMsg = ""}) : super();
}
