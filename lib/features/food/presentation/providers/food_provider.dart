import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../../../../core/providers/dio_provider.dart';
import '../../data/repositories/food_repository_impl.dart';
import '../../data/source/food_remote_datasource.dart';
import '../../domain/entity/food_entity.dart';
import '../../domain/usecases/get_foods_by_category.dart';



final _foodDatasourceProvider = Provider((ref) =>
    FoodRemoteDatasource(dio: ref.watch(dioProvider), baseUrl: 'categories/'));

final _foodRepositoryProvider =
Provider((ref) => FoodRepositoryImpl(datasource: ref.read(_foodDatasourceProvider)));

final _getFoodsProvider =
Provider((ref) => GetFoodsByCategory(ref.read(_foodRepositoryProvider)));

final foodListProvider = FutureProvider.family<List<FoodEntity>, int>((ref, categoryId) async {
  final getFoods = ref.read(_getFoodsProvider);
  return await getFoods(categoryId);
});

