import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class UseCaseFuture<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}

class Params {
  final Object object;

  const Params({required this.object});
}
