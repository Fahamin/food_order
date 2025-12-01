import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/category_providers.dart';

class CategoryPage extends ConsumerWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCategories = ref.watch(categoriesListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: asyncCategories.when(
        data: (categories) => _CategoryList(categories: categories),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: \$e')),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  final List categories;

  const _CategoryList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: categories.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final cat = categories[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: SizedBox(
              width: 72,
              height: 72,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  cat.image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                ),
              ),
            ),
            title: Text(cat.name),
            subtitle: Text(cat.description),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.goNamed(
                'food_list',
                pathParameters: {'id': cat.id.toString(), 'name': cat.name},
              );
            },
          ),
        );
      },
    );
  }
}
