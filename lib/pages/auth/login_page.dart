import 'package:aviastil/db/db_auth.dart';
import 'package:aviastil/functions/login.dart';
import 'package:aviastil/functions/sign_up.dart';
import 'package:aviastil/pages/admin_page.dart';
import 'package:aviastil/pages/auth/sign_up_page.dart';
import 'package:aviastil/pages/home_page.dart';
import 'package:aviastil/widgets/background.dart';
import 'package:aviastil/widgets/input/input_field.dart';
import 'package:aviastil/widgets/input/input_field_password.dart';
import 'package:aviastil/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var appDataBox = Hive.box('appData');

  bool _obscureText = true;

  String message, currentUser;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void showSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).accentColor,
        behavior: SnackBarBehavior.floating,
        elevation: 6.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Background(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: _width * 0.05, left: _width * 0.05),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      width: _width * 0.04,
                      child: Image.asset(
                        'assets/images/aviastil.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: _width * 0.018),
                    Container(
                      margin: EdgeInsets.only(top: _width * 0.005),
                      width: _width * 0.13,
                      child: Text(
                        'Aviastil',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: _width * 0.024,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: _width * 0.03,
                  left: _width * 0.26,
                ),
                alignment: Alignment.center,
                width: _width * 0.48,
                height: _width * 0.4,
                color: Colors.white54,
                child: Column(
                  children: [
                    SizedBox(height: _width * 0.05),
                    Container(
                      child: Text(
                        'Вхід  ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: _width * 0.024,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: _width * 0.05),
                    Container(
                      child: InputField(
                        label: 'ЕМАЙЛ',
                        content: 'email@gmail.com',
                        controller: _emailController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: _width * 0.02,
                        left: _width * 0.11,
                      ),
                      width: _width * 0.5,
                      height: _width * 0.052,
                      child: Row(
                        children: [
                          Container(
                            child: InputPasswordField(
                              obscureText: _obscureText,
                              label: 'ПАРОЛЬ',
                              content: '••••••••',
                              controller: _passwordController,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: _width * 0.01),
                            child: IconButton(
                              icon: Icon(
                                _obscureText == true
                                    ? Icons.lock
                                    : Icons.lock_open,
                                color: Colors.black54,
                              ),
                              onPressed: _showPassword,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: _width * 0.04),
                      width: _width * 0.16,
                      height: _width * 0.03,
                      child: RaisedButton(
                        onPressed: () {
                          login(_emailController.text, _passwordController.text)
                              .then((value) {
                            if (value == null) {
                              _emailController.clear();
                              _passwordController.clear();
                              showSnackBar(
                                  'Сталася помилка, спробуйте пізніше');
                            } else {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false);
                            }
                          });
                        },
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Text(
                          'Війти',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: _width * 0.01,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
