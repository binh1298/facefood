import 'dart:convert';
import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;

class Unit {
  int id;
  String unitName;
  String createdAt, updatedAt;


  Unit({this.id, this.unitName});

  factory Unit.fromJson(dynamic json) {
    return Unit(
      id: json['id'] as int,
      unitName: json['unitName'] as String,
    );
  }
}

Future<List<Unit>> fetchUnitList() async {
  final http.Response response =
      await apiCaller.get(route: '/units');
  if (response.statusCode == 200) {
    var unitsListJson = json.decode(response.body)['message'] as List;
    return unitsListJson.map((unit) => Unit.fromJson(unit)).toList();
  } else
    return null;
}