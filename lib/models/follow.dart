import 'dart:convert';

import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;

// class LikePost {
//   int postId;
//   bool isLiked;
//   LikePost({this.postId, this.isLiked});

//   factory LikePost.fromJson(dynamic json) {
//     return LikePost(
//       isLiked: json["isLiked"] as bool,
//     );
//   }
// }

Future<bool> changeFollowingStatus(
    bool isFollowing, String username, String following) async {
  String url;
  if (isFollowing) {
    url = '/follows/unfollow';
  } else {
    url = '/follows/follow';
  }
  url += '?username=$username&following=$following';
  final http.Response response = await apiCaller.post(
    route: url,
    body: '',
    // jsonEncode(<String, String>{
    //   'username': username,
    //   'following': following,
    // }
    // ),
  );
  bool success = response.statusCode == 200;
  print('follow is success= $success');
  print(response.toString());
  return success;
}

Future<bool> checkIfFollowingUser(String username, String following) async {
  String url = '/follows/status?username=$username&following=$following';
  final http.Response response = await apiCaller.get(
    route: url,
  );
  if (response.statusCode == 200) {
    var message = json.decode(response.body)['message'];
    print('checkIfFollowingUser: ' + json.decode(response.body)['message'].toString());
    if (message.toString() == "true") {
      return true;
    } else {
      return false;
    }
  }
  return null;
}
