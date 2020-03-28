import 'package:facefood/components/buttons/button_confirm_component.dart';
import 'package:facefood/components/buttons/button_with_icon.dart';
import 'package:facefood/components/columns/column_image_updator.dart';
import 'package:facefood/components/text_form_fields/text_from_field_rectangle_with_title.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/models/post_step.dart';
import 'package:facefood/style/style.dart';
import 'package:facefood/utils/snack_bar.dart';
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
  void initState() {
    super.initState();
    _post.steps = List<PostStep>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAppBar,
        title: Text(
          'Create Post',
          style: textStyleHeading,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
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
                            _post.timeNeeded = int.tryParse(timeNeeded);
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter time needed!';
                          }
                          if (int.tryParse(value) == null)
                            return 'Please enter a valid time';
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
                            _post.categoryName = category;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter category name!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ColumnImageUpdator((imageUrl) {
                        setState(() {
                          _post.imageUrl = imageUrl;
                        });
                      }),
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

                      Divider(
                        color: Colors.black,
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _post.steps.length,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          _post.steps[index].stepCount = index + 1;
                          return Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              TextFormFieldRectangleWithTitle(
                                maxLine: null,
                                hintText: 'Describe step here...',
                                titleText: 'Step ${index + 1}: ',
                                onSaved: (value) {
                                  setState(() {
                                    _post.steps[index].description = value;
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
                              ColumnImageUpdator((imageUrl) {
                                setState(() {
                                  _post.steps[index].imageUrl = imageUrl;
                                });
                              }),
                            ],
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ButtonWithIcon(
                            onPressed: () {
                              PostStep postStep = PostStep();
                              setState(() {
                                _post.steps.add(postStep);
                              });
                            },
                            label: 'Add new Step',
                            icon: Icon(
                              Icons.add,
                              color: colorOnDarkBackground,
                            ),
                          ),
                          if (_post.steps.length > 0)
                            ButtonWithIcon(
                              onPressed: () {
                                setState(() {
                                  _post.steps.removeLast();
                                });
                              },
                              label: 'Remove step',
                              icon: Icon(
                                Icons.remove,
                                color: colorOnDarkBackground,
                              ),
                            ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ButtonConfirmComponent(
                        text: 'Create Post',
                        onPressed: () async {
                          final form = _formkey.currentState;
                          if (!form.validate()) return;
                          if (_post.imageUrl == null) {
                            showErrorSnackBar(context, 'Post must have images');
                            return;
                          }
                          if(_post.steps.any((step) => step.imageUrl == null)){
                            showErrorSnackBar(context, 'Post must have images');
                            return;
                          }
                          
                          form.save();

                          if (_post.steps.length <= 0) {
                            showErrorSnackBar(context, 'Post must have steps');
                            return;
                          }

                          bool success = await _post.createPost();
                          if (success) {
                            showInfoSnackBar(
                                context, 'Create Post Successfully!');
                          }
                        },
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
