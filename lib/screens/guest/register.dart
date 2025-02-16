import 'package:facefood/components/buttons/button_confirm_component.dart';
import 'package:facefood/components/text_form_fields/text_form_field_rectangle.dart';
import 'package:facefood/models/user_register.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  final _user = UserRegister();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Builder(
              builder:(context) => Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        child: Image.asset('lib/assets/images/logo.ico'),
                      ),
                      Text('Register', style: textStyleHeading),
                      SizedBox(height: 45.0),
                      TextFormFieldRectangle(
                        hintText: 'Username',
                        onSaved: (username) =>
                            setState(() => _user.username = username),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Username.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25.0),
                      TextFormFieldRectangle(
                        hintText: 'Email',
                        onSaved: (email) => setState(() => _user.email = email),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Email.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25.0),
                      TextFormFieldRectangle(
                        hintText: 'Password',
                        obscureText: true,
                        onSaved: (password) =>
                            setState(() => _user.password = password),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Password.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25.0),
                      TextFormFieldRectangle(
                        hintText: 'Confirm Password',
                        obscureText: true,
                        onSaved: (confirmPassword) => setState(
                            () => _user.confirmPassword = confirmPassword),
                      ),
                      SizedBox(height: 25.0),
                      ButtonConfirmComponent(
                        text: 'Register',
                        onPressed: () async {
                          final form = _formkey.currentState;
                          if (form.validate()) {
                            form.save();
                            bool success = await _user.register(context);
                            if (success) {
                              Navigator.pushReplacementNamed(context, '/explore');
                            } else {
                              
                            }
                          }
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
    );
  }
}
