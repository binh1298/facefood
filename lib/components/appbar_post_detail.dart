import 'package:facefood/components/appbar_post_detail_content.dart';
import 'package:flutter/material.dart';

class AppbarPostDetail extends StatelessWidget {
  final String postname, imageUrl, category;
  final int timeNeeded, likeCount, commentCount;
  const AppbarPostDetail({
    Key key,
    this.postname,
    this.imageUrl,
    this.timeNeeded,
    this.likeCount,
    this.commentCount,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      snap: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30), // set min height
        child: Text(''),
      ),
      backgroundColor: Colors.grey,
      expandedHeight: 400,
      flexibleSpace: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              child: FittedBox(
                child: Image.network(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            AppbarPostDetailContent(
              category: category,
              commentCount: commentCount,
              likeCount: likeCount,
              postname: postname,
              timeNeeded: timeNeeded,
            ),
          ],
        ),
      ),
    );
  }
}
