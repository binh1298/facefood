import 'package:facefood/models/ingredient.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class ListFutureIngredient extends StatelessWidget {
  final int postID;
  const ListFutureIngredient({
    Key key,
    this.postID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ingredient>>(
      future: fetchListIngredient(postID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isNotEmpty)
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
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              ingredient.ingredientName,
                              style: textStyleDefault,
                            ),
                          ),
                          Text(
                            '${ingredient.value} ${ingredient.unitName}',
                            style: textStyleDefault,
                          ),
                        ],
                      );
                    }).toList(),
                  )
                ],
              ),
            );
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
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('No ingredients available.'),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
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
