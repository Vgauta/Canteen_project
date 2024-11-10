import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/util/image_strings.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/core/widget/eleve_button.dart';
import 'package:canteen/core/widget/small_text.dart';
import 'package:canteen/core/widget/snack_bar_helper.dart';
import 'package:canteen/model/product_model.dart';
import 'package:canteen/model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../provider/order_product_provider.dart';

class OrderProductPage extends StatelessWidget {
  final ProductModel pdata;
  final int qty;
  const OrderProductPage({
    super.key,
    required this.pdata,
    required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<OrderProductProvider>(context, listen: false)
        .setWhenEnter(qty, pdata.productPrice);
    final userData = Get.find<UserDataModel>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
          child: Column(
            children: [
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 5),
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
                  const SizedBox(width: Dimensions.defualtWidthForSpace),
                  const BigText(
                    text: 'Order Product',
                    color: AppColorPallete.greenColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: AppColorPallete.whiteColor,
                  image: DecorationImage(
                    image: AssetImage(ImagePath.img),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: AppColorPallete.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: pdata.productName,
                      fontWeight: FontWeight.bold,
                    ),
                    SmallText(
                      text: pdata.productDescription,
                      color: AppColorPallete.greyColor,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 5),
                        SmallText(
                          text: '4.5',
                          size: 12,
                        ),
                        SizedBox(width: 5),
                        SmallText(
                          text: '(200 Reviews)',
                          size: 12,
                          color: AppColorPallete.greyColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        BigText(
                          text: "₹${pdata.productPrice.toString()}",
                          color: AppColorPallete.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Provider.of<OrderProductProvider>(context,
                                    listen: false)
                                .decrement(pdata.productPrice);
                          },
                          style: const ButtonStyle(
                            side: MaterialStatePropertyAll(
                              BorderSide(
                                color: AppColorPallete.primaryColor,
                              ),
                            ),
                            minimumSize: MaterialStatePropertyAll(
                              Size(10, 10),
                            ),
                          ),
                          icon: const Icon(
                            Icons.remove,
                            color: AppColorPallete.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Consumer<OrderProductProvider>(
                          builder: (context, value, child) {
                            return SmallText(
                              text: value.quantity.toString(),
                              fontWeight: FontWeight.bold,
                            );
                          },
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            Provider.of<OrderProductProvider>(context,
                                    listen: false)
                                .increment(pdata.productPrice);
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                AppColorPallete.primaryColor),
                            minimumSize: MaterialStatePropertyAll(
                              Size(10, 10),
                            ),
                          ),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: AppColorPallete.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const BigText(
                          text: "Address",
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: const SmallText(
                            text: "Edit ",
                            color: AppColorPallete.primaryColor,
                            size: 16,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColorPallete.primaryColor,
                        )
                      ],
                    ),
                    SmallText(
                      text: userData.address,
                      color: AppColorPallete.greyColor,
                      textOverflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              Container(
                height: 260,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: AppColorPallete.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Consumer<OrderProductProvider>(
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BigText(
                          text: "Order Total",
                          fontWeight: FontWeight.bold,
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SmallText(
                              text: "Order Quantity",
                              color: AppColorPallete.greyColor,
                            ),
                            SmallText(
                              text: value.quantity.toString(),
                              color: AppColorPallete.greyColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SmallText(
                              text: "Price",
                              color: AppColorPallete.greyColor,
                            ),
                            SmallText(
                              text: "₹${pdata.productPrice.toString()}",
                              color: AppColorPallete.primaryColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SmallText(
                              text: "Order Total",
                              color: AppColorPallete.greyColor,
                            ),
                            SmallText(
                              text:
                                  "${value.quantity} x ₹${pdata.productPrice.toString()}",
                              color: AppColorPallete.primaryColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SmallText(
                              text: "Delivery Charge",
                              color: AppColorPallete.greyColor,
                            ),
                            SmallText(
                              text: value.deliveryCharge.toString(),
                              color: AppColorPallete.greyColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SmallText(
                              text: "Tax and fees",
                              color: AppColorPallete.greyColor,
                            ),
                            SmallText(
                              text: value.taxAndFees.toString(),
                              color: AppColorPallete.greyColor,
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BigText(
                              text: "Total",
                              fontWeight: FontWeight.bold,
                            ),
                            BigText(
                              text: "₹${value.total.toString()}",
                              fontWeight: FontWeight.bold,
                              color: AppColorPallete.primaryColor,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              ElevatedButtonCustom(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: AppColorPallete.whiteColor,
                    builder: (context) {
                      return SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          padding:
                              const EdgeInsets.all(Dimensions.defaultPadding),
                          child: Column(
                            children: [
                              const BigText(
                                text: "Order",
                                color: AppColorPallete.greenColor,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                  height: Dimensions.defualtHeightForSpace),
                              Container(
                                height: 200,
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: AppColorPallete.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Consumer<OrderProductProvider>(
                                  builder: (context, value, child) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const BigText(
                                          text: "Order Summury",
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const Divider(),
                                        const SizedBox(
                                            height: Dimensions
                                                .defualtHeightForSpace),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SmallText(
                                              text: "Order Total",
                                              color:
                                                  AppColorPallete.primaryColor,
                                            ),
                                            SmallText(
                                              text: value.orderTotal.toString(),
                                              color:
                                                  AppColorPallete.primaryColor,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SmallText(
                                              text: "Delivery Charge",
                                              color: AppColorPallete.greyColor,
                                            ),
                                            SmallText(
                                              text: value.deliveryCharge
                                                  .toString(),
                                              color: AppColorPallete.greyColor,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SmallText(
                                              text: "Tax and fees",
                                              color: AppColorPallete.greyColor,
                                            ),
                                            SmallText(
                                              text: value.taxAndFees.toString(),
                                              color: AppColorPallete.greyColor,
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const BigText(
                                              text: "Total",
                                              fontWeight: FontWeight.bold,
                                            ),
                                            BigText(
                                              text: value.total.toString(),
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColorPallete.primaryColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                  height: Dimensions.defualtHeightForSpace),
                              Container(
                                height: 180,
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: AppColorPallete.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const BigText(
                                      text: "Payment",
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: 1,
                                          fillColor:
                                              const MaterialStatePropertyAll(
                                                  AppColorPallete.primaryColor),
                                          onChanged: (value) {},
                                        ),
                                        const SmallText(
                                          text: "Cash on Delivery",
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 2,
                                          groupValue: 1,
                                          fillColor:
                                              const MaterialStatePropertyAll(
                                                  AppColorPallete.primaryColor),
                                          onChanged: (value) {},
                                        ),
                                        const SmallText(
                                          text: "Online Payment",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  height: Dimensions.defualtHeightForSpace),
                              Consumer<OrderProductProvider>(
                                builder: (context, value, child) {
                                  return ElevatedButtonCustom(
                                    onPressed: () {
                                      value.orderProduct(pdata.productId).then(
                                            (value) => {
                                              if (value.status == true)
                                                {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const BigText(
                                                          text: "Order Placed",
                                                          color: AppColorPallete
                                                              .greenColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        content:
                                                            const SmallText(
                                                          text:
                                                              "Your order has been placed successfully",
                                                          color: AppColorPallete
                                                              .greyColor,
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child:
                                                                const SmallText(
                                                              text: "OK",
                                                              color: AppColorPallete
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                }
                                              else
                                                {
                                                  SnackBarHelper.showSnackBar(
                                                      context,
                                                      value.message,
                                                      true),
                                                }
                                            },
                                          );
                                      Navigator.pop(context);
                                    },
                                    color: AppColorPallete.primaryColor,
                                    child: const Row(
                                      children: [
                                        BigText(
                                          text: "Confirm Order",
                                          color: AppColorPallete.whiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColorPallete.whiteColor,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                color: AppColorPallete.primaryColor,
                child: const Row(
                  children: [
                    BigText(
                      text: "Order Now",
                      color: AppColorPallete.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColorPallete.whiteColor,
                    ),
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
