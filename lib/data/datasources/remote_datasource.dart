// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fimh_app/data/models/food_model.dart';
import 'package:fimh_app/data/models/food_recognition_model.dart';
import 'package:fimh_app/utils/error/exception.dart';
import 'package:http_parser/http_parser.dart';

abstract class RemoteDataSource {
  Future<FoodRecognitionModel> getFoodName(String foodImage);
  Future<FoodModel> getFood(String foodName);
}

const BASE_URL = "healthy-cook-be-sjkdpzr2aq-et.a.run.app";

class RemoteDataSourceImpl implements RemoteDataSource {
  final dio = Dio();

  RemoteDataSourceImpl();

  @override
  Future<FoodModel> getFood(String foodName) async {
    final response = await dio.get(
      "https://$BASE_URL/foods/$foodName",
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.data);
      return FoodModel.fromJson(body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<FoodRecognitionModel> getFoodName(String imagePath) async {
    FormData formData = FormData.fromMap({
      "photo": await MultipartFile.fromFile(imagePath,
          filename: "image.jpeg", contentType: MediaType('image', 'jpeg')),
    });

    final response = await dio.post(
      "https://$BASE_URL/receipts/recognize",
      data: formData,
    );

    return FoodRecognitionModel.fromJson(response.data);
  }
}
