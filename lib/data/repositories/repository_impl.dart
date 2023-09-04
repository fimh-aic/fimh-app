import 'package:dartz/dartz.dart';
import 'package:fimh_app/data/datasources/remote_datasource.dart';
import 'package:fimh_app/domain/entity/food_entity.dart';
import 'package:fimh_app/domain/entity/food_recognition_entity.dart';
import 'package:fimh_app/domain/repositories/repository.dart';
import 'package:fimh_app/domain/usecase/get_food_name.dart';
import 'package:fimh_app/utils/error/failure.dart';
import 'package:fimh_app/utils/usecase/usecase.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, FoodEntity>> getFood(Params params) {
    // TODO: implement getFood
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, FoodRecognitionEntity>> getFoodName(
      FoodImageParams params) async {
    try {
      print("image");
      print(params.imagePath);
      final food = await remoteDataSource.getFoodName(params.imagePath);
      print("Repository food: ${food.name}");
      return Right(food);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
