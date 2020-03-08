import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: false,
          pinned: true,
          snap: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30), // set min height
            child: Text(''),
          ),
          backgroundColor: Colors.grey,
          expandedHeight: 400,
          flexibleSpace: PostHeader(),
        ),
        SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          UserCard(),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          DescriptionCard(
            description:
                'Salmon coupled with warm creamed spinach and mushrooms make the dish quite filling—perfect for a winter dinner!',
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          IngredientTable(),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          ListViewStep(),
          SizedBox(
            height: 20,
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
        ]))
      ],
    ));
  }
}

class DescriptionCard extends StatelessWidget {
  final String description;
  const DescriptionCard({
    Key key,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        '"$description"',
        style: textStyleQuotation,
      ),
    );
  }
}

class TestList extends StatelessWidget {
  const TestList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0), // remove top space
      children: <Widget>[
        PostHeader(),
        UserCard(),
        Divider(
          indent: 20,
          endIndent: 20,
        ),
        IngredientTable(),
        Divider(
          indent: 20,
          endIndent: 20,
        ),
        ListViewStep(),
        Divider(
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}

class ListViewStep extends StatelessWidget {
  const ListViewStep({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Step by step',
              style: textStyleHeadingPrimary,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            height: MediaQuery.of(context).size.width * 1.2,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ListViewStepCard(
                  description:
                      'Season salmon filets generously with salt and pepper. Quarter mushrooms. Roughly chop parsley and chives. Finely slice garlic. Halve lemon, juice one half in a small bowl, and quarter the other half into wedges.',
                  urlImage:
                      'https://images.kitchenstories.io/wagtailOriginalImages/R1960-photo-step-001/R1960-photo-step-001-large-landscape-150.jpg',
                  step: 1,
                ),
                ListViewStepCard(
                  description:
                      'Heat vegetable oil in a large frying pan over medium heat. When the oil is hot, add salmon to the pan, skin-side down, and let cook for approx. 3 min., or until crispy.',
                  urlImage:
                      'https://images.kitchenstories.io/wagtailOriginalImages/R1960-photo-step-002/R1960-photo-step-002-large-landscape-150.jpg',
                  step: 2,
                ),
                ListViewStepCard(
                  description:
                      'Add mixed mushrooms and sliced garlic to the same pan, and cook until mushrooms are nicely browned. Add flour and let cook for approx. 1 min longer, or until flour is browned.',
                  urlImage:
                      'https://images.kitchenstories.io/wagtailOriginalImages/R1960-photo-step-003/R1960-photo-step-003-large-landscape-150.jpg',
                  step: 3,
                ),
                ListViewStepCard(
                  description:
                      'Add milk to the pan and stir until it thickens into a creamy sauce. Season with salt, pepper, and freshly grated nutmeg. Add spinach in batches. ',
                  urlImage:
                      'https://images.kitchenstories.io/wagtailOriginalImages/R1960-photo-step-004/R1960-photo-step-004-large-landscape-150.jpg',
                  step: 4,
                ),
                ListViewStepCard(
                  description:
                      'Serve salmon filets on a bed of warm creamed spinach and mushrooms, and a lemon wedge. Sprinkle with chopped chives. Enjoy!',
                  urlImage:
                      'https://images.kitchenstories.io/wagtailOriginalImages/R1960-photo-step-005/R1960-photo-step-005-large-landscape-150.jpg',
                  step: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewStepCard extends StatelessWidget {
  final String urlImage;
  final String description;
  final int step;
  const ListViewStepCard({
    Key key,
    this.urlImage,
    this.description,
    this.step,
  }) : super(key: key);

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

class IngredientTable extends StatelessWidget {
  const IngredientTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          IngredientTableItem(
            amount: '500 g',
            ingredient: 'salmon fillets (skin-on)',
          ),
          IngredientTableItem(
            amount: '300 g',
            ingredient: 'baby spinach',
          ),
          IngredientTableItem(
            amount: '350 g',
            ingredient: 'mixed mushrooms',
          ),
          IngredientTableItem(
            amount: '1',
            ingredient: 'lemon',
          ),
          IngredientTableItem(
            amount: '1 clove',
            ingredient: 'Garlic',
          ),
          IngredientTableItem(
            amount: '',
            ingredient: 'salt',
          ),
          IngredientTableItem(
            amount: '',
            ingredient: 'peper',
          ),
          IngredientTableItem(
            amount: '',
            ingredient: 'parsley',
          ),
        ],
      ),
    );
  }
}

class IngredientTableItem extends StatelessWidget {
  final String ingredient;
  final String amount;
  const IngredientTableItem({
    Key key,
    this.ingredient,
    this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width / 3.5,
            child: Text(
              amount,
              style: textStyleDefault,
            ),
          ),
          Text(
            ingredient,
            style: textStyleDefault,
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.width / 6,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/9/90/Keanu_Reeves_%28crop_and_levels%29_%28cropped%29.jpg'),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Reanu Keeves',
                style: textStyleTitle,
              ),
              Text(
                '@JohnWreck',
                style: textStyleSubtitle,
              ),
            ],
          ),
          Divider(
            indent: 5,
            color: textStyleDefault.color,
          ),
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 600,
            child: FittedBox(
              child: Image.network(
                  'https://images.kitchenstories.io/wagtailOriginalImages/R1960-photo-final-002/R1960-photo-final-002-medium-landscape-150.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          TitleAppBar(),
        ],
      ),
    );
  }
}

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key key,
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
              'Grilled Lemony Salmon',
              textAlign: TextAlign.left,
              style: textStyleHeadingDark,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Main Dish',
                  textAlign: TextAlign.right,
                  style: textStyleDefaultPrimary,
                ),
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '40\' ',
                      style: textStyleDefaultDark,
                    ),
                    WidgetSpan(
                        child: Icon(
                      Icons.timer,
                      size: textStyleDefaultDark.fontSize,
                      color: textStyleDefaultDark.color,
                    )),
                    TextSpan(
                      text: '     32 ',
                      style: textStyleDefaultDark,
                    ),
                    WidgetSpan(
                        child: Icon(
                      Icons.favorite,
                      size: textStyleDefaultDark.fontSize,
                      color: textStyleDefaultDark.color,
                    )),
                    TextSpan(
                      text: '    14 ',
                      style: textStyleDefaultDark,
                    ),
                    WidgetSpan(
                        child: Icon(
                      Icons.insert_comment,
                      size: textStyleDefaultDark.fontSize,
                      color: textStyleDefaultDark.color,
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
