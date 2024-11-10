import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/util/constants.dart';
import '../../../../../core/widget/big_text.dart';
import '../../../../../core/widget/small_text.dart';
import '../../../../user-side/widgets/elevated_button_user.dart';
import '../../../provider/order_product_show_provider_admin.dart';

class OrderedProductListBuilderAdmin extends StatelessWidget {
  const OrderedProductListBuilderAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<OrderProductShowProviderAdmin>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.productData.orderedProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: Dimensions.defaultPadding),
                child: Container(
                  height: 300,
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
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: "Estimated Arrival",
                                  color: AppColorPallete.greyColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SmallText(
                                  text: "Now",
                                  color: AppColorPallete.greyColor,
                                ),
                               
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButtonCustomUser(
                              onPressed: () {},
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
