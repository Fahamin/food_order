import '../../../category/data/models/category_model.dart';
import '../../domain/entity/food_entity.dart';

class FoodModel {
  final bool success;
  final List<FoodDataModel> data;

  FoodModel({required this.success, required this.data});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => FoodDataModel.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class FoodDataModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String price;
  final String image;
  final int categoryId;


  FoodDataModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,

  });

  factory FoodDataModel.fromJson(Map<String, dynamic> json) {
    return FoodDataModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      image: json['image'] ?? '',
      categoryId: json['category_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'price': price,
      'image': image,
      'category_id': categoryId,

    };
  }

  /// 🔥 Convert Model → Entity
  FoodEntity toEntity() {
    return FoodEntity(
      id: id,
      name: name,
      slug: slug,
      description: description,
      price: price,
      image: image,
      categoryId: categoryId,

    );
  }
}