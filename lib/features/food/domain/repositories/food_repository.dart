// lib/domain/repositories/food_repository.dart

import '../entity/food_entity.dart';

abstract class FoodRepository {
  Future<List<FoodEntity>> getFoodsByCategory(int categoryId);
}
