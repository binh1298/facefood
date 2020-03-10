import 'package:facefood/models/ingredient.dart';
import 'package:facefood/screens/user/post_detail.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class IngredientTable extends StatelessWidget {
  final String postID;
  const IngredientTable({
    Key key,
    this.postID = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchListIngredient(postID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data[0]);
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ingredients',
                  style: textStyleHeadingPrimary,
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: snapshot.data.map<Widget>((ingredient) {
                    return Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width / 3.5,
                          child: Text(
                            ingredient.ingredientName,
                            style: textStyleDefault,
                          ),
                        ),
                        Text( 
                          ingredient.value.toString() +
                              ' ' +
                              ingredient.unitName,
                          style: textStyleDefault,
                        ),
                      ],
                    );
                  }).toList(),
                )
              ],
            ),
          );
        } else if (snapshot.error) {
          return Text(snapshot.error.toString());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
