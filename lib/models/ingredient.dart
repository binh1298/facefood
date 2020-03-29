import 'dart:convert';
import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;

class Ingredient {
  String ingredientName, unitName;
  int value;

  Ingredient({this.ingredientName, this.unitName, this.value});

  factory Ingredient.fromJson(dynamic json) {
    var ingredient = Ingredient(
      ingredientName: json['ingredientName'] as String,
      unitName: json['unitName'] as String,
      value: json['value'] as int,
    );
    return ingredient;
  }
}

Future<List<Ingredient>> fetchListIngredient(int postID) async {
  final http.Response response =
      await apiCaller.get(route: '/ingredients?postId=$postID');
  if (response.statusCode == 200) {
    var postListJson = json.decode(response.body)['message'] as List;
    return postListJson.map((post) => Ingredient.fromJson(post)).toList();
  } else
    return null;
}
