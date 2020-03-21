import 'dart:convert';

import 'package:facefood/utils/api_caller.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LikePost {
  int postId;
  bool isLiked;
  LikePost({this.postId, this.isLiked});

 factory LikePost.fromJson(dynamic json){
    return LikePost(
      isLiked: json["isLiked"] as bool,
    );
 }

  Future<bool> changeLikeStatus(BuildContext context, bool isLiked) async {
    String url;
    if (isLiked) {
      url = '/likes/unlike';
    } else {
      url = '/likes/like';
    }
    var user = await getUserFromToken();
    String userId = user.userId;
    print('like.dart: userId= $userId & postId= $postId');
    final http.Response response = await apiCaller.post(
        route: url,
        body: jsonEncode(<String, String>{
          'userId': userId,
          'postId': postId.toString(),
        }));
    bool success = response.statusCode == 200;
    print('like.dart: is success= $success');
    return success;
  }

  Future<LikePost> checkIfLikePost(int postId) async {
    var user = await getUserFromToken();
    String username = user.username;
    String url = '/likes/status?username=$username&postId=$postId';
    final http.Response response = await apiCaller.get(
      route: url,
    );
    print('thing : ' + json.decode(response.body)['message']);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return LikePost.fromJson(json.decode(response.body)['message']);
    }else{
      return null;
    }
  }
}
