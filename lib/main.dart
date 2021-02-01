import 'package:aviastil/pages/error_page.dart';
import 'package:aviastil/pages/loading_page.dart';
import 'package:aviastil/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:aviastil/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('appData');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.lightBlue,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorPage();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return WelcomePage();
            }
            return LoadingPage();
          }),
    );
  }
}
