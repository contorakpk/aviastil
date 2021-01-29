import 'package:aviastil/pages/auth/login_page.dart';
import 'package:aviastil/pages/auth/sign_up_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Color mainColor = Color(0xffeceffa);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: _width * 0.072),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: _width * 0.1),
                    child: Text(
                      '*Іконка*',
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: _width * 0.017,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: _width * 0.02),
                    child: Text(
                      'Aviastil',
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: _width * 0.016,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: _width * 0.38),
                    child: TextButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage())),
                      child: Text(
                        'Війти',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: _width * 0.01,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: _width * 0.02),
                    child: RaisedButton(
                      color: Colors.black54,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage())),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: mainColor,
                          ),
                          SizedBox(width: _width * 0.01),
                          Text(
                            'Зареєструватися',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: _width * 0.01,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: _width * 0.12, left: _width * 0.1),
              alignment: Alignment.topLeft,
              child: Text(
                'Літайте на таксі, замовляйте на столі!',
                style: TextStyle(
                  color: mainColor,
                  fontSize: _width * 0.032,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: _width * 0.025, left: _width * 0.1),
              alignment: Alignment.topLeft,
              child: Text(
                'Для того щоб продовжити необхідно авторизуватись',
                style: TextStyle(
                  color: mainColor,
                  fontSize: _width * 0.013,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: _width * 0.017, left: _width * 0.1),
              alignment: Alignment.topLeft,
              child: RaisedButton(
                color: Colors.black54,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage())),
                child: Container(
                  alignment: Alignment.center,
                  height: _width * 0.032,
                  width: _width * 0.15,
                  child: Text(
                    '*Кнопка "Продовжити"*',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: _width * 0.01,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: _width * 0.1),
          ],
        ),
      ),
    );
  }
}
