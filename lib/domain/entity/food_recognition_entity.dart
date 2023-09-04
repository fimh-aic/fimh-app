import 'package:fimh_app/domain/entity/food_entity.dart';

class FoodRecognitionEntity {
  final String name;
  final num confidence;
  final FoodEntity nutrition;

  FoodRecognitionEntity({
    required this.name,
    required this.confidence,
    required this.nutrition,
  });
}
