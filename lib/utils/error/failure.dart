abstract class Failure {}

// General failures
class ServerFailure extends Failure {
  final String message;

  ServerFailure({this.message = 'Server Error'});
}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}
