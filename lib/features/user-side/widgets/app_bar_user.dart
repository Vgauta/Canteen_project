import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/features/user-side/pages/order-product/order_show_page.dart';
import 'package:flutter/material.dart';

import '../../../core/util/image_strings.dart';
import '../../../core/widget/small_text.dart';

class AppBarUser extends StatelessWidget {
  const AppBarUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 15,
                  offset: const Offset(6, 9),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallText(
                text: 'Diliver to',
                color: AppColorPallete.greyColor,
                size: 12,
              ),
              SmallText(
                text: "address",
                color: AppColorPallete.primaryColor,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrdersShowPage()));
            },
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 15,
                    offset: const Offset(6, 9),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.list_alt,
                color: AppColorPallete.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
