import 'package:dartz/dartz.dart';
import 'package:fimh_app/domain/entity/food_entity.dart';
import 'package:fimh_app/domain/repositories/repository.dart';
import 'package:fimh_app/utils/error/failure.dart';
import 'package:fimh_app/utils/usecase/usecase.dart';

class GetFood implements UseCaseFuture<FoodEntity, Params> {
  final Repository repository;

  GetFood({required this.repository});

  @override
  Future<Either<Failure, FoodEntity>> call(Params params) async {
    return await repository.getFood(params);
  }
}
