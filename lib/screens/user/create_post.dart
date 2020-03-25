import 'package:facefood/components/buttons/button_confirm_component.dart';
import 'package:facefood/components/buttons/button_with_icon.dart';
import 'package:facefood/components/image_upload_component.dart';
import 'package:facefood/components/text_form_fields/text_from_field_rectangle_with_title.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formkey = GlobalKey<FormState>();
  final _post = Post();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(children: <Widget>[
          Form(
              key: _formkey,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      TextFormFieldRectangleWithTitle(
                        hintText: 'Post name',
                        titleText: 'Name:',
                        onSaved: (postName) {
                          setState(() {
                            _post.postName = postName;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the post name!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormFieldRectangleWithTitle(
                        hintText: 'Time in minute',
                        titleText: 'Time Needed: ',
                        inputType: TextInputType.number,
                        onSaved: (timeNeeded) {
                          setState(() {
                            _post.timeNeeded = timeNeeded;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter time needed!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormFieldRectangleWithTitle(
                        hintText: 'Category of the dish.',
                        titleText: 'Category:',
                        onSaved: (category) {
                          setState(() {
                            _post.categoryId = category;
                          });
                        },
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return 'Please enter time needed!';
                        //   }
                        //   return '';
                        // },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ImageUploadComponent('posts', _post),
                      TextFormFieldRectangleWithTitle(
                        maxLine: null,
                        hintText: 'Describe your dish...',
                        titleText: 'Description:',
                        onSaved: (description) {
                          setState(() {
                            _post.description = description;
                          });
                        },
                        validator: (description) {
                          if (description.isEmpty) {
                            return 'Please enter description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      TextFormFieldRectangleWithTitle(
                        maxLine: null,
                        hintText: 'Describe step here...',
                        titleText: 'Step 1: ',
                        onSaved: (description) {
                          setState(() {
                            _post.description = description;
                          });
                        },
                        validator: (description) {
                          if (description.isEmpty) {
                            return 'Please enter description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ImageUploadComponent('posts', _post),
                      ButtonWithIcon(
                        onPressed: () {},
                        label: 'Add new Step',
                        icon: Icon(
                          Icons.add,
                          color: colorOnDarkBackground,
                        ),
                      ),
                       Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ButtonConfirmComponent(
                        onPressed: () async {
                          final form = _formkey.currentState;
                          if (form.validate()) {
                            form.save();
                            bool success = true;
                            if (success) {
                              Navigator.pushNamed(context, '/create_post');
                            }
                          }
                        },
                        text: 'Create Post',
                      ),
                      SizedBox(
                        height: 50,
                      ), // avoid overlap with navbar
                    ],
                  )))
        ]),
      ),
    );
  }
}
