import 'package:dio/dio.dart';

import '../models/category_model.dart';

class CategoryRemoteDatasource {
  final Dio dio;
  final String baseUrl;


  CategoryRemoteDatasource({required this.dio, required this.baseUrl});


  Future<CategoryModel> fetchCategories() async {
    try {
      final response = await dio.get(baseUrl);
      return CategoryModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch categories: \$e');
    }
  }
}