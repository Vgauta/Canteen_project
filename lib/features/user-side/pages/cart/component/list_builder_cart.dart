import 'package:canteen/core/widget/snack_bar_helper.dart';
import 'package:canteen/features/user-side/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/util/constants.dart';
import '../../../../../core/util/image_strings.dart';
import '../../../../../core/widget/big_text.dart';
import '../../../../../core/widget/small_text.dart';

class ListBuilderCartPage extends StatelessWidget {
  const ListBuilderCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.productData.cartProducts.length,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimensions.defaultPadding,
              ),
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            30,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColorPallete.greyColor.withOpacity(0.5),
                            spreadRadius: 0.1,
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                          )
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            value.productData.cartProducts[index]
                                .productImageString,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: double.infinity,
                      width: 210,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              BigText(
                                text: value.productData.cartProducts[index]
                                    .productName,
                                fontWeight: FontWeight.bold,
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  value
                                      .removeProductFromCart(value.productData
                                          .cartProducts[index].productId)
                                      .then(
                                        (value) => {
                                          if (value.status == true)
                                            {
                                              SnackBarHelper.showSnackBar(
                                                  context,
                                                  value.message,
                                                  false),
                                            }
                                          else
                                            {
                                              SnackBarHelper.showSnackBar(
                                                  context, value.message, true),
                                            }
                                        },
                                      );
                                },
                                child: const Icon(
                                  Icons.delete,
                                  size: 22,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          SmallText(
                            text: value.productData.cartProducts[index]
                                .productDescription,
                            color: AppColorPallete.greyColor,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              BigText(
                                text: value.productData.cartProducts[index]
                                    .cartProductPrice
                                    .toString(),
                                color: AppColorPallete.primaryColor,
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  value.addAndMinusCounter("minus", index);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColorPallete.primaryColor,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: AppColorPallete.primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SmallText(
                                text: value.productData.cart[index].qty
                                    .toString(),
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  value.addAndMinusCounter("add", index);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColorPallete.primaryColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColorPallete.primaryColor50,
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ]),
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColorPallete.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
