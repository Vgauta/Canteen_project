
import 'package:flutter/material.dart';

import '../util/constants.dart';

class CustomeContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final Color? color;
  final bool isShadowOn;
  final Color? borderColor;
  const CustomeContainer({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.color,
    this.isShadowOn = true,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).scaffoldBackgroundColor,
        boxShadow: isShadowOn == false ? null : Constants.boxShadow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor!)
      ),
      child: child,
    );
  }
}
