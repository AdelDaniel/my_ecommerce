class ServerException implements Exception {
  final String massege;
  const ServerException([this.massege = "Server Exceptions"]) : super();
}

class CacheException implements Exception {
  final String massege;
  const CacheException([this.massege = "Cache Exceptions"]) : super();
}
