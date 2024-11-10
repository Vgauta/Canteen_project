import 'package:canteen/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

import '../util/constants.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final bool isBorderOn;
  final Color? borderColor;
  final Function()? onPressed;
  const ElevatedButtonCustom({
    super.key,
    required this.child,
    this.color,
    this.isBorderOn = false,
    this.borderColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(
              Size(double.infinity, Dimensions.defaultButtonHeight)),
          backgroundColor: MaterialStateProperty.all(color),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: isBorderOn
              ? MaterialStatePropertyAll(BorderSide(color: borderColor!))
              : const MaterialStatePropertyAll(BorderSide.none),
          shadowColor: const MaterialStatePropertyAll(AppColorPallete.primaryColor50),
          elevation: const MaterialStatePropertyAll(10)),
      child: child,
    );
  }
}
