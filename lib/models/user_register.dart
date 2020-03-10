import 'dart:convert';
import 'package:facefood/utils/api_caller.dart';
import 'package:facefood/utils/api_routes.dart';
import 'package:facefood/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserRegister {
  String username, password, email, confirmPassword;
  UserRegister(
      {this.email, this.username, this.password, this.confirmPassword});

  bool comparePassword() {
    return confirmPassword == password;
  }

  Future<bool> register(BuildContext context) async {
    final http.Response response = await apiCaller.post(
        route: apiRoutes.createRootRoute(apiRoutes.register),
        body: jsonEncode(<String, String>{
          'email': this.email,
          'username': this.username,
          'password': this.password,
          'confirmPassword': this.confirmPassword,
        }));
    bool success = response.statusCode == 200;
    if (success) {
      showInfoSnackBar(context, json.decode(response.body)['message']);
    } else {
      showErrorSnackBar(context, json.decode(response.body)['message']);
    }
    return success;
  }
}
