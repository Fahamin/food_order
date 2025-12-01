
import '../../../../core/utils/failure.dart';
import '../../data/models/category_model.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
}