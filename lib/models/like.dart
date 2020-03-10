
import 'dart:convert';

import 'package:facefood/utils/api_caller.dart';
import 'package:facefood/utils/api_routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LikePost {

String likeId,postId,userId,isLiked;

LikePost({this.likeId,this.postId,this.userId,this.isLiked});

likeAPost(BuildContext context) async {
    final http.Response response = await apiCaller.post(
        route: apiRoutes.createRootRoute(apiRoutes.register),
        body: jsonEncode(<String, String>{
       
        }));
    bool success = response.statusCode == 200;
    return success;
}

}
