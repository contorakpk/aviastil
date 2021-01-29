import 'dart:convert';

import 'package:aviastil/pages/admin_page.dart';
import 'package:aviastil/pages/auth/sign_up_page.dart';
import 'package:aviastil/pages/home_page.dart';
import 'package:aviastil/widgets/input/input_field.dart';
import 'package:aviastil/widgets/input/input_field_password.dart';
import 'package:aviastil/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

   void _login() async {
    //FocusScope.of(context).requestFocus(FocusNode());

    //FullScreenDialogs().showFullScreenLoadingDialog(context); //https://project-aquafresh.000webhostapp.com/auth/login.php

    var url =
        "https://dbserverproject.000webhostapp.com/librarian/auth/librarian_sign_in.php";
    var data = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };

    var res = await http.post(url, body: data);

    //Navigator.of(context).pop();
    switch (jsonDecode(res.body)) {
      case 'password-matched':
       // _getID();

        //localBox.put('email', _emailController.text);
        //localBox.put('password', _passwordController.text);
        //localBox.put('role', 'librarian');

        Navigator.pushAndRemoveUntil(
           context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false);
        break;
      case 'wrong-password':
        return showSnackBar('Помилка: Неправильний пароль');
      case 'missing-email':
        return showSnackBar('Помилка: пошта не зареєстрована');
      default:
        return showSnackBar(jsonDecode(res.body));
    }
  }

  void showSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value, style: TextStyle(color: Colors.black),),
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
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          height: _width * 0.5,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          '*Іконка*',
                          style: TextStyle(
                            fontSize: _width * 0.03,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: _width * 0.06),
                        child: Text(
                          'Вхід',
                          style: TextStyle(
                            fontSize: _width * 0.03,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: _width * 0.013, left: _width * 0.08),
                        width: _width * 0.24,
                        child: Text(
                          'Для того щоб війти необхідно заповнити форму',
                          style: TextStyle(
                            fontSize: _width * 0.013,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: _width * 0.12),
                        width: _width * 0.3,
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Ви ще не зареєстровані?',
                                style: TextStyle(
                                  fontSize: _width * 0.013,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: _width * 0.01),
                              width: _width * 0.13,
                              height: _width * 0.03,
                              child: RaisedButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage())),
                                child: Text(
                                  'Зареєструватись',
                                  style: TextStyle(
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
              Expanded(
                flex: 5,
                child: Container(
                  padding:
                      EdgeInsets.only(top: _width * 0.18, left: _width * 0.07),
                  color: Colors.white,
                  height: _width * 0.5,
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: _width * 0.02,
                    children: [
                      Container(
                        child: InputField(
                          label: 'Емайл',
                          content: 'email@gmail.com',
                          controller: _emailController,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: InputPasswordField(
                              obscureText: _obscureText,
                              label: 'Пароль',
                              content: '••••••••',
                              controller: _passwordController,
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(_obscureText == true
                                  ? Icons.lock
                                  : Icons.lock_open),
                              onPressed: _showPassword,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: _width * 0.2),
                        width: _width * 0.16,
                        height: _width * 0.03,
                        child: RaisedButton(
                          onPressed: () {
                            if (_emailController.text == 'admin' &&
                                _passwordController.text == 'admin') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminPage()));
                            } else {
                              if(_emailController.text == 'opamkgue@ukr.net' && _passwordController.text == 'zxc') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                              } else {
                                showSnackBar('Помилка: Неправильно введені дані');
                              }
                            }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
