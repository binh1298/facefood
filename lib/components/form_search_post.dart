import 'package:facefood/components/text_form_field_rectangle.dart';
import 'package:flutter/material.dart';

class FormSearchPost extends StatefulWidget {
  final Function changeParentState;
  const FormSearchPost({
    Key key, this.changeParentState,
  }) : super(key: key);

  @override
  _FormSearchPostState createState() => _FormSearchPostState();
}

class _FormSearchPostState extends State<FormSearchPost> {
  String _txtSearch;
  int _type = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormFieldRectangle(
                      hintText: 'Search anything',
                      onChanged: (value) {
                        setState(() {
                          _txtSearch = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      widget.changeParentState(_txtSearch, _type);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: Radio(
                      value: 0,
                      groupValue: _type,
                      onChanged: (int value) {
                        setState(() {
                          _type = value;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: Radio(
                      value: 1,
                      groupValue: _type,
                      onChanged: (int value) {
                        setState(() {
                          _type = value;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: Radio(
                      value: 2,
                      groupValue: _type,
                      onChanged: (int value) {
                        setState(() {
                          _type = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // make sure these have same length
                  Text('  Recipe  '),
                  Text(' Category '),
                  Text('Ingredient'),
                ],
              ),
              Divider(
                indent: 50,
                endIndent: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
