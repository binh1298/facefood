import 'package:facefood/components/card_comment.dart';
import 'package:facefood/components/form_comment.dart';
import 'package:facefood/models/comment.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class ListFutureComments extends StatefulWidget {
  final int postID;

  ListFutureComments({Key key, this.postID = 1}) : super(key: key);

  @override
  _ListFutureCommentsState createState() => _ListFutureCommentsState();
}

class _ListFutureCommentsState extends State<ListFutureComments> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Comments',
            style: textStyleHeadingPrimary,
          ),
        ),
        FormComment(),
        FutureBuilder<List<Comment>>(
          future: fetchComment(widget.postID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isNotEmpty)
                return Column(
                    children: snapshot.data
                        .map<Widget>((comment) => CardComment(
                              imgUrl: comment.imgUrl,
                              content: comment.content,
                              username: comment.username,
                            ))
                        .toList());
              else
                return Center(child: Text('no comment yet.'));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text('Unable to fetch this post\'s comment');
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ],
    );
  }
}
