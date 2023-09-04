import 'package:dartz/dartz.dart';
import 'package:fimh_app/domain/entity/food_entity.dart';
import 'package:fimh_app/domain/entity/food_recognition_entity.dart';
import 'package:fimh_app/domain/usecase/get_food_name.dart';
import 'package:fimh_app/utils/error/failure.dart';
import 'package:fimh_app/utils/usecase/usecase.dart';

abstract class Repository {
  Future<Either<Failure, FoodEntity>> getFood(Params params);
  Future<Either<Failure, FoodRecognitionEntity>> getFoodName(
      FoodImageParams params);
}
