import '../../domain/entities/category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../source/category_remote_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDatasource datasource;


  CategoryRepositoryImpl({required this.datasource});


  @override
  Future<List<CategoryEntity>> getCategories() async {
    final model = await datasource.fetchCategories();
    return model.data.map((e) => e.toEntity()).toList();
  }
}