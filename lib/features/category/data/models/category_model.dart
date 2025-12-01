import '../../domain/entities/category_entity.dart';

class CategoryModel {
  final bool success;
  final List<CategoryDataModel> data;


  CategoryModel({required this.success, required this.data});


  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => CategoryDataModel.fromJson(item))
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


class CategoryDataModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String image;


  CategoryDataModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.image,
  });


  factory CategoryDataModel.fromJson(Map<String, dynamic> json) {
    return CategoryDataModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'image': image,
    };
  }


  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      slug: slug,
      description: description,
      image: image,
    );
  }
}