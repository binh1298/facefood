import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;


class UserRelatedInfos {
  String username, fullname, imgUrl;
  int likeCount, totalFollowers, totalFollowings;

  UserRelatedInfos(
    {
    this.username,
    this.fullname,
    this.imgUrl,
    this.totalFollowers,
    this.totalFollowings,
    this.likeCount,
    });
  factory UserRelatedInfos.fromJson(dynamic json){
    return UserRelatedInfos(
      username: json['username'] as String,
      fullname: json['fullname'] as String,
      imgUrl: json['imgUrl'] as String,
      totalFollowers: json['totalFollowers'] as int,
      totalFollowings: json['totalFollowings'] as int,
      likeCount: json['likeCount'] as int,
    );
  }
}

Future<UserRelatedInfos> fetchUserRelatedInfos(String userId) async{
  UserRelatedInfos result = UserRelatedInfos(
    fullname: 'Reanu Keeves',
    username: 'ReanuKeeves',
    imgUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Keanu_Reeves_%28crop_and_levels%29_%28cropped%29.jpg/220px-Keanu_Reeves_%28crop_and_levels%29_%28cropped%29.jpg',
    likeCount: 10,
    totalFollowers: 11,
    totalFollowings: 12,
  );
  return result;
}