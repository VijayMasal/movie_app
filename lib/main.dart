import 'package:flutter/material.dart';
import 'package:movieapp/screen/home_screen.dart';
import 'package:movieapp/screen/login_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan[200],
        accentColor: Colors.cyan[600],
        fontFamily: 'RubikMedium',
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 36.0, fontFamily: 'RubikMedium',color: Colors.cyan[600], ),
          headline3: TextStyle(fontSize: 15.0, fontFamily: 'RubikMedium',color: Colors.cyan[600], ) ,
          bodyText2: TextStyle(fontSize: 15.0, fontFamily: 'RubikMedium'),
          bodyText1: TextStyle(fontSize: 17.0, fontFamily: 'RubikMedium'),
        ),
      ),
      initialRoute: 'Login',
      routes: {
        'Login' : (context) => LoginPage(),
        'Home' : (context) => HomePage()
      },
    );
  }
}
