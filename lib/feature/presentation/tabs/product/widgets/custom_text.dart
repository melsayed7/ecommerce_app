import 'package:flutter/material.dart';

class CustomProductText extends StatelessWidget {
  CustomProductText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      this.decoration,
      this.color})
      : super(key: key);
  String text;
  double fontSize;
  FontWeight fontWeight;
  TextDecoration? decoration;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
