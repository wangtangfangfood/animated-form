import 'package:flutter/material.dart';

class TWStyle {
  static Color color;

  static double fontSize;

  static FontWeight fontWeight;

  static TextStyle customtWStyle(
          {Color color, double fontSize, FontWeight fontWeight}) =>
      TextStyle(
          color: color ?? Colors.black54,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.normal);

  static TextStyle get defaulttWStyle =>
      customtWStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
}
