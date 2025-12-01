

import '../entities/category_entity.dart';
import '../repository/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;
  GetCategories(this.repository);


  Future<List<CategoryEntity>> call() async {
    return await repository.getCategories();
  }
}