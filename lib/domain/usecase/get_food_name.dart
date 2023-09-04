import 'package:dartz/dartz.dart';
import 'package:fimh_app/domain/entity/food_recognition_entity.dart';
import 'package:fimh_app/utils/error/failure.dart';

import '../../utils/usecase/usecase.dart';
import '../repositories/repository.dart';

class GetFoodName
    implements UseCaseFuture<FoodRecognitionEntity, FoodImageParams> {
  final Repository repository;

  GetFoodName({required this.repository});

  @override
  Future<Either<Failure, FoodRecognitionEntity>> call(
      FoodImageParams params) async {
    return await repository.getFoodName(params);
  }
}

class FoodImageParams extends Params {
  final String imagePath;

  FoodImageParams({required this.imagePath}) : super(object: [imagePath]);
}
