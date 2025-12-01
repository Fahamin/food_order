import '../../../category/domain/entities/category_entity.dart';

class FoodEntity {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String price;
  final String image;
  final int categoryId;


  FoodEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,

  });
}