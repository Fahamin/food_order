import '../../domain/entity/food_entity.dart';
import '../../domain/repositories/food_repository.dart';
import '../source/food_remote_datasource.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodRemoteDatasource datasource;

  FoodRepositoryImpl({required this.datasource});

  @override
  Future<List<FoodEntity>> getFoodsByCategory(int categoryId) async {
    final model = await datasource.fetchFoodsByCategory(categoryId);
    return model.data.map((e) => e.toEntity()).toList();
  }
}