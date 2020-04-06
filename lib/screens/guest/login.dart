import 'package:facefood/components/buttons/button_confirm_component.dart';
import 'package:facefood/components/text_form_fields/text_form_field_rectangle.dart';
import 'package:facefood/restart_app.dart';
import 'package:facefood/screens/guest/forgot_password.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:facefood/models/user_credentials.dart';
import 'package:facefood/style/style.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        Container(
                          height: 160.0,
                          child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset('lib/assets/images/logo.ico')),
                        ),
                        Center(
                            child: Text("Facefood", style: textStyleHeading)),
                        SizedBox(height: 30.0),
                        TextFormFieldRectangle(
                          hintText: 'Username',
                          onSaved: (username) {
                            setState(() {
                              _userCredentials.username = username;
                            });
                          },
                          validator: (username) {
                            if (username.isEmpty)
                              return 'Please enter your username';
                            return null;
                          },
                        ),
                        SizedBox(height: 25.0),
                        TextFormFieldRectangle(
                          obscureText: true,
                          hintText: 'Password',
                          onSaved: (password) {
                            setState(() {
                              _userCredentials.password = password;
                            });
                          },
                          validator: (password) {
                            if (password.isEmpty)
                              return 'Please enter your password';
                            return null;
                          },
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       remember = !remember;
                        //     });
                        //   },
                        //   child: Row(
                        //     children: <Widget>[
                        //       Checkbox(
                        //         value: remember,
                        //         onChanged: (bool value) {},
                        //       ),
                        //       Text(
                        //         'Remember my password',
                        //         style: textStyleDefault.copyWith(
                        //           fontSize: 15,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ButtonConfirmComponent(
                          text: 'Login',
                          onPressed: () async {
                            final form = _loginFormKey.currentState;
                            if (form.validate()) {
                              form.save();
                              bool success =
                                  await _userCredentials.login(context);
                              var user = await getUserFromToken();
                              String id = user.username;
                              print('after login $id');
                              if (success) {
                                RestartWidget.restartApp(context);
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 13,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordScreen()));
                              },
                              child: Text(
                                'Forgot your password?',
                                style: textStyleDefault.copyWith(
                                    fontSize: 15,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
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
