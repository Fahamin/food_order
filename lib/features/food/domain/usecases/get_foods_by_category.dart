import '../entity/food_entity.dart';
import '../repositories/food_repository.dart';

class GetFoodsByCategory {
  final FoodRepository repository;
  GetFoodsByCategory(this.repository);

  Future<List<FoodEntity>> call(int categoryId) async {
    return await repository.getFoodsByCategory(categoryId);
  }
}