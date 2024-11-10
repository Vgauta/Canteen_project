import 'package:canteen/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/util/constants.dart';
import '../../../../../../core/widget/big_text.dart';
import '../../../../../../core/widget/small_text.dart';

class CardWidget extends StatelessWidget {
  final double padding;
  final double borderRadius;
  final Color? color;
  final IconData? icon;
  final String title;
  final String value;
  final double? height;
  final double? width;
  final Color? borderColor;
  final VoidCallback? onTap;

  const CardWidget({
    super.key,
    this.padding = Dimensions.defaultPadding,
    this.borderRadius = 10,
    this.color = Colors.transparent,
    this.icon,
    required this.title,
    required this.value,
    this.height = 90,
    this.width,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: color,
            // borderRadius: BorderRadius.circular(borderRadius),
            border:
                Border.all(color: borderColor ?? AppColorPallete.greyColor)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    text: value,
                    fontWeight: FontWeight.bold,
                  ),
                  SmallText(
                    text: title,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: FaIcon(
                icon,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
