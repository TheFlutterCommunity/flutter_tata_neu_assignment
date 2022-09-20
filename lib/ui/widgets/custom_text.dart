import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? testAlignment;
  final Paint? foreground;

  const CustomText({
    @required this.text,
    this.fontFamily = 'Inter-Regular',
    this.fontSize,
    this.fontWeight,
    this.color,
    this.testAlignment,
    this.foreground,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: testAlignment,
      style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          foreground: foreground),
    );
  }
}
