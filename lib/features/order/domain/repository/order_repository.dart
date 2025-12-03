
import '../entity/order_entity.dart';

abstract class OrderRepository {
  Future<bool> submitOrder(OrderEntity order);
}
