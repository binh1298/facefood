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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 15,
              offset: Offset(3, 3),
              color: Colors.black.withOpacity(0.7)),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
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
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  color: Colors.white,
                  child: Column(children: <Widget>[
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('Step ${(step + 1).toString()}', style: textStyleTitle,),
                        SizedBox(width: 20,),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(description, style: textStyleDefault, overflow: TextOverflow.fade,),
                    ),
                  ],)
                  ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
