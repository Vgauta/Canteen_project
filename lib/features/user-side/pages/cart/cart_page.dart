import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/core/widget/eleve_button.dart';
import 'package:canteen/features/user-side/pages/cart/component/list_builder_cart.dart';
import 'package:canteen/features/user-side/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimensions.defualtWidthForSpace),
                  const BigText(text: "Your Cart")
                ],
              ),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              const ListBuilderCartPage(),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              Consumer<CartProvider>(
                builder: (context, value, child) {
                  value.addWhenEnter();
                  return Column(
                    children: [
                      ListTile(
                        leading: const BigText(
                          text: "Sub Total",
                          fontWeight: FontWeight.bold,
                        ),
                        trailing: BigText(
                          text: value.subTotal.toString(),
                          color: AppColorPallete.primaryColor,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const BigText(
                          text: "Tax and Fees",
                          fontWeight: FontWeight.bold,
                        ),
                        trailing: BigText(
                          text: value.taxAndFees.toString(),
                          color: AppColorPallete.primaryColor,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const BigText(
                          text: "Dilivery",
                          fontWeight: FontWeight.bold,
                        ),
                        trailing: BigText(
                          text: value.dilivery.toString(),
                          color: AppColorPallete.primaryColor,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const BigText(
                          text: "Total",
                          fontWeight: FontWeight.bold,
                        ),
                        trailing: BigText(
                          text: value.total.toString(),
                          color: AppColorPallete.primaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const ElevatedButtonCustom(
                color: AppColorPallete.primaryColor,
                child: Row(
                  children: [
                    BigText(
                      text: "Checkout",
                      color: Colors.white,
                      size: 15,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
