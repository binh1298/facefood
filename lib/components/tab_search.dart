import 'package:facefood/components/card_post_detail_half_size.dart';
import 'package:facefood/components/form_search_post.dart';
import 'package:facefood/models/post.dart';
import 'package:flutter/material.dart';

class TabSearch extends StatefulWidget {
  TabSearch({Key key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {

  Future<List<Post>> listData;
  String search;
  int type;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FormSearchPost(), //TODO change search + type state here;
        FutureBuilder<List<Post>>(
          future: fetchPromotionList(), // for demo only
          //future: fetchSearchList(search, type), //TODO fetch real api here
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isNotEmpty) {
                return Wrap(
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
                );
              } else
                return Center(
                  child: Text('No recipe found.'),
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
        SizedBox(height: 30,),  // safe spacing
      ],
    );
  }
}
