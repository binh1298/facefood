import 'dart:convert';

import 'package:facefood/models/post.dart';
import 'package:facefood/utils/api_caller.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:http/http.dart' as http;

class UserProfileInfo {
  String userId, username, avatarUrl, email, fullname, roleName;
  int postCount, likeCount, commentCount, followerCount, followingCount, activePostsCount;
  List<Post> totalPosts;

  UserProfileInfo(
      {this.userId,
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
      this.totalPosts,
      this.activePostsCount});

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
      activePostsCount: json['activePostsCount'] as int,
      totalPosts: List<Post>.from(json['posts'].map((x) => Post.fromJson(x))),
    );
  }
}

Future<UserProfileInfo> fetchCurrentUserProfileInfo() async {
  var currentUser = await getUserFromToken();
  String username = currentUser.username;
  final http.Response response = await apiCaller.get(route: '/users/$username');
  if (response.statusCode == 200) {
    var userDetailsJson = json.decode(response.body)['message'];
    return UserProfileInfo.fromJson(userDetailsJson);
  } else
    return null;
}

Future<UserProfileInfo> fetchOtherUserProfile(String username) async {
  final http.Response response = await apiCaller.get(route: '/users/$username');
  if (response.statusCode == 200) {
    var userDetailsJson = json.decode(response.body)['message'];
    return UserProfileInfo.fromJson(userDetailsJson);
  } else
    return null;
}

Future<bool> putUserAvatar(String username, String imageUrl) async {
  final http.Response response = await apiCaller.put(
    route: '/users/$username/avatar?$imageUrl',
  );
  print(response.body);
  return response.statusCode == 200;
}