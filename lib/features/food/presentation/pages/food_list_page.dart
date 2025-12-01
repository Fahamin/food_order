import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/food_provider.dart';

class FoodListPage extends ConsumerWidget {
  final int categoryId;


  const FoodListPage({
    super.key,
    required this.categoryId,

  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodState = ref.watch(foodListProvider(categoryId));

    return Scaffold(
      appBar: AppBar(
        title: Text(" Foods"),
      ),
      body: foodState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
        data: (foods) {
          if (foods.isEmpty) {
            return const Center(child: Text("No foods found"));
          }
          return ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final food = foods[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    food.image ?? "",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.fastfood, size: 40),
                  ),
                  title: Text(food.name ?? "No Name"),
                  subtitle: Text(food.description ?? "No Description"),
                  trailing: Text(
                    "৳${food.price ?? "0"}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
