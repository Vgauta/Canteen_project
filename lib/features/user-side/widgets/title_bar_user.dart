import 'package:flutter/material.dart';

import '../../../core/theme/color_pallete.dart';
import '../../../core/util/constants.dart';
import '../../../core/widget/big_text.dart';

class TitleBarWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;

  const TitleBarWidget({
    super.key,
    required this.title,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 15,
                offset: const Offset(6, 9),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18,
              ),
            ),
          ),
        ),
        const Spacer(),
        BigText(
          text: title,
          color: titleColor,
          fontWeight: FontWeight.bold,
        ),
        const Spacer(),
      ],
    );
  }
}
