import 'package:flutter/material.dart';

class CircleSelection extends StatelessWidget {
  bool isSelected;
  Icon icon;
  Color color;
  String title;
  CircleSelection({this.isSelected, this.icon, this.color, this.title});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: _width * 0.03,
          width: _width * 0.03,
          child: CircleAvatar(
            backgroundColor: color,
            child: icon,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: _width * 0.01),
          child: Text(
            '$title',
            style: TextStyle(
              color: Colors.black,
              fontSize: _width * 0.01,
            ),
          ),
        )
      ],
    );
  }
}
