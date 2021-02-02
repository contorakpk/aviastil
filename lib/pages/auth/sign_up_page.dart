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
import 'package:aviastil/widgets/select/circle_selection.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var appDataBox = Hive.box('appData');

  bool _obscureText = true, _isSelected1 = false, _isSelected2 = false;

  String message, currentUser, _gender;

  DateTime _dateStart = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: _dateStart,
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
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
    Color mainColor = Colors.black54;
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
                color: Colors.white54,
                child: Column(
                  children: [
                    SizedBox(height: _width * 0.05),
                    Container(
                      child: Text(
                        'Реєстрація',
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
                        label: 'ІМ\'Я',
                        content: 'Тарас',
                        controller: _firstNameController,
                      ),
                    ),
                    SizedBox(height: _width * 0.02),
                    Container(
                      child: InputField(
                        label: 'ПРІЗВИЩЕ',
                        content: 'Шевченко',
                        controller: _lastNameController,
                      ),
                    ),
                    SizedBox(height: _width * 0.02),
                    Container(
                      margin: EdgeInsets.only(
                        left: _width * 0.11,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: _width * 0.06,
                            child: Text(
                              'Дата народження',
                              style: TextStyle(
                                  color: Colors.black, fontSize: _width * 0.01),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: _width * 0.036),
                            width: _width * 0.1,
                            child: RaisedButton(
                              onPressed: () => _selectDate(context),
                              child: Text(
                                '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                                style: TextStyle(
                                  fontSize: _width * 0.01,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _width * 0.02),
                    Container(
                      margin: EdgeInsets.only(
                        left: _width * 0.1,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: _width * 0.06,
                            child: Text(
                              'Стать',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: _width * 0.01,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: _width * 0.036),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isSelected1 = true;
                                  _isSelected2 = false;
                                  _gender = 'Чоловік';
                                });
                              },
                              child: CircleSelection(
                                isSelected: _isSelected1,
                                icon: _isSelected1 == true
                                    ? Icon(
                                        Icons.check,
                                        color: mainColor,
                                      )
                                    : Icon(Icons.face, color: mainColor),
                                color: Colors.blue,
                                title: 'Чоловік',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: _width * 0.036),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isSelected1 = false;
                                  _isSelected2 = true;
                                  _gender = 'Жінка';
                                });
                              },
                              child: CircleSelection(
                                isSelected: _isSelected2,
                                icon: _isSelected2 == true
                                    ? Icon(
                                        Icons.check,
                                        color: mainColor,
                                      )
                                    : Icon(Icons.face, color: mainColor),
                                color: Colors.pink,
                                title: 'Жінка',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _width * 0.02),
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
                          signUp(
                                  _emailController.text,
                                  _passwordController.text,
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  _gender,
                                  '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}')
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
                          'Зареєструватись',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: _width * 0.01,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: _width * 0.05),
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
