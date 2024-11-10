import 'package:flutter/material.dart';

import '../util/constants.dart';

class BigText extends StatelessWidget {
  final String text;
  final double? size;
  final TextOverflow? textOverflow;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const BigText({
    super.key,
    required this.text,
    this.size = Dimensions.mainFontSize18,
    this.textOverflow = TextOverflow.ellipsis,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: size,
        color: color ?? Theme.of(context).textTheme.displayLarge?.color,
        fontWeight: fontWeight,
      ),
    );
  }
}
