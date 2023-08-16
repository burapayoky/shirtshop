import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppLageText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  AppLageText(
      {super.key, required this.size, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
      //overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
