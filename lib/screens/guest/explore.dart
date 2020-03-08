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
                  imageUrl: snapshot.data.imageUrl,
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
          ),


          FutureBuilder<List<Post>>(
            future: fetchPopularPostsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: snapshot.data.map(
                      (post) => DetailItemHoriziontal(
                        category: post.categoryId.toString(),
                        name: post.postName,
                        likeCount: post.likeCount,
                        timeNeeded: post.timeNeeded,
                        commentCount: post.commentCount,
                        imageUrl: post.imageUrl,
                      ),
                    ).toList(),
                  ),
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
          ),
        ],
      ),
    );
  }
}
