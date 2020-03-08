import 'package:facefood/components/detail_item_horizontal.dart';
import 'package:facefood/models/post.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          FutureBuilder<Post>(
            future: fetchLastestPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DetailItemHoriziontal(
                  category: snapshot.data.categoryId.toString(),
                  name: snapshot.data.postName,
                  likeCount: snapshot.data.likeCount,
                  timeNeeded: snapshot.data.timeNeeded,
                  commentCount: snapshot.data.commentCount,
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error);
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Text('Unable to fetch lastest post');
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          )
          // RowPosts(),
        ],
      ),
    );
  }
}
