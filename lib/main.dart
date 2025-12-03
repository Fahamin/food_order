import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_order/features/category/presentaion/pages/category_page.dart';
import 'package:food_order/features/order/presentation/checkout_page.dart';
import 'package:go_router/go_router.dart';

import 'core/utils/routes.dart';
import 'features/food/presentation/pages/food_list_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Food App",
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'category_list',
      builder: (context, state) => const CheckoutPage(),
    ),

    GoRoute(
      path: '${Routes.foodScreen}/:id/:name',
      name: 'food_list',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        final name = state.pathParameters['name']!;
        return FoodListPage(categoryId: id);
      },
    ),
  ],
);
