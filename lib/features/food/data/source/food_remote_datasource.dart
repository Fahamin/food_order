import 'package:dio/dio.dart';

import '../models/food_model.dart';

class FoodRemoteDatasource {
  final Dio dio;
  final String baseUrl;

  FoodRemoteDatasource({required this.dio, required this.baseUrl});

  Future<FoodModel> fetchFoodsByCategory(int categoryId) async {
    try {
      final response = await dio.get('$baseUrl$categoryId/foods');
      return FoodModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch foods: $e');
    }
  }
}