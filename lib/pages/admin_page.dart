import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../widgets/input/input_field.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  TextEditingController _firstController = TextEditingController();
  TextEditingController _secondController = TextEditingController();
  TextEditingController _thirdController = TextEditingController();
  TextEditingController _fourthController = TextEditingController();
  TextEditingController _fifthController = TextEditingController();
  TextEditingController _sixthController = TextEditingController();
  TextEditingController _seventhController = TextEditingController();

  void _clearControllers() {
    _firstController.clear();
    _secondController.clear();
    _thirdController.clear();
    _fourthController.clear();
    _fifthController.clear();
    _sixthController.clear();
    _seventhController.clear();
  }

  _openPopupCities(context) {
    _clearControllers();
    Alert(
        context: context,
        title: "Місто",
        content: Column(
          children: <Widget>[
            Container(
              child: InputField(
                label: 'Назва',
                content: 'Коломия',
                controller: _firstController,
              ),
            ),
            Container(
              child: InputField(
                label: 'Країна',
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

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: _width * 0.04),
            width: _width * 0.06,
            child: Text(
              'Адмін панель',
              style: TextStyle(
                fontSize: _width * 0.03,
              ),
            ),
          ),
          Container(
            child: Wrap(
              direction: Axis.vertical,
              spacing: _width * 0.03,
              children: [
                Container(
                  width: _width * 0.013,
                  height: _width * 0.03,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'cities',
                      style: TextStyle(
                        fontSize: _width * 0.03,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
