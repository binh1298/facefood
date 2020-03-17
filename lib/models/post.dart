import 'dart:convert';

import 'package:facefood/models/post_step.dart';
import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;

class Post {
  int id, timeNeeded, likeCount, commentCount, categoryId;
  String postName, description, imageUrl, username, categoryName;
  bool isDeleted;
  String createdAt, updatedAt;
  int stepCount;
  List<PostStep> steps;

  Post(
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
      this.stepCount});
  factory Post.fromJson(dynamic json) {
    return Post(
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
    );
  }
}

Future<Post> fetchLastestPost() async {
  // final http.Response response = await apiCaller.get();

  Post post = Post(
    categoryName: 'Vietnamese',
    description: 'This taste really good',
    postName: 'Hủ Tiếu Nam Vang',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 10,
    commentCount: 25,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F76%2FH%25E1%25BB%25A7_ti%25E1%25BA%25BFu_th%25E1%25BA%25ADp_c%25E1%25BA%25A9m.jpg%2F1200px-H%25E1%25BB%25A7_ti%25E1%25BA%25BFu_th%25E1%25BA%25ADp_c%25E1%25BA%25A9m.jpg&f=1&nofb=1',
  );
  return post;
}

Future<List<Post>> fetchPromotionList() async {
  // fetch from explore route
  final http.Response response = await apiCaller.get(route: '/posts/explore');
  if (response.statusCode == 200) {
    var postListJson = json.decode(response.body)['message'] as List;
    print('print something here');
    print(postListJson[1].toString());
    return postListJson.map((post) => Post.fromJson(post)).toList();
  } else
    return null;
}



Future<List<Post>> fetchPopularPostsList() async {
  final http.Response response = await apiCaller.get(route: '/posts/popular');
  if (response.statusCode == 200) {
    var postListJson = json.decode(response.body)['message'] as List;
    return postListJson.map((post) => Post.fromJson(post)).toList();
  } else
    return null;
}

