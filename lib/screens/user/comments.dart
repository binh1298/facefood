import 'package:facefood/components/card_comment.dart';
import 'package:facefood/models/comment.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  final int postID;

  CommentsScreen({Key key, this.postID = 1}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 100, left: 10, right: 10,),
            child: Text(
              'Comments',
              style: textStyleHeading,
            ),
          ),
          FutureBuilder(
            future: fetchComment(widget.postID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView(
                      children: snapshot.data
                          .map<Widget>((comment) => CardComment(
                                imgUrl: comment.imgUrl,
                                content: comment.content,
                                username: comment.username,
                              ))
                          .toList()),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Text('Unable to fetch this post');
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
          //TODO Duc comment here

          //TODO Duc comment end here
        ],
      ),
    );
  }
}
