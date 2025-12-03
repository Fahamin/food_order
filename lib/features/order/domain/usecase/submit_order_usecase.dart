
import '../entity/order_entity.dart';
import '../repository/order_repository.dart';

class SubmitOrderUseCase {
  final OrderRepository repository;

  SubmitOrderUseCase(this.repository);

  Future<bool> call(OrderEntity order) {
    return repository.submitOrder(order);
  }
}
