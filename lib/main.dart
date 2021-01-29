import 'package:flutter/material.dart';
import 'package:aviastil/pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF3965db),
        textTheme: TextTheme(bodyText2: TextStyle(color: Color(0xffeceffa))),
        accentColor: Color(0xffeceffa),
      ),
      home: WelcomePage(),
    );
  }
}
