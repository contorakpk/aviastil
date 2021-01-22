import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: Text(
                'Ахахахха, ти підарас',
                style: TextStyle(
                  fontSize: _width * 0.05,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: _width * 0.02,
              child: RaisedButton(
                color: Colors.orange,
                onPressed: () {},
                child:
                    Text('cities', style: TextStyle(fontSize: _width * 0.014)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: _width * 0.02,
              child: RaisedButton(
                color: Colors.yellow,
                onPressed: () {},
                child:
                    Text('cities_from', style: TextStyle(fontSize: _width * 0.014)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: _width * 0.02,
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {},
                child:
                    Text('country', style: TextStyle(fontSize: _width * 0.014)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: _width * 0.02,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {},
                child:
                    Text('users', style: TextStyle(fontSize: _width * 0.014)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: _width * 0.02,
              child: RaisedButton(
                color: Colors.purple,
                onPressed: () {},
                child:
                    Text('_check', style: TextStyle(fontSize: _width * 0.014)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
