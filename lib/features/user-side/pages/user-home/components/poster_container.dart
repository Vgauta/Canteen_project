import 'package:flutter/material.dart';

import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/util/constants.dart';
import '../../../../../core/util/image_strings.dart';
import '../../../../../core/widget/big_text.dart';
import '../../../../../core/widget/small_text.dart';

class PosterContainer extends StatelessWidget {
  const PosterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: Dimensions.defaultPadding),
            child: Container(
              height: 200,
              width: 280,
              padding: const EdgeInsets.all(Dimensions.defaultPadding),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(ImagePath.img),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.060),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "it is good",
                    color: AppColorPallete.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  SmallText(
                    text: "dbcubjbd dj d dv dvduvv vdbdbuvn ubdvubidb",
                    color: AppColorPallete.whiteColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
