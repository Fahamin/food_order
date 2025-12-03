import 'package:dio/dio.dart';
import '../../../category/data/source/category_local_datasource.dart';
import '../models/order_model.dart';

abstract class OrderRemoteDatasource {
  Future<Response> createOrder(OrderModel model);
}

class OrderRemoteDatasourceImpl extends OrderRemoteDatasource {
  final Dio dio;
  final String baseUrl;
  OrderRemoteDatasourceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Response> createOrder(OrderModel model) async {
    return await dio.post(
      baseUrl,
      data: model.toJson(),
    );
  }
}
