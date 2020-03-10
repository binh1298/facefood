import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class AppbarPostDetailContent extends StatelessWidget {
  final String postname, category;
  final int timeNeeded, likeCount, commentCount;

  const AppbarPostDetailContent({
    Key key,
    this.postname,
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
            Text(
              postname,
              textAlign: TextAlign.left,
              style: textStyleHeadingDark,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  category,
                  textAlign: TextAlign.right,
                  style: textStyleDefaultPrimary,
                ),
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '$timeNeeded\' ',
                      style: textStyleDefault.copyWith(
                          color: colorTextDarkBackground),
                    ),
                    WidgetSpan(
                        child: GestureDetector(
                          onTap: (){print('hahaha');},    // button like
                      child: Icon(
                        Icons.timer,
                        size: textStyleDefault.fontSize,
                        color: colorTextDarkBackground,
                      ),
                    )),
                    TextSpan(
                      text: '     $likeCount ',
                      style: textStyleDefault.copyWith(
                          color: colorTextDarkBackground),
                    ),
                    WidgetSpan(
                        child: Icon(
                      Icons.favorite,
                      size: textStyleDefault.fontSize,
                      color: colorTextDarkBackground,
                    )),
                    TextSpan(
                      text: '    $commentCount ',
                      style: textStyleDefault.copyWith(
                          color: colorTextDarkBackground),
                    ),
                    WidgetSpan(
                        child: Icon(
                      Icons.insert_comment,
                      size: textStyleDefault.fontSize,
                      color: colorTextDarkBackground,
                    )),
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
