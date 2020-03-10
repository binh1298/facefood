import 'package:facefood/components/card_step_post_detail.dart';
import 'package:facefood/models/post_step.dart';
import 'package:flutter/material.dart';

class ListFutureSteps extends StatelessWidget {
  final int postID;
  const ListFutureSteps({
    Key key,
    this.postID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostStep>>(
      future: fetchListPostStep(postID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.only(bottom: 5),
            height: MediaQuery.of(context).size.width * 1.2,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: snapshot.data.map<Widget>((step) {
                  var index = snapshot.data.indexOf(step);
                  return CardStepPostDetail(
                      urlImage: step.imgUrl,
                      step: index,
                      description: step.description);
                }).toList()),
          );
        }
        if (snapshot.error) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Text('unable to fetch steps');
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}
