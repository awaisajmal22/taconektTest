import 'package:flutter/material.dart';

appText(
    {required String title,
    TextAlign textAlign = TextAlign.center,
    double fontSize = 12,
    Color textColor = Colors.black,
    FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    title,
    textAlign: textAlign,
    style:
        TextStyle(fontSize: fontSize, color: textColor, fontWeight: fontWeight),
  );
}