import 'dart:ui';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(
            'https://i.pinimg.com/736x/3e/b9/27/3eb92787b1b67241b99d19c27aa26f54.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
