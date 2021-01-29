import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:aviastil/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../widgets/input/input_field.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  double _width;

  DateTime _dateStart = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  TextEditingController _firstController = TextEditingController();
  TextEditingController _secondController = TextEditingController();
  TextEditingController _thirdController = TextEditingController();
  TextEditingController _fourthController = TextEditingController();
  TextEditingController _fifthController = TextEditingController();
  TextEditingController _sixthController = TextEditingController();
  TextEditingController _seventhController = TextEditingController();
  TextEditingController _eighthController = TextEditingController();

  void _clearControllers() {
    _firstController.clear();
    _secondController.clear();
    _thirdController.clear();
    _fourthController.clear();
    _fifthController.clear();
    _sixthController.clear();
    _seventhController.clear();
    _eighthController.clear();
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

  _openPopupCities(context) {
    _clearControllers();
    Alert(
        context: context,
        title: "Місто",
        content: Column(
          children: <Widget>[
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Назва',
                content: 'Коломия',
                controller: _firstController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Країна',
                content: 'Україна',
                controller: _secondController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Ціна',
                content: '2300',
                controller: _thirdController,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              _addCities();
            },
            child: Text(
              "Добавити",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  _openPopupCitiesFrom(context) {
    _clearControllers();
    Alert(
        context: context,
        title: "Місто (звідки)",
        content: Column(
          children: <Widget>[
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Назва',
                content: 'Коломия',
                controller: _firstController,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: _addCitiesFrom,
            child: Text(
              "Добавити",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  _openPopupCountries(context) {
    _clearControllers();
    Alert(
        context: context,
        title: 'Країна',
        content: Column(
          children: <Widget>[
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Назва',
                content: 'Україна',
                controller: _secondController,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Добавити",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  _openPopupHotels(context) {
    _clearControllers();
    Alert(
        context: context,
        title: 'Готель',
        content: Column(
          children: <Widget>[
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Назва',
                content: 'Готельйо',
                controller: _firstController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Місто',
                content: 'Коломия',
                controller: _secondController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Країна',
                content: 'Україна',
                controller: _thirdController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Ціна',
                content: '2300',
                controller: _fourthController,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Добавити",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  _openPopupTickets(context) {
    _clearControllers();
    Alert(
        context: context,
        title: 'Білет',
        content: Column(
          children: <Widget>[
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'ID Покупця',
                content: '1',
                controller: _firstController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Кількість людей',
                content: '1',
                controller: _secondController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Звідки',
                content: 'Коломия',
                controller: _thirdController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Куда',
                content: 'Рим',
                controller: _fourthController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Готель',
                content: 'Готельйо',
                controller: _fifthController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Кількість днів',
                content: '7',
                controller: _sixthController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Кількість людей',
                content: '1',
                controller: _seventhController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
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
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Ціна',
                content: '2300',
                controller: _eighthController,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Добавити",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  _openPopupTicketsTours(context) {
    _clearControllers();
    Alert(
        context: context,
        title: 'Білет (тур)',
        content: Column(
          children: <Widget>[
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'ID Покупця',
                content: '1',
                controller: _firstController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Кількість людей',
                content: '1',
                controller: _secondController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'ID Тура',
                content: '1',
                controller: _thirdController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Кількість днів',
                content: '7',
                controller: _fourthController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
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
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Ціна',
                content: '2300',
                controller: _fifthController,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Добавити",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  _openPopupTours(context) {
    _clearControllers();
    Alert(
        context: context,
        title: 'Тур',
        content: Column(
          children: <Widget>[
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Країна',
                content: 'Україна',
                controller: _firstController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Місто',
                content: 'Коломия',
                controller: _secondController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Готель',
                content: 'Готельйо',
                controller: _thirdController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Ціна',
                content: '2300',
                controller: _fourthController,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Добавити",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  _openPopupUsers(context) {
    _clearControllers();
    Alert(
        context: context,
        title: 'Користувачі',
        content: Column(
          children: <Widget>[
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Прізвище',
                content: 'Шевченко',
                controller: _firstController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Ім\'я',
                content: 'Тарас',
                controller: _secondController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'По-батькові',
                content: 'Григорович',
                controller: _thirdController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Ім\'я',
                content: 'Тарас',
                controller: _fourthController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Стать',
                content: 'Чоловік/Жінка',
                controller: _fifthController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
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
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Роль',
                content: 'Користувач',
                controller: _sixthController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Email',
                content: 'email@gmail.com',
                controller: _seventhController,
              ),
            ),
            SizedBox(height: _width * 0.01),
            Container(
              child: InputField(
                label: 'Пароль',
                content: '12345678',
                controller: _eighthController,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Добавити",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  void _addCities() async {
    var url = "https://project-aquafresh.000webhostapp.com/add/cities_add.php";
    var data = {
      "name": _firstController.text,
      "country": _secondController,
      "price": _thirdController.text
    };

    var res = await http.post(url, body: data);
    
    switch (jsonDecode(res.body)) {
      case 'true':
        return showSnackBar('Успіх: Запис добавлений');
      case 'false':
        return showSnackBar('Помилка: Сталася помилка доступу');
      default:
        return showSnackBar(jsonDecode(res.body));
    }
  }

  void _addCitiesFrom() async {
    var url = "https://project-aquafresh.000webhostapp.com/add/cities_from_add.php";
    var data = {
      "name": _firstController.text
    };

    var res = await http.post(url, body: data);
    
    switch (jsonDecode(res.body)) {
      case 'true':
        return showSnackBar('Успіх: Запис добавлений');
      case 'false':
        return showSnackBar('Помилка: Сталася помилка доступу');
      default:
        return showSnackBar(jsonDecode(res.body));
    }
  }

  void showSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value),
        backgroundColor: Theme.of(context).accentColor,
        behavior: SnackBarBehavior.floating,
        elevation: 6.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: _width * 0.04),
              child: Text(
                'Адмін панель',
                style: TextStyle(
                  fontSize: _width * 0.03,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Wrap(
                direction: Axis.vertical,
                spacing: _width * 0.03,
                children: [
                  Container(
                    width: _width * 0.13,
                    height: _width * 0.03,
                    child: RaisedButton(
                      onPressed: () => _openPopupCities(context),
                      child: Text(
                        'cities',
                        style: TextStyle(
                          fontSize: _width * 0.018,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _width * 0.13,
                    height: _width * 0.03,
                    child: RaisedButton(
                      onPressed: () => _openPopupCitiesFrom(context),
                      child: Text(
                        'cities_from',
                        style: TextStyle(
                          fontSize: _width * 0.018,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _width * 0.13,
                    height: _width * 0.03,
                    child: RaisedButton(
                      onPressed: () => _openPopupCountries(context),
                      child: Text(
                        'countries',
                        style: TextStyle(
                          fontSize: _width * 0.018,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _width * 0.13,
                    height: _width * 0.03,
                    child: RaisedButton(
                      onPressed: () => _openPopupHotels(context),
                      child: Text(
                        'hotels',
                        style: TextStyle(
                          fontSize: _width * 0.018,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _width * 0.13,
                    height: _width * 0.03,
                    child: RaisedButton(
                      onPressed: () => _openPopupTickets(context),
                      child: Text(
                        'tickets',
                        style: TextStyle(
                          fontSize: _width * 0.018,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _width * 0.13,
                    height: _width * 0.03,
                    child: RaisedButton(
                      onPressed: () => _openPopupTicketsTours(context),
                      child: Text(
                        'tickets_tours',
                        style: TextStyle(
                          fontSize: _width * 0.018,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _width * 0.13,
                    height: _width * 0.03,
                    child: RaisedButton(
                      onPressed: () => _openPopupTours(context),
                      child: Text(
                        'tours',
                        style: TextStyle(
                          fontSize: _width * 0.018,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _width * 0.13,
                    height: _width * 0.03,
                    child: RaisedButton(
                      onPressed: () => _openPopupUsers(context),
                      child: Text(
                        'users',
                        style: TextStyle(
                          fontSize: _width * 0.018,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _width * 0.13,
                    height: _width * 0.03,
                    child: RaisedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage())),
                      color: Colors.red,
                      child: Text(
                        'Вийти',
                        style: TextStyle(
                          fontSize: _width * 0.018,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: _width * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
