import 'dart:convert';
import 'package:facefood/models/post.dart';
import 'package:facefood/utils/api_caller.dart';
import 'package:facefood/utils/api_routes.dart';
import 'package:http/http.dart' as http;

class UserProfileInfo {
  String userId, username, avatarUrl, email, fullname, roleName;
  int postCount, likeCount, commentCount, followerCount, followingCount;
  List<Post> totalPosts;

  UserProfileInfo({
    this.userId,
    this.username,
    this.avatarUrl,
    this.email,
    this.fullname,
    this.roleName,
    this.postCount,
    this.likeCount,
    this.commentCount,
    this.followerCount,
    this.followingCount,
    this.totalPosts
  });

  factory UserProfileInfo.fromJson(dynamic json) {
    return UserProfileInfo(
      userId: json['userId'] as String,
      username: json['username'] as String,
      avatarUrl: json['avatarUrl'] as String,
      email: json['email'] as String,
      fullname: json['fullname'] as String,
      roleName: json['roleName'] as String,
      postCount: json['postCount'] as int,
      commentCount: json['commentCount'] as int,
      followerCount: json['followerCount'] as int,
      followingCount: json['followingCount'] as int,
      totalPosts: json['totalPosts']['rows'] as List<Post>,
    );
  }
}

Future<UserProfileInfo> fetchuserProfileInfo(String username) async {
  print('hey im here');
  final http.Response response = await apiCaller.get(route: '/users/$username');
  if (response.statusCode == 200) {
    var userDetailsJson = json.decode(response.body)['message'];
    return UserProfileInfo.fromJson(userDetailsJson);
  } else
    return null;
}