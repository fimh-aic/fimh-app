class ServerException implements Exception {
  final int statusCode;
  final String message;

  ServerException({this.statusCode = 500, this.message = 'Server Error'});
}

class CacheException implements Exception {
  final String message;

  CacheException({this.message = 'Cache Exception'});
}
