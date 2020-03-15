import 'dart:convert';

import 'package:facefood/utils/api_caller.dart';
import 'package:http/http.dart' as http;

class Post {
  int id, timeNeeded, likeCount, commentCount, categoryId;
  String postName, description, imageUrl, username, categoryName;
  bool isDeleted;
  String createdAt, updatedAt;

  Post(
      {this.likeCount,
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
      this.imageUrl});
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
    );
  }
}

Future<Post> fetchLastestPost() async {
  // final http.Response response = await apiCaller.get();

  Post post = Post(
    categoryName: 'lulul',
    description: 'This taste really good',
    postName: 'Hủ Tiếu Nam Vang',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 10,
    commentCount: 25,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F76%2FH%25E1%25BB%25A7_ti%25E1%25BA%25BFu_th%25E1%25BA%25ADp_c%25E1%25BA%25A9m.jpg%2F1200px-H%25E1%25BB%25A7_ti%25E1%25BA%25BFu_th%25E1%25BA%25ADp_c%25E1%25BA%25A9m.jpg&f=1&nofb=1',
  );
  return post;
}

Future<List<Post>> fetchPromotionList() async {
  // fetch from explore route
  final http.Response response = await apiCaller.get(route: '/posts/explore');
  print(response.body);
  if (response.statusCode == 200) {
    var postListJson = json.decode(response.body)['message'] as List;
    print('list below');
    print(postListJson.toString());
    return postListJson
        .map((post) => Post.fromJson(post))
        .toList();
  } else
    return null;
}

Future<List<Post>> fetchPostListFromAUser() async {
  Post post1 = Post(
    categoryName: 'mlem',
    description: 'This taste really good',
    postName: 'Bánh Mì',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 5,
    commentCount: 7,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fassets.epicurious.com%2Fphotos%2F562e49d300392e9c31da8947%2F2%3A1%2Fw_1260%252Ch_630%2FEP_10212015_BanhMi-4.jpg&f=1&nofb=1',
  );
  Post post2 = Post(
    categoryName: 'mlem',
    description: 'This taste really good',
    postName: 'Fried Chicken',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 2,
    commentCount: 5,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F4.bp.blogspot.com%2F-weCr72uU__4%2FUDx4HtgMkYI%2FAAAAAAAAAls%2FUr8rBMPTjFY%2Fs1600%2Fpho-vietnam.jpg&f=1&nofb=1',
  );
  Post post3 = Post(
    categoryName: 'mlem',
    description: 'This taste really good',
    postName: 'Fried Chicken',
    timeNeeded: 25,
    isDeleted: false,
    likeCount: 6,
    commentCount: 9,
    imageUrl:
        'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/11/2/0/DV1510H_fried-chicken-recipe-10_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568222255998.jpeg',
  );

  List<Post> list = List();
  list.add(post1);
  list.add(post2);
  list.add(post3);
  return list;
}

Future<List<Post>> fetchPopularPostsList() async {
  Post post1 = Post(
    categoryName: 'mlem',
    description: 'This taste really good',
    postName: 'Bánh Mì',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 20,
    commentCount: 68,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F2.bp.blogspot.com%2F_fogL-F6jDxo%2FS-hrZYJixBI%2FAAAAAAAABoQ%2FH2y1p4in8lk%2Fs1600%2Fsteak.jpg&f=1&nofb=1',
  );
  Post post2 = Post(
    categoryName: 'mlem',
    description: 'This taste really good',
    postName: 'Fried Chicken',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 77,
    commentCount: 80,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F2.bp.blogspot.com%2F-VKjbK6ceUAs%2FTcsHVWRjFnI%2FAAAAAAAAAAs%2FdwLA8WpWhJM%2Fs1600%2Fmoqueca.jpg&f=1&nofb=1',
  );
  Post post3 = Post(
    categoryName: 'mlem',
    description: 'This taste really good',
    postName: 'Fried Chicken',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 70,
    commentCount: 90,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FQztyrlFSPL8%2Fmaxresdefault.jpg&f=1&nofb=1',
  );

  List<Post> list = List();
  list.add(post1);
  list.add(post2);
  list.add(post3);
  return list;
}

Future<Post> fetchAPost(int postID) async {
  // final http.Response response = await apiCaller.get();

  Post post = Post(
    categoryName: 'mlem',
    description: 'This taste really good',
    postName: 'Hủ Tiếu Nam Vang',
    timeNeeded: 30,
    isDeleted: false,
    likeCount: 10,
    commentCount: 25,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F76%2FH%25E1%25BB%25A7_ti%25E1%25BA%25BFu_th%25E1%25BA%25ADp_c%25E1%25BA%25A9m.jpg%2F1200px-H%25E1%25BB%25A7_ti%25E1%25BA%25BFu_th%25E1%25BA%25ADp_c%25E1%25BA%25A9m.jpg&f=1&nofb=1',
  );
  return post;
}
