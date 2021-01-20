import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.blue)),
          Expanded(child: Container(color: Colors.yellow)),
        ],
      ),
    );
  }
}