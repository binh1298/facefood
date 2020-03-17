import 'dart:convert';

import 'package:facefood/models/post_step.dart';
import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;

class PostDetail {
  int id, timeNeeded, likeCount, commentCount, categoryId;
  String postName, description, imageUrl, username, categoryName;
  bool isDeleted;
  String createdAt, updatedAt;
  int stepCount;
  List<PostStep> steps;

  PostDetail(
      {this.likeCount,
      this.username,
      this.id,
      this.categoryId,
      this.commentCount,
      this.categoryName,
      this.createdAt,
      this.description,
      this.isDeleted,
      this.postName,
      this.timeNeeded,
      this.updatedAt,
      this.imageUrl,
      this.stepCount,
      this.steps});
  factory PostDetail.fromJson(dynamic json) {
    return PostDetail(
      id: json['id'] as int,
      timeNeeded: json['timeNeeded'] as int,
      categoryName: json['categoryName'] as String,
      categoryId: json['categoryId'] as int,
      postName: json['postName'] as String,
      description: json['description'] as String,
      username: json['username'] as String,
      isDeleted: json['isDeleted'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      imageUrl: json['imageUrl'] as String,
      likeCount: json['likeCount'] as int,
      commentCount: json['commentCount'] as int,
      stepCount: json["stepCount"],
      steps: List<PostStep>.from(json["steps"].map((x) => PostStep.fromJson(x))),
    );
  }
}

Future<PostDetail> fetchPostDetail(int postID) async {
  final http.Response response = await apiCaller.get(route: '/posts/$postID');
  if (response.statusCode == 200) {
    var userDetailsJson = json.decode(response.body)['message'];
    return PostDetail.fromJson(userDetailsJson);
  } else
    return null;
}
