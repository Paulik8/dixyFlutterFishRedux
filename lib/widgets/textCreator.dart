import 'package:flutter/material.dart';

Widget buildText(String item, {double fontSize = 18, Color color = Colors.black}) =>
  Text(
    item,
    style: TextStyle(
      fontSize: fontSize,
      color: color
    ),
  );