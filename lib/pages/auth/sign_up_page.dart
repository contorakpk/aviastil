import 'package:aviastil/functions/sign_up.dart';
import 'package:aviastil/pages/auth/login_page.dart';
import 'package:aviastil/pages/home_page.dart';
import 'package:aviastil/widgets/input/input_field.dart';
import 'package:aviastil/widgets/input/input_field_password.dart';
import 'package:aviastil/widgets/select/circle_selection.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _gender;

  bool _obscureText = true;
  bool _isSelected1 = false;
  bool _isSelected2 = false;

  DateTime _dateStart = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
    Color mainColor = Theme.of(context).accentColor;
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
                          'Реєстрація',
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
                          'Для того щоб зареєструватись необхідно заповнити форму',
                          style: TextStyle(
                            fontSize: _width * 0.013,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: _width * 0.12),
                        width: _width * 0.24,
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Ви уже зареєстровані?',
                                style: TextStyle(
                                  fontSize: _width * 0.013,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: _width * 0.01),
                              width: _width * 0.06,
                              child: RaisedButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage())),
                                child: Text(
                                  'Війти',
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
                      EdgeInsets.only(top: _width * 0.04, left: _width * 0.07),
                  color: Colors.white,
                  height: _width * 0.5,
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: _width * 0.02,
                    children: [
                      Container(
                        child: InputField(
                          label: 'Ім\'я',
                          content: 'Тарас',
                          controller: _firstNameController,
                        ),
                      ),
                      Container(
                        child: InputField(
                          label: 'По-батькові',
                          content: 'Григорович',
                          controller: _surnameController,
                        ),
                      ),
                      Container(
                        child: InputField(
                          label: 'Прізвище',
                          content: 'Шевченко',
                          controller: _lastNameController,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: _width * 0.06,
                              child: Text(
                                'Дата народження',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: _width * 0.01),
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
                      Container(
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
