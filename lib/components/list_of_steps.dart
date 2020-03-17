import 'package:facefood/components/card_step_post_detail.dart';
import 'package:facefood/models/post_step.dart';
import 'package:flutter/material.dart';

class ListOfSteps extends StatelessWidget {
  final List<PostStep> listSteps;
  const ListOfSteps({
    Key key,
    this.listSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(bottom: 5),
            height: MediaQuery.of(context).size.width * 1.2,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: listSteps.map((step) {
                  var index = listSteps.indexOf(step);
                  return CardStepPostDetail(
                      urlImage: step.imageUrl,
                      step: index,
                      description: step.description);
                }).toList()),
          );
  }
}
