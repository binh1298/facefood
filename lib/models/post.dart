import 'dart:convert';

import 'package:facefood/models/ingredient.dart';
import 'package:facefood/models/post_step.dart';
import 'package:facefood/models/user_details.dart';
import 'package:facefood/utils/api_caller.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:http/http.dart' as http;

class Post {
  int id, timeNeeded, likeCount, commentCount, categoryId;
  String postName, description, imageUrl, username, categoryName;
  bool isDeleted;
  String createdAt, updatedAt;
  int stepCount;
  List<PostStep> steps;
  List<Ingredient> ingredients;
  Post({
    this.likeCount,
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
    this.steps,
  });
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

  Future<bool> createPost() async {
    UserDetails user = await getUserFromToken();

    List stepsString = steps.map((step) {
      return step.toJson();
    }).toList();
    final http.Response response = await apiCaller.post(
      route: '/posts',
      body: jsonEncode(
        <String, dynamic>{
          'postName': postName,
          'description': description,
          'categoryName': categoryName,
          'timeNeeded': timeNeeded,
          'imageUrl': imageUrl,
          'steps': jsonEncode(stepsString),
          'userId': user.userId,
        },
      ),
    );
    print(response.body);
    return response.statusCode == 201;
  }
}

Future<Post> fetchLastestPost() async {
  // final http.Response response = await apiCaller.get();
  final http.Response response =
      await apiCaller.get(route: '/posts?order=created_at,desc');
  if (response.statusCode == 200) {
    var userDetailsJson =
        json.decode(response.body)['message'][0]; // get a list then first item
    return Post.fromJson(userDetailsJson);
  } else
    return null;
}

Future<List<Post>> fetchPromotionList() async {
  // fetch from explore route
  final http.Response response = await apiCaller.get(route: '/posts/explore');
  if (response.statusCode == 200) {
    var postListJson = json.decode(response.body)['message'] as List;
    return postListJson.map((post) => Post.fromJson(post)).toList();
  } else
    return null;
}

Future<List<Post>> fetchSearchList(String txtSearch, int type) async {
  // fetch from explore route
  final List typeString = ['name', 'category', 'ingredient'];
  String txtType = typeString[type];
  final http.Response response = await apiCaller.get(
      route: '/posts/search?type=$txtType&query=$txtSearch');
  if (response.statusCode == 200) {
    var postListJson = json.decode(response.body)['message'] as List;
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
