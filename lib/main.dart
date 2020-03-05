import 'package:facefood/models/user_details.dart';
import 'package:facefood/screens/explore.dart';
import 'package:facefood/screens/login.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await DotEnv().load('.env');
  UserDetails user = await getUserFromToken();
  if (user != null)
    runApp(MyApp(
      user: user,
    ));
  else
    runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final UserDetails user;
  MyApp({Key key, this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facefood',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/explore': (context) => ExploreScreen(
        ),
        '/login': (context) => LoginScreen(
        ),
      },
      
    );
  }
}
