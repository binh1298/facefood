import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;


class UserRelatedInfos {
  String username;
  int likeCount, totalFollowers, totalFollowings;

  UserRelatedInfos(
    {
    this.username,
    this.totalFollowers,
    this.totalFollowings,
    this.likeCount,
    });
  factory UserRelatedInfos.fromJson(dynamic json){
    return UserRelatedInfos(
      username: json['username'] as String,
      totalFollowers: json['totalFollowers'] as int,
      totalFollowings: json['totalFollowings'] as int,
      likeCount: json['likeCount'] as int,
    );
  }
}

Future<UserRelatedInfos> fetchUserRelatedInfos(String userId) async{
  UserRelatedInfos result = UserRelatedInfos(
    username: 'ReanuKeeves',
    likeCount: 10,
    totalFollowers: 11,
    totalFollowings: 12,
  );
  return result;
}