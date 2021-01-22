import 'package:aviastil/pages/admin_page.dart';
import 'package:aviastil/pages/auth/sign_up_page.dart';
import 'package:aviastil/widgets/input/input_field.dart';
import 'package:aviastil/widgets/input/input_field_password.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                          controller: emailController,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: InputPasswordField(
                              obscureText: _obscureText,
                              label: 'Пароль',
                              content: '••••••••',
                              controller: passwordController,
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
                            if (emailController.text == 'ya' &&
                                passwordController.text == 'pidaras') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminPage()));
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
