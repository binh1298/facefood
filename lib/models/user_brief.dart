import 'dart:convert';

import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;


class UserBrief {
  String username, fullname, avatarUrl;
  int likeCount, followersCount, followingCount, postCount;

  UserBrief(
    {
    this.username,
    this.fullname,
    this.avatarUrl,
    this.followersCount,
    this.followingCount,
    this.likeCount,
    this.postCount
    });
  factory UserBrief.fromJson(dynamic json){
    return UserBrief(
      username: json['username'] as String,
      fullname: json['fullname'] as String,
      avatarUrl: json['avatarUrl'] as String,
      followersCount: json['followerCount'] as int,
      followingCount: json['followingCount'] as int,
      likeCount: json['likeCount'] as int,
      postCount: json['postConnt'] as int,
    );
  }
}

Future<UserBrief> fetchUserBrief(String username) async{
  final http.Response response = await apiCaller.get(route: '/users/$username');
  if (response.statusCode == 200) {
    var userDetailsJson = json.decode(response.body)['message'];
    return UserBrief.fromJson(userDetailsJson);
  } else
    return null;
}