//data sourse
import 'package:food_order/features/category/data/source/category_remote_data_source.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../core/providers/dio_provider.dart';
import '../../data/repositories/category_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/entities/category_entity.dart';


final _remoteDatasourceProvider = Provider((ref) => CategoryRemoteDatasource(
  dio: ref.watch(dioProvider),
  baseUrl: 'categories', // API URL
));


final _repositoryProvider = Provider(
        (ref) => CategoryRepositoryImpl(datasource: ref.read(_remoteDatasourceProvider)));


final _getCategoriesProvider = Provider((ref) => GetCategories(ref.read(_repositoryProvider)));


final categoriesListProvider = FutureProvider.autoDispose<List<CategoryEntity>>((ref) async {
  final getCategories = ref.read(_getCategoriesProvider);
  return await getCategories();
});

