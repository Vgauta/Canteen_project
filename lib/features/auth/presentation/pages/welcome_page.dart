import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPallete.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                // height: ,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColorPallete.whiteColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: const SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.defualtHeightForSpace),
                      BigText(
                        text: "Welcome to Canteen",
                        color: AppColorPallete.primaryColor,
                        fontWeight: FontWeight.bold,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: BigText(
                text: "Welcome to Canteen",
                color: AppColorPallete.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
