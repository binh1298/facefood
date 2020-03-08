import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;

class Post {
  int postId, timeNeeded, categoryId, likeCount, commentCount;
  String postName, description, userId;
  bool isDeleted;
  String createdAt, updatedAt;

  Post({this.likeCount, this.commentCount, this.categoryId, this.createdAt, this.description, this.isDeleted, this.postId, this.postName, this.timeNeeded, this.updatedAt, this.userId});
  factory Post.fromJson(dynamic json) {
    return Post(
      postId: json['postId'] as int,
      timeNeeded: json['timeNeeded'] as int,
      categoryId: json['categoryId'] as int,
      postName: json['postName'] as String,
      description: json['description'] as String,
      userId: json['description'] as String,
      isDeleted: json['isDeleted'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}

Future<Post> fetchLastestPost() async {
  // final http.Response response = await apiCaller.get();

  Post post = Post(
    categoryId: 1,
    description: 'This taste really good',
    postName: 'Fried Chicken',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 3, 
    commentCount: 2,
  );
  return post;
}