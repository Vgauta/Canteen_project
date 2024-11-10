import 'package:canteen/core/widget/snack_bar_helper.dart';
import 'package:canteen/features/user-side/pages/order-product/provider/order_show_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/util/constants.dart';
import '../../../../../core/util/image_strings.dart';
import '../../../../../core/widget/big_text.dart';
import '../../../../../core/widget/small_text.dart';
import '../../../widgets/elevated_button_user.dart';

class OrderedProductListBuilder extends StatelessWidget {
  const OrderedProductListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<OrderShowProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.productData.orderedProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: Dimensions.defaultPadding),
                child: Container(
                  height: 310,
                  width: double.infinity,
                  padding: const EdgeInsets.all(Dimensions.defaultPadding),
                  decoration: BoxDecoration(
                    color: AppColorPallete.whiteColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColorPallete.whiteColor,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColorPallete.greyColor200,
                        blurRadius: 10,
                        offset: Offset(8, 15),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: AppColorPallete.whiteColor,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(value.productData
                                    .orderedProducts[index].productImageString),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColorPallete.greyColor200,
                                  blurRadius: 10,
                                  offset: Offset(8, 15),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                              width: Dimensions.defualtWidthForSpace),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: BigText(
                                    text: "#11111",
                                    color: AppColorPallete.primaryColor,
                                  ),
                                ),
                                SmallText(
                                  text:
                                      "${value.productData.orders[index].orderQuantity} Items",
                                  color: AppColorPallete.greyColor,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(
                                      text: value.productData
                                          .orderedProducts[index].productName,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    BigText(
                                      text:
                                          "₹${value.productData.orders[index].orderTotal.toString()}",
                                      color: AppColorPallete.primaryColor,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimensions.defualtHeightForSpace),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: "Estimated Arrival",
                                  color: AppColorPallete.greyColor,
                                ),
                                Row(
                                  children: [
                                    BigText(
                                      text: "25",
                                      fontWeight: FontWeight.bold,
                                      size: 35,
                                    ),
                                    SizedBox(width: 4),
                                    SizedBox(
                                      height: 30,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: SmallText(
                                          text: "min",
                                          size: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SmallText(
                                  text: "Now",
                                  color: AppColorPallete.greyColor,
                                ),
                                BigText(
                                  text: value
                                      .productData.orders[index].orderStatus,
                                  size: 16,
                                  color: value.productData.orders[index]
                                              .orderStatus !=
                                          "Pending"
                                      ? value.productData.orders[index]
                                                  .orderStatus ==
                                              "Accepted"
                                          ? AppColorPallete.greenColor
                                          : AppColorPallete.greyColor
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButtonCustomUser(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const BigText(
                                        text: "Cancel Order",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const BigText(
                                            text:
                                                "Are you sure you want to cancel this order?",
                                            textOverflow: TextOverflow.visible,
                                          ),
                                          const SizedBox(
                                              height: Dimensions
                                                  .defualtHeightForSpace),
                                          ElevatedButtonCustomUser(
                                            onPressed: () {
                                              value
                                                  .deleteFromOreders(
                                                      value
                                                          .productData
                                                          .orders[index]
                                                          .orderId,
                                                      value
                                                          .productData
                                                          .orders[index]
                                                          .productId)
                                                  .then(
                                                    (value) => {
                                                      if (value.status == true)
                                                        {
                                                          Navigator.pop(
                                                              context),
                                                          SnackBarHelper
                                                              .showSnackBar(
                                                                  context,
                                                                  value.message,
                                                                  false)
                                                        }
                                                      else
                                                        {
                                                          SnackBarHelper
                                                              .showSnackBar(
                                                                  context,
                                                                  value.message,
                                                                  true)
                                                        }
                                                    },
                                                  );
                                            },
                                            color: Colors.red,
                                            child: const Center(
                                              child: BigText(
                                                text: "Yes",
                                                color:
                                                    AppColorPallete.whiteColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Center(
                                child: BigText(
                                  text: "Cancel",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: Dimensions.defualtWidthForSpace),
                          const Expanded(
                            child: ElevatedButtonCustomUser(
                              color: AppColorPallete.primaryColor,
                              shadowColor: AppColorPallete.primaryColor50,
                              blurRadius: 20,
                              offset: Offset(0, 10),
                              child: Center(
                                child: BigText(
                                  text: "Show Details",
                                  color: AppColorPallete.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: value.productData.orders[index].orderDate
                                .substring(0, 10),
                            color: AppColorPallete.greyColor,
                          ),
                          SmallText(
                            text: value.productData.orders[index].orderTime
                                .substring(11, 19),
                            color: AppColorPallete.greyColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
