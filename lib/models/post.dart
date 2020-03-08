import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;

class Post {
  int postId, timeNeeded, categoryId, likeCount, commentCount;
  String postName, description, imageUrl, userId;
  bool isDeleted;
  String createdAt, updatedAt;

  Post(
      {this.likeCount,
      this.commentCount,
      this.categoryId,
      this.createdAt,
      this.description,
      this.isDeleted,
      this.postId,
      this.postName,
      this.timeNeeded,
      this.updatedAt,
      this.userId,
      this.imageUrl});
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
    imageUrl: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/11/2/0/DV1510H_fried-chicken-recipe-10_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568222255998.jpeg',
  );
  return post;
}

Future<List<Post>> fetchPopularPostsList() async {
  Post post1 = Post(
    categoryId: 1,
    description: 'This taste really good',
    postName: 'Fried Chicken',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 3,
    commentCount: 2,
    imageUrl: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/11/2/0/DV1510H_fried-chicken-recipe-10_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568222255998.jpeg',
  );
  Post post2 = Post(
    categoryId: 1,
    description: 'This taste really good',
    postName: 'Fried Chicken',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 3, 
    commentCount: 2,
    imageUrl: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/11/2/0/DV1510H_fried-chicken-recipe-10_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568222255998.jpeg',
  );
  Post post3 = Post(
    categoryId: 1,
    description: 'This taste really good',
    postName: 'Fried Chicken',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 3, 
    commentCount: 2,
    imageUrl: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/11/2/0/DV1510H_fried-chicken-recipe-10_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568222255998.jpeg',
  );

  List<Post> list = List();
  list.add(post1);
  list.add(post2);
  list.add(post3);
  return list;
}
