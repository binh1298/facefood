import 'dart:convert';
import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;

class Comment {
  final String username, userID, content, avatarUrl;

  Comment({this.avatarUrl, this.username, this.userID, this.content});

  factory Comment.fromJson(dynamic json) {
    var comment = Comment(
      username: json['username'] as String,
      userID: json['userId'] as String,
      content: json['content'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );
    return comment;
  }
}

Future<List<Comment>> fetchComment(int postID) async {
    print('print something here');

  final http.Response response =
      await apiCaller.get(route: '/comments/$postID');
  if (response.statusCode == 200) {
    var postListJson = json.decode(response.body)['message'] as List;
    return postListJson.map((comment) => Comment.fromJson(comment)).toList();
  } else
    return null;
}
