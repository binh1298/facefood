import 'package:facefood/components/card_step_post_detail.dart';
import 'package:facefood/models/post_step.dart';
import 'package:flutter/material.dart';

class ListCardViewStep extends StatelessWidget {
  final List<PostStep> steps;
  const ListCardViewStep({
    Key key,
    this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      height: MediaQuery.of(context).size.width * 1.2,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: steps.map<Widget>((step)  {
          var index = steps.indexOf(step);
          return CardStepPostDetail(urlImage: step.imgUrl, step: index, description: step.description);
        } 
        ).toList()
      ),
    );
  }
}

