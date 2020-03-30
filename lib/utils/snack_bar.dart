import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

showErrorSnackBar(BuildContext context, String message) {
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          '$message',
          // style: textStyleErrorMessage,
        ),
      ),
    );
}

showInfoSnackBar(BuildContext context, String message) {
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          '$message',
          // style: textStyleErrorMessage,
        ),
      ),
    );
}

showInfoDialog(BuildContext context) {
  
  // flutter defined function
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      String reportCause;

      // return object of type Dialog
      return AlertDialog(
        title: Text("Reason"),
        content: TextField(
          decoration: inputDecorationTextFormField('Tell us why...'),
          onChanged: (value) {
            reportCause = value;
          },
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          FlatButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop(null);
            },
          ),
          FlatButton(
            child: Text("Submit"),
            onPressed: () {
              Navigator.of(context).pop(reportCause);
            },
          ),
        ],
      );
    },
  );
}
