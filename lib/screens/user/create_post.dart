import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:facefood/components/buttons/button_confirm_component.dart';
import 'package:facefood/components/buttons/button_with_icon.dart';
import 'package:facefood/components/columns/column_image_updator.dart';
import 'package:facefood/components/rows/row_ingredient_form_field.dart';
import 'package:facefood/components/text_form_fields/text_from_field_rectangle_with_title.dart';
import 'package:facefood/components/text_safe.dart';
import 'package:facefood/models/category.dart';
import 'package:facefood/models/ingredient.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/models/post_step.dart';
import 'package:facefood/models/unit.dart';
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
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> autoCompleteFieldKey =
      GlobalKey();
  @override
  void initState() {
    super.initState();
    _post.steps = List<PostStep>();
    _post.ingredients = List<Ingredient>();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      TextSafeComponent(
                        text: 'Basic Info',
                        style: textStyleHeading,
                      ),
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

                      FutureBuilder<List<Category>>(
                        future: fetchCategoryList(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return TextFormFieldRectangleWithTitle(
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
                            );
                          return Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 3.5,
                                child: Text(
                                  'Category:',
                                  style: textStyleDefaultPrimary,
                                ),
                              ),
                              Expanded(
                                child: SimpleAutoCompleteTextField(
                                  key: autoCompleteFieldKey,
                                  decoration: inputDecorationTextFormField(
                                      'Category of the dish'),
                                  controller: TextEditingController(
                                      text: _post.categoryName),
                                  suggestions: snapshot.data
                                      .map((category) => category.categoryName)
                                      .toList(),
                                  textChanged: (text) {
                                    setState(() {
                                      _post.categoryName = text;
                                    });
                                  },
                                  clearOnSubmit: false,
                                  textSubmitted: (text) => setState(
                                    () {
                                      if (text != "") {
                                        _post.categoryName = text;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextSafeComponent(
                        text: 'Ingredients',
                        style: textStyleHeading,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder<List<Unit>>(
                        future: fetchUnitList(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: _post.ingredients.length,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return RowIngredientFormField(
                                snapshot.data
                                    .map((unit) => unit.unitName)
                                    .toList(),
                                unitName: _post.ingredients[index].unitName,
                                onIngredientNameSaved: (String value) {
                                  setState(() {
                                    _post.ingredients[index].ingredientName = value;
                                  });
                                },
                                onUnitValueSaved: (String value) {
                                  setState(() {
                                    _post.ingredients[index].value = int.tryParse(value);
                                  });
                                },
                                onUnitNameChanged: (String value) {
                                  setState(() {
                                    _post.ingredients[index].unitName = value;
                                  });
                                },
                                titleText: 'Ingredient:',
                              );
                            },
                          );
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ButtonWithIcon(
                            onPressed: () {
                              Ingredient ingredient = Ingredient();
                              setState(() {
                                _post.ingredients.add(ingredient);
                              });
                            },
                            label: 'Add Ingredient',
                          ),
                          if (_post.ingredients.length > 0)
                            ButtonWithIcon(
                              onPressed: () {
                                setState(() {
                                  _post.ingredients.removeLast();
                                });
                              },
                              label: 'Remove Ingredient',
                            ),
                        ],
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
                      TextSafeComponent(
                        text: 'Steps',
                        style: textStyleHeading,
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
                          ),
                          if (_post.steps.length > 0)
                            ButtonWithIcon(
                              onPressed: () {
                                setState(() {
                                  _post.steps.removeLast();
                                });
                              },
                              label: 'Remove step',
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
                          if (_post.steps
                              .any((step) => step.imageUrl == null)) {
                            showErrorSnackBar(context, 'Post must have images');
                            return;
                          }
                          if (_post.categoryName == null ||
                              _post.categoryName.length <= 0) {
                            showErrorSnackBar(
                                context, 'Post must have category');
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
