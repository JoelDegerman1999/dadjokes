import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _prefferedHeight = 100;

  final String title;
  final Color gradientBegin, gradientEnd;

  GradientAppBar({this.title, this.gradientBegin, this.gradientEnd})
      : assert(title != null),
        assert(gradientBegin != null),
        assert(gradientEnd != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _prefferedHeight,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [gradientBegin, gradientEnd]),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            letterSpacing: 10,
            fontSize: 30,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}
