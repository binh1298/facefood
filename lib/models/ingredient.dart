import 'dart:convert';
import 'package:flutter/material.dart';

class Ingredient{
  final String ingredientName, unitName;
  final int value;

  Ingredient({this.ingredientName, this.unitName, this.value});

  factory Ingredient.fromJson(dynamic json){
    var ingredient = Ingredient(
      ingredientName: json['description'] as String,
      unitName: json('unitName') as String,
      value: json('value') as int,
    );
    return ingredient;
  }
}


Future<List<Ingredient>> fetchListIngredient(int postID) async{
  Ingredient ingredient1 = Ingredient(
    ingredientName: 'Beef',
    unitName: 'g',
    value: 500,
  );
  Ingredient ingredient2 = Ingredient(
    ingredientName: 'Spinach',
    unitName: 'g',
    value: 200,
  );
  Ingredient ingredient3 = Ingredient(
    ingredientName: 'Lemon',
    unitName: '',
    value: 1,
  );
  Ingredient ingredient4 = Ingredient(
    ingredientName: 'Egg',
    unitName: '',
    value: 1,
  );
  Ingredient ingredient5 = Ingredient(
    ingredientName: 'Garlic',
    unitName: 'cloves',
    value: 2,
  );
  Ingredient ingredient6 = Ingredient(
    ingredientName: 'Stock',
    unitName: 'ml',
    value: 100,
  );

  List<Ingredient> result = List();
  result.add(ingredient1);
  result.add(ingredient2);
  result.add(ingredient3);
  result.add(ingredient4);
  result.add(ingredient5);
  result.add(ingredient6);
  return result;
}