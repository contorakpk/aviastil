import 'package:aviastil/pages/auth/login_page.dart';
import 'package:aviastil/pages/auth/sign_up_page.dart';
import 'package:aviastil/pages/welcome_page.dart';
import 'package:aviastil/widgets/background.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedFrom, _selectedWhere, _selectedHotel;
  List<String> _from = [
    "Івано-Франківськ",
    "Київ",
    "Коломия",
    "Львів",
    "Миколаїв",
    "Одесса"
  ];
  List<String> _where = [
    "Албена",
    "Аоста",
    "Барселона",
    "Варна",
    "Дахаб",
    "Каварна",
    "Калабрія",
    "Коста Брава",
    "Мадрид",
    "Мале",
    "Південний Гоа",
    "Північний Гоа",
    "Рим",
    "Сафага",
    "Таба"
  ];
  List<String> _hotels = [
    "Diwa Club by Alila",
    "Ecotel Dahab Bay View Resortt",
    "FabHotel Prime The King's Court",
    "Fairfield by Marriott Goa Anjuna",
    "Grand Hotel London",
    "Hotel Malibu"
  ];

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
                    SizedBox(width: _width * 0.06),
                    Container(
                      margin: EdgeInsets.only(top: _width * 0.005),
                      width: _width * 0.09,
                      height: _width * 0.027,
                      child: OutlineButton(
                        onPressed: () => {},
                        borderSide: BorderSide(color: Colors.lightBlueAccent),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(_width * 0.013)),
                        child: Text(
                          'Профіль',
                          style: TextStyle(
                            fontSize: _width * 0.014,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: _width * 0.01),
                    Container(
                      margin: EdgeInsets.only(top: _width * 0.005),
                      width: _width * 0.1,
                      height: _width * 0.027,
                      child: MaterialButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomePage())),
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Вийти',
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
                  'Літайте на таксі, замовляйте на столі',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: _width * 0.024,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: _width * 0.04),
                  width: _width * 0.6,
                  color: Colors.white54,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: _width * 0.03, left: _width * 0.06),
                        child: Row(
                          children: [
                            DropdownButton<String>(
                              hint: Text('Звідки'),
                              value: _selectedFrom,
                              isDense: true,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedFrom = newValue;
                                });
                              },
                              items: _from.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            SizedBox(width: _width * 0.02),
                            DropdownButton<String>(
                              hint: Text('Куда'),
                              value: _selectedWhere,
                              isDense: true,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedWhere = newValue;
                                });
                              },
                              items: _where.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            SizedBox(width: _width * 0.02),
                            DropdownButton<String>(
                              hint: Text('Готель'),
                              value: _selectedHotel,
                              isDense: true,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedHotel = newValue;
                                });
                              },
                              items: _hotels.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: _width * 0.03),
                        width: _width * 0.1,
                        height: _width * 0.027,
                        child: MaterialButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage())),
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'Замовити',
                            style: TextStyle(
                              fontSize: _width * 0.014,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: _width * 0.04),
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
