import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String content;
  final TextEditingController controller;

  InputField({this.label, this.content, this.controller});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Row(
      children: <Widget>[
        Container(
          width: _width * 0.06,
          child: Text(
            "$label",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: _width * 0.01),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: _width * 0.036),
          width: _width * 0.24,
          height: _width * 0.032,
          color: Colors.blue[50],
          child: TextField(
            controller: controller,
            style: TextStyle(
              fontSize: _width * 0.01,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[50],
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[50],
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: "$content",
              fillColor: Colors.blue[50],
            ),
          ),
        ),
      ],
    );
  }
}