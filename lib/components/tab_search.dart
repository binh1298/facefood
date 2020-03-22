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
  String _search = '';
  int _type = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FormSearchPost(
          changeParentState: (String changeSearch, int changeType) {
            setState(() {
              _search = changeSearch;
              _type = changeType;
            });
          },
        ),
        FutureBuilder<List<Post>>(
          future: fetchSearchList(_search, _type),
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
              if (_search == '') {
                return Center(
                  child: Text('Find your favorite recipe!'),
                );
              }
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text('Unable to fetch lastest post');
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
        SizedBox(
          height: 30,
        ), // safe spacing
      ],
    );
  }
}
