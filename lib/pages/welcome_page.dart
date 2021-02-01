import 'package:aviastil/pages/auth/login_page.dart';
import 'package:aviastil/pages/auth/sign_up_page.dart';
import 'package:aviastil/widgets/background.dart';
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
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: _width * 0.01,
                    left: _width * 0.036,
                    bottom: _width * 0.01),
                child: Row(
                  children: [
                    Container(
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
                    SizedBox(width: _width * 0.25),
                    Container(
                      margin: EdgeInsets.only(top: _width * 0.005),
                      width: _width * 0.08,
                      height: _width * 0.027,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Статистика',
                          style: TextStyle(
                            fontSize: _width * 0.014,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: _width * 0.03),
                    Container(
                      margin: EdgeInsets.only(top: _width * 0.005),
                      width: _width * 0.08,
                      height: _width * 0.027,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Скачати',
                          style: TextStyle(
                            fontSize: _width * 0.014,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: _width * 0.08),
                    Container(
                      margin: EdgeInsets.only(top: _width * 0.005),
                      width: _width * 0.07,
                      height: _width * 0.027,
                      child: OutlineButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage())),
                        borderSide: BorderSide(color: Colors.lightBlue),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(_width * 0.013)),
                        child: Text(
                          'Війти',
                          style: TextStyle(
                            fontSize: _width * 0.014,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: _width * 0.02),
                    Container(
                      margin: EdgeInsets.only(top: _width * 0.005),
                      width: _width * 0.12,
                      height: _width * 0.027,
                      child: MaterialButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage())),
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Реєстрація',
                          style: TextStyle(
                            fontSize: _width * 0.014,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: _width * 0.07,
                color: Colors.white54,
                child: Text(
                  'Літайте на столі, замовляйте на столі',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: _width * 0.024,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: _width * 0.05, top: _width * 0.08),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Для того, щоб продовжити необхідно авторизуватись',
                  style: TextStyle(
                    fontSize: _width * 0.028,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin:
                      EdgeInsets.only(top: _width * 0.03, left: _width * 0.05),
                  width: _width * 0.2,
                  height: _width * 0.037,
                  child: MaterialButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage())),
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_width * 0.017)),
                    child: Container(
                      child: Row(
                        children: [
                          SizedBox(width: _width * 0.033),
                          Container(
                            width: _width * 0.106,
                            child: Text(
                              'Авторизуватись',
                              style: TextStyle(
                                fontSize: _width * 0.014,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: _width * 0.007, right: _width * 0.01),
                            width: _width * 0.001,
                            height: _width * 0.024,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: _width * 0.0026),
                            width: _width * 0.02,
                            height: _width * 0.02,
                            child: Icon(
                              Icons.sensor_door,
                              size: _width * 0.02,
                            ),
                          ),
                        ],
                      ),
                    ),
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
