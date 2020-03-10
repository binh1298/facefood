import 'package:facefood/components/button_confirm_component.dart';
import 'package:facefood/components/image_upload_component.dart';
import 'package:facefood/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facefood/components/text_form_field_register.dart';

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
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormFieldComponent(
                        hintText: 'Post name',
                        labelText: 'Name',
                        title: 'Name:              ',
                        onSaved: (postName) {
                          setState(() {
                            _post.postName = postName;
                          });
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the post name!';
                          }
                          return '';
                        },
                      ),
                      TextFormFieldComponent(
                        hintText: 'Estimated time to finsh making the dish.',
                        labelText: 'Time needed',
                        title: 'Time Needed: ',
                        onSaved: (timeNeeded) {
                          setState(() {
                            _post.timeNeeded = timeNeeded;
                          });
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter time needed!';
                          }
                          return '';
                        },
                      ),
                      TextFormFieldComponent(
                        hintText: 'Category of the dish.',
                        labelText: 'Category',
                        title: 'Category:         ',
                        onSaved: (category) {
                          setState(() {
                            _post.categoryId = category;
                          });
                        },
                        maxLines: 1,
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return 'Please enter time needed!';
                        //   }
                        //   return '';
                        // },
                      ),
                      ImageUploadComponent('posts',_post),
                      TextFormFieldComponent(
                        hintText: 'A short introduction of the dish',
                        labelText: 'Description',
                        title: 'Description:     ',
                        onSaved: (description) {
                          setState(() {
                            _post.description = description;
                          });
                        },
                        validator: (description) {
                          if (description.isEmpty) {
                            return 'Please enter description';
                          }
                          return '';
                        },
                        textInputType: TextInputType.multiline,
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
                        text: 'Create a Post',
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}
