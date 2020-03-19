import 'package:facefood/components/icon_text.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class AppbarPostDetailContent extends StatelessWidget {
  final String postname, category;
  final int timeNeeded, likeCount, commentCount, postId;

  const AppbarPostDetailContent({
    Key key,
    this.postname,
    this.postId,
    this.timeNeeded,
    this.likeCount,
    this.commentCount,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          colorBackgroundDark.withOpacity(0),
          colorBackgroundDark.withOpacity(0.75),
          colorBackgroundDark.withOpacity(1)
        ],
      )),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(),
            ), // push text to bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  postname,
                  style: textStyleHeadingDark,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(category, style: textStyleDarkBackground,),
                IconTextComponent(
                  icon: Icons.timer,
                  text: timeNeeded.toString() + '\'',
                  iconColor: colorOnDarkBackground,
                  style: textStyleDarkBackground,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
