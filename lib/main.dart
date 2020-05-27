import 'package:flutter/material.dart';
import 'package:movieapp/screen/home_screen.dart';
import 'package:movieapp/screen/login_screen.dart';


//fontFamily: 'BrandingSemiLight',

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontFamily: 'RubikMedium',color: Colors.cyan[600], ),
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
