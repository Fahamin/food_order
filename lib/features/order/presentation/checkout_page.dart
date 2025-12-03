import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_order/features/category/data/source/category_local_datasource.dart';

import '../domain/entity/order_entity.dart';
import 'order_providers.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = OrderModel(
      customerName: "Nazmul",
      customerPhone: "01700000000",
      customerAddress: "Dhaka Mirpur",
      notes: "No onion please",
      items: [
        OrderItemEntity(foodId: 1, quantity: 2),
        OrderItemEntity(foodId: 5, quantity: 1),
      ],
    );

    final orderState = ref.watch(orderSubmitProvider(order));

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: orderState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (success) => Center(
          child: Text(
            success ? "Order Placed Successfully 🎉" : "Order Failed!",
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
