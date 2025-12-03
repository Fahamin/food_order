import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:food_order/features/category/data/source/category_local_datasource.dart';

import '../../../core/providers/dio_provider.dart';
import '../data/repository/order_repository.dart';
import '../data/source/order_remote_datasource.dart';
import '../domain/entity/order_entity.dart';
import '../domain/usecase/submit_order_usecase.dart';




final orderDatasourceProvider = Provider<OrderRemoteDatasource>((ref) {
  return OrderRemoteDatasourceImpl(dio: ref.watch(dioProvider), baseUrl: 'orders/');
});

final orderRepositoryProvider = Provider((ref) {
  return OrderRepositoryImpl(ref.read(orderDatasourceProvider));
});

final submitOrderUseCaseProvider = Provider((ref) {
  return SubmitOrderUseCase(ref.read(orderRepositoryProvider));
});

final orderSubmitProvider = FutureProvider.family<bool, OrderModel>((ref, order) async {
  final usecase = ref.read(submitOrderUseCaseProvider);
  return await usecase(order);
});
