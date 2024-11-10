import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustomTwo extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Function()? onPressed;
  final Offset? offset;
  final Color? shadowColor;
  final double? blurRadius;
  const ElevatedButtonCustomTwo({
    super.key,
    required this.child,
    this.color,
    this.onPressed,
    this.offset,
    this.shadowColor,
    this.blurRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        decoration: BoxDecoration(
          color: color ?? AppColorPallete.whiteColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? AppColorPallete.greyColor200,
              blurRadius: blurRadius ?? 10,
              offset: offset ?? const Offset(8, 15),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
