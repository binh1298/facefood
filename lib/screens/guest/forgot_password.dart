import 'package:facefood/components/buttons/button_confirm_component.dart';
import 'package:facefood/components/text_form_fields/text_form_field_rectangle.dart';
import 'package:facefood/restart_app.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:facefood/models/user_credentials.dart';
import 'package:facefood/style/style.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _userCredentials = UserLoginCredentials();
  bool remember = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Builder(
                  builder: (context) => Form(
                    key: _loginFormKey,
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Text("Recover your password",
                                style: textStyleHeading)),
                        SizedBox(height: 30.0),
                        TextFormFieldRectangle(
                          hintText: 'Email',
                          onSaved: (username) {
                            setState(() {
                              _userCredentials.username = username;
                            });
                          },
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                '''Please provide the email associate with your account to verify it's you''',
                                style: textStyleDefault.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        ButtonConfirmComponent(
                          text: 'Send me my password',
                          onPressed: () async {
                            final snackbar = SnackBar(
                              content: Text(
                                  'SUCCESS! please check your email for further instruction.'),
                            );
                            Scaffold.of(context).showSnackBar(snackbar);
                            await Future.delayed(Duration(seconds: 3));
                            Navigator.pop(context);
                            print('DOING NOTHING AT ALL!');
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ButtonConfirmComponent(
                          color: colorCancelButton,
                          text: 'Return to login page',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
