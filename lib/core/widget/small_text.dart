import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double? size;
  final TextOverflow? textOverflow;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final bool isDark;
  const SmallText({
    super.key,
    required this.text,
    this.size = 14.0,
    this.textOverflow = TextOverflow.ellipsis,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
    this.decorationColor,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: size,
        color: color ?? Theme.of(context).textTheme.displayLarge!.color,
        fontWeight: fontWeight,
        decoration: textDecoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
