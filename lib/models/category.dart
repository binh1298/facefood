import 'dart:convert';
import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;

class Category {
  int id;
  String categoryName;
  String createdAt, updatedAt;

  Category({this.id, this.categoryName});

  factory Category.fromJson(dynamic json) {
    return Category(
      id: json['id'] as int,
      categoryName: json['categoryName'] as String,
    );
  }
}

Future<List<Category>> fetchCategoryList() async {
  final http.Response response =
      await apiCaller.get(route: '/categories');
  if (response.statusCode == 200) {
    var categoriesListJson = json.decode(response.body)['message'] as List;
    return categoriesListJson.map((category) => Category.fromJson(category)).toList();
  } else
    return null;
}