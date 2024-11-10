import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/core/widget/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/widget/app_bar_widget.dart';

class OrdersPage extends StatelessWidget {
  final String orderStatus;
  const OrdersPage({
    super.key,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 40),
        child: AppBarWidget(title: "$orderStatus Orders"),
      ),
      body: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPadding,
          vertical: Dimensions.defaultPadding,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: Dimensions.defaultPadding),
            child: Column(
              children: [
                Row(  
                  children: [
                    BigText(text: "Meet Senjaliya"),
                    SmallText(
                      text: "#1111",
                      color: AppColorPallete.primaryColor,
                    ),
                    
                  ],
                ),
                Row(
                  children: [
                    BigText(text: "Burger"),
                  ],
                ),
                const SizedBox(height: Dimensions.defaultPadding),
              ],
            ),
          );
        },
      ),
    );
  }
}
