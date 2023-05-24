import 'package:flutter/material.dart';

TextStyle textStyles({
  double? fontSize,
  FontWeight? fontWeight,
  TextOverflow? textOverflow,
  double? height,
  List<Shadow>? shadows,
  Color? color,
  TextDecoration? textdecoration,
  Paint? foreground,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    overflow: textOverflow,
    height: height,
    shadows: shadows,
    color: color,
    decoration: textdecoration,
    foreground: foreground,
    fontStyle: FontStyle.normal,
  );
}
