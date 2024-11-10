
import 'package:flutter/material.dart';

import '../theme/color_pallete.dart';
import 'small_text.dart';

class SnackBarHelper {
  static void showSnackBar(
      BuildContext context, String message, bool? isError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColorPallete.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(
              text: message,
              color: isError! ? Colors.red : AppColorPallete.primaryColor,
              size: 18,
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
