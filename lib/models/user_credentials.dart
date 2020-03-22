import 'dart:convert';

import 'package:facefood/utils/api_caller.dart';
import 'package:facefood/utils/api_routes.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:facefood/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserTokenCredentials {
  String userId, username, roleName;

  UserTokenCredentials({this.userId, this.username, this.roleName});
  factory UserTokenCredentials.fromJson(dynamic json) {
    return UserTokenCredentials(
      roleName: json['roleName'],
      userId: json['userId'],
      username: json['username'],
    );
  }
}

class UserLoginCredentials {
  String username = '';
  String password = '';

  Future<bool> login(BuildContext context) async {
    final http.Response response = await apiCaller.post(
      body: jsonEncode(
        <String, String>{
          'username': username,
          'password': password,
        },
      ),
      route: apiRoutes.login,
    );
    if (response.statusCode != 200) {
      showErrorSnackBar(context, json.decode(response.body)['message']);
      return false;
    }
    await setJwtToken(json.decode(response.body)['token']);
    return true;
  }
}

class UserCreateCredentials {
  String username;
  String password;
  String email;
  String confirmPassword;
  int roleId = 0;

  bool comparePassword() {
    return confirmPassword == password;
  }

  Future<bool> createUser(BuildContext context) async {
    final http.Response response = await apiCaller.post(
      route: apiRoutes.createAdminRoute(apiRoutes.createUsers),
      body: jsonEncode(
        <String, dynamic>{
          'username': username,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'roleId': roleId
        },
      ),
    );
    bool success = response.statusCode == 201;
    if (success) {
      print(json.decode(response.body)['userId']);
    } else {
      showErrorSnackBar(context, json.decode(response.body)['message']);
    }
    return success;
  }
}
