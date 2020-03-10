import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class CardStepPostDetail extends StatelessWidget {
  const CardStepPostDetail({
    Key key,
    @required this.urlImage,
    @required this.step,
    @required this.description,
  }) : super(key: key);

  final String urlImage;
  final int step;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationDefault,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.width * 0.6,
            child: FittedBox(
              child: Image.network(urlImage),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              color: colorBackground,
              padding: EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Step $step',
                      style: textStyleSubtitleBold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    style: textStyleDefault,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
