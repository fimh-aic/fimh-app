import 'package:fimh_app/domain/entity/food_entity.dart';

class FoodModel extends FoodEntity {
  FoodModel({
    required super.name,
    required super.calories,
    required super.servingSize,
    required super.fatTotal,
    required super.fatSaturated,
    required super.protein,
    required super.sodium,
    required super.potassium,
    required super.cholesterol,
    required super.carbohydrates,
    required super.fiber,
    required super.sugar,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'],
      calories: json['calories'],
      servingSize: json['serving_size_g'],
      fatTotal: json['fat_total_g'],
      fatSaturated: json['fat_saturated_g'],
      protein: json['protein_g'],
      sodium: json['sodium_mg'],
      potassium: json['potassium_mg'],
      cholesterol: json['cholesterol_mg'],
      carbohydrates: json['carbohydrates_total_g'],
      fiber: json['fiber_g'],
      sugar: json['sugar_g'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'calories': calories,
      'serving_size': servingSize,
      'fat_total': fatTotal,
      'fat_saturated': fatSaturated,
      'protein': protein,
      'sodium': sodium,
      'potassium': potassium,
      'cholesterol': cholesterol,
      'carbohydrates': carbohydrates,
      'fiber': fiber,
      'sugar': sugar,
    };
  }
}
