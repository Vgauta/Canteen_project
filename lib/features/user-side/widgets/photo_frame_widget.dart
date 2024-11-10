import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/core/widget/small_text.dart';
import 'package:flutter/material.dart';

class PhotoFrameWidget extends StatelessWidget {
  final String image;
  final String title;
  final int subCategoryLength;
  const PhotoFrameWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subCategoryLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 1,
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
                const SizedBox(
                  width: Dimensions.defualtWidthForSpace,
                ),
                BigText(
                  text: title,
                  color: AppColorPallete.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: SmallText(
              text: "${subCategoryLength.toString()} Types Of Sub Categorys",
              color: AppColorPallete.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
