import 'package:fimh_app/data/models/food_model.dart';
import 'package:fimh_app/domain/entity/food_recognition_entity.dart';

class FoodRecognitionModel extends FoodRecognitionEntity {
  FoodRecognitionModel({
    required super.name,
    required super.confidence,
    required super.nutrition,
  });

  factory FoodRecognitionModel.fromJson(Map<String, dynamic> json) {
    return FoodRecognitionModel(
      name: json['result'],
      confidence: double.parse(json['confidence']),
      nutrition: FoodModel.fromJson(json['nutrition'][0]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'confidence': confidence,
      'nutrition': nutrition,
    };
  }
}
