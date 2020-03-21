import 'package:facefood/components/card_post_detail_half_size.dart';
import 'package:facefood/components/card_post_fullwidth.dart';
import 'package:facefood/components/text_safe.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class TabExplore extends StatelessWidget {
  const TabExplore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextSafeComponent(
            text: 'Recommended for You',
            style: textStyleTitle,
          ),
        ),
        FutureBuilder<Post>(
          future: fetchLastestPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CardPostFullWidth(
                id: snapshot.data.id,
                categoryName: snapshot.data.categoryName,
                postName: snapshot.data.postName,
                likeCount: snapshot.data.likeCount,
                timeNeeded: snapshot.data.timeNeeded,
                commentCount: snapshot.data.commentCount,
                imageUrl: snapshot.data.imageUrl,
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text('Unable to fetch lastest post');
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextSafeComponent(
            text: 'Promotion: 20% Off This Week!',
            style: textStyleTitle,
          ),
        ),
        FutureBuilder<List<Post>>(
          future: fetchPromotionList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: snapshot.data
                      .map(
                        (post) => CardPostDetailsHalfSize(
                          postId: post.id,
                          category: post.categoryName,
                          name: post.postName,
                          likeCount: post.likeCount,
                          timeNeeded: post.timeNeeded,
                          commentCount: post.commentCount,
                          imageUrl: post.imageUrl,
                        ),
                      )
                      .toList(),
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text('Unable to fetch lastest post');
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextSafeComponent(
            text: 'Popular',
            style: textStyleTitle,
          ),
        ),
        FutureBuilder<List<Post>>(
          future: fetchPopularPostsList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: snapshot.data
                      .map(
                        (post) => CardPostDetailsHalfSize(
                          postId: post.id,
                          category: post.categoryId.toString(),
                          name: post.postName,
                          likeCount: post.likeCount,
                          timeNeeded: post.timeNeeded,
                          commentCount: post.commentCount,
                          imageUrl: post.imageUrl,
                        ),
                      )
                      .toList(),
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text('Unable to fetch lastest post');
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
        SizedBox(height: 30,), // safe spacing
      ],
    );
  }
}
