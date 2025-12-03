

import '../../../order/domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.customerName,
    required super.customerPhone,
    required super.customerAddress,
    super.notes,
    required super.items,
  });

  Map<String, dynamic> toJson() {
    return {
      "customer_name": customerName,
      "customer_phone": customerPhone,
      "customer_address": customerAddress,
      "notes": notes,
      "items": items.map((e) => {
        "food_id": e.foodId,
        "quantity": e.quantity,
      }).toList(),
    };
  }
}

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required super.foodId,
    required super.quantity,
  });
}
