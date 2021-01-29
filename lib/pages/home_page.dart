import 'package:aviastil/pages/auth/sign_up_page.dart';
import 'package:aviastil/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: _width * 0.052,
            padding:
                EdgeInsets.only(left: _width * 0.032, right: _width * 0.032),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Ic',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: _width * 0.023,
                    ),
                  ),
                ),
                SizedBox(width: _width * 0.012),
                Container(
                  child: Text(
                    'Aviastil',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: _width * 0.023,
                    ),
                  ),
                ),
                SizedBox(width: _width * 0.3),
                Container(
                  width: _width * 0.08,
                  height: _width * 0.02,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Скачати',
                      style: TextStyle(
                        fontSize: _width * 0.011,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: _width * 0.01),
                Container(
                  width: _width * 0.13,
                  height: _width * 0.02,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Статистика',
                      style: TextStyle(
                        fontSize: _width * 0.011,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: _width * 0.014),
                Container(
                  width: _width * 0.001,
                  height: _width * 0.04,
                  color: Colors.grey,
                ),
                SizedBox(width: _width * 0.014),
                Container(
                  width: _width * 0.08,
                  height: _width * 0.026,
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomePage())),
                    child: Text(
                      'Вийти',
                      style: TextStyle(
                        fontSize: _width * 0.011,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: _width * 0.052,
            color: Colors.blue,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Літайте на столі, замовляйте на столі!',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: _width * 0.02,
                ),
              ),
            ),
          ),
          SizedBox(height: _width * 0.08),
          Container(
            child: Text(
              'Для того щоб продовжити необхідно авторизуватись',
              style: TextStyle(
                color: Colors.black,
                fontSize: _width * 0.025,
              ),
            ),
          ),
          SizedBox(height: _width * 0.02),
          Container(
            width: _width * 0.2,
            height: _width * 0.04,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text(
                'Авторизуватись',
                style: TextStyle(
                  fontSize: _width * 0.012,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
