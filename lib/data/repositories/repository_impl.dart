import 'package:dartz/dartz.dart';
import 'package:fimh_app/domain/entity/food_entity.dart';
import 'package:fimh_app/domain/repositories/repository.dart';
import 'package:fimh_app/utils/error/failure.dart';
import 'package:fimh_app/utils/usecase/usecase.dart';

class RepositoryImpl implements Repository {
  @override
  Future<Either<Failure, FoodEntity>> getFood(Params params) {
    // TODO: implement getFood
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getFoodName(Params params) {
    // TODO: implement getFoodName
    throw UnimplementedError();
  }
}
