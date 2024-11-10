import 'package:flutter/material.dart';

import '../../../../../../core/theme/color_pallete.dart';
import '../../../../../../core/util/constants.dart';
import '../../../../../../core/widget/custome_container.dart';
import '../../../../../../core/widget/eleve_button.dart';
import '../../../../../../core/widget/small_text.dart';

class ElevatedButtonCustomeDashboard extends StatelessWidget {
  final String value;
  final String title;
  final Color? color;
  final Color? containerColor;
  final VoidCallback onPressed;
  const ElevatedButtonCustomeDashboard({
    super.key,
    required this.value,
    required this.title,
    this.color,
    this.containerColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonCustom(
      onPressed: onPressed,
      color: containerColor,
      isBorderOn: true,
      borderColor: color,
      child: Row(
        children: [
          CustomeContainer(
            width: 80,
            isShadowOn: false,
            color: color,
            borderColor: Colors.transparent,
            child: SmallText(text: value),
          ),
          const SizedBox(width: Dimensions.defualtWidthForSpace),
          SmallText(text: title),
          const Spacer(),
          SmallText(text: "Manage $title"),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: AppColorPallete.blackColor,
          )
        ],
      ),
    );
  }
}
