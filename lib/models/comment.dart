import 'package:flutter/material.dart';

class Comment{
  final String username, userID, content, imgUrl;

  Comment({this.imgUrl, this.username, this.userID, this.content});

  factory Comment.fromJson(dynamic json){
    var comment = Comment(
      username: json['description'] as String,
      userID: json('unitName') as String,
      content: json('value') as String,
      imgUrl: json['imgUrl'] as String,
    );
    return comment;
  }
}

Future<List<Comment>> fetchComment(int postID) async{

  Comment cmt1 = Comment(
    content: 'this is a comment this is a this is a comment this is a',
    username: 'User1',
    userID: '1',
    imgUrl: 'https://i.picsum.photos/id/919/536/354.jpg',
  );
  Comment cmt2 = Comment(
    content: 'this is a comment',
    username: 'User1',
    userID: '1',
    imgUrl: 'https://i.picsum.photos/id/919/536/354.jpg',

  );
  Comment cmt3 = Comment(
    content: 'this is a comment',
    username: 'User1',
    userID: '1',
    imgUrl: 'https://i.picsum.photos/id/919/536/354.jpg',

  );
  Comment cmt4 = Comment(
    content: 'this is a comment',
    username: 'User1',
    userID: '1',
    imgUrl: 'https://i.picsum.photos/id/919/536/354.jpg',

  );
  Comment cmt5 = Comment(
    content: 'this is a comment',
    username: 'User1',
    userID: '1',
    imgUrl: 'https://i.picsum.photos/id/919/536/354.jpg',

  );
  List<Comment> result = List();
  result.add(cmt1);
  result.add(cmt2);
  result.add(cmt3);
  result.add(cmt4);
  result.add(cmt5);
  return result;
}