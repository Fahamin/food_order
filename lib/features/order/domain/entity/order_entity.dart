class OrderEntity {
  final String customerName;
  final String customerPhone;
  final String customerAddress;
  final String? notes;
  final List<OrderItemEntity> items;

  OrderEntity({
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
    this.notes,
    required this.items,
  });
}

class OrderItemEntity {
  final int foodId;
  final int quantity;

  OrderItemEntity({
    required this.foodId,
    required this.quantity,
  });
}
