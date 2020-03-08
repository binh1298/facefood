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
    imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.foodnetwork.com%2Frecipes%2Ffried-chicken-recipe10-3381583&psig=AOvVaw11l_eII5xyEzrCy8EVmYzj&ust=1583784721067000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIDktv_Xi-gCFQAAAAAdAAAAABAD',
  );
  Post post2 = Post(
    categoryId: 1,
    description: 'This taste really good',
    postName: 'Fried Chicken',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 3, 
    commentCount: 2,
    imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.foodnetwork.com%2Frecipes%2Ffried-chicken-recipe10-3381583&psig=AOvVaw11l_eII5xyEzrCy8EVmYzj&ust=1583784721067000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIDktv_Xi-gCFQAAAAAdAAAAABAD',
  );
  Post post3 = Post(
    categoryId: 1,
    description: 'This taste really good',
    postName: 'Fried Chicken',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 3, 
    commentCount: 2,
    imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.foodnetwork.com%2Frecipes%2Ffried-chicken-recipe10-3381583&psig=AOvVaw11l_eII5xyEzrCy8EVmYzj&ust=1583784721067000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIDktv_Xi-gCFQAAAAAdAAAAABAD',
  );

  List<Post> list = List();
  list.add(post1);
  list.add(post2);
  list.add(post3);
  return list;
}
