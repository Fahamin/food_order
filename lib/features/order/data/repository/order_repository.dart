

import '../../../category/data/source/category_local_datasource.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/repository/order_repository.dart';
import '../source/order_remote_datasource.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDatasource datasource;

  OrderRepositoryImpl(this.datasource);

  @override
  Future<bool> submitOrder(OrderEntity order) async {
    final model = OrderModel(
      customerName: order.customerName,
      customerPhone: order.customerPhone,
      customerAddress: order.customerAddress,
      notes: order.notes,
      items: order.items,
    );

    final response = await datasource.createOrder(model);

    return response.statusCode == 201;
  }
}
