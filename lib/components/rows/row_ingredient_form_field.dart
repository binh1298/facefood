import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class RowIngredientFormField extends StatelessWidget {
  final List<String> suggestions;
  final String unitName;
  final Function onIngredientNameSaved;
  final Function onUnitValueSaved;
  final Function onUnitNameChanged;

  final GlobalKey<AutoCompleteTextFieldState<String>> autoCompleteFieldKey =
      GlobalKey();

  final bool obscureText;
  final String titleText;
  final Function onSaved, validator;
  final int maxLine;
  final TextInputType inputType;
  RowIngredientFormField(this.suggestions,
      {this.onIngredientNameSaved,
      this.onUnitValueSaved,
      this.onUnitNameChanged,
      this.unitName,
      this.obscureText = false,
      this.onSaved,
      this.validator,
      this.titleText,
      this.maxLine = 1,
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              child: Text(
                titleText,
                style: textStyleDefaultPrimary,
              ),
            ),
            Expanded(
              child: TextFormField(
                keyboardType: inputType,
                obscureText: obscureText,
                style: textStyleDefault,
                decoration: inputDecorationTextFormField('Name'),
                validator: validator,
                onSaved: onIngredientNameSaved,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
            ),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                obscureText: obscureText,
                style: textStyleDefault,
                decoration: inputDecorationTextFormField('Value'),
                validator: validator,
                onSaved: onUnitValueSaved,
              ),
            ),
            Expanded(
              child: SimpleAutoCompleteTextField(
                key: autoCompleteFieldKey,
                decoration: inputDecorationTextFormField('Unit'),
                controller: TextEditingController(text: unitName),
                suggestions: suggestions,
                textChanged: (text) {
                  onUnitNameChanged(text);
                },
                clearOnSubmit: false,
                textSubmitted: (text) {
                  onUnitNameChanged(text);
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
