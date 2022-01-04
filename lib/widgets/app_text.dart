import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final Color color;
  final double size;
  final String text;

  AppText(
      {Key? key,
      this.size = 16,
      required this.text,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, height: 1.5),
    );
  }
}
