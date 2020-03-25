import 'dart:convert';

import 'package:facefood/utils/api_caller.dart';
import 'package:facefood/utils/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Comment {
  String username, userID, content, avatarUrl;
  int postID,commentId;
  bool isReported;
  Comment(
      {this.avatarUrl, this.username, this.userID, this.content, this.postID,this.commentId,this.isReported});

  factory Comment.fromJson(dynamic json) {
    var comment = Comment(
      isReported: json['isReported'] as bool,
      commentId:json['id'] as int,
      username: json['username'] as String,
      userID: json['userId'] as String,
      content: json['content'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );
    return comment;
  }

  sendComment(BuildContext context,String userId) async {
    String url = '/comments/';
    final http.Response response = await apiCaller.post(
        route: url,
        body: jsonEncode(<String, String>{
          'postId': this.postID.toString(),
          'userId': userId,
          'content': this.content,
        }));
    int status = response.statusCode;
    print('my status $status');
    if (response.statusCode == 200) {
      return true;
    } else
      showErrorSnackBar(context, 'Your Comment was not send!');
    return false;
  }
}

Future<List<Comment>> fetchComment(int postID) async {
  final http.Response response =
      await apiCaller.get(route: '/comments/$postID');
  if (response.statusCode == 200) {
    var postListJson = json.decode(response.body)['message'] as List;
    return postListJson.map((comment) => Comment.fromJson(comment)).toList();
  } else
    return null;
}

Future<bool> removeComment(int commentId) async {
  final http.Response response =
      await apiCaller.put(route: '/comments/$commentId/delete');
  if (response.statusCode == 200) {
    return true;
  } else
    return false;
}
Future<bool> reportComment(int commentId) async {
  final http.Response response =
      await apiCaller.put(route: '/comments/$commentId/report');
  if (response.statusCode == 200) {
    return true;
  } else
    return false;
}
