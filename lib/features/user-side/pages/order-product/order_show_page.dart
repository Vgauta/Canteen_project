import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/util/image_strings.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/core/widget/small_text.dart';
import 'package:canteen/features/user-side/pages/order-product/components/ordered_product_list_builder.dart';
import 'package:canteen/features/user-side/widgets/elevated_button_user.dart';
import 'package:canteen/features/user-side/widgets/title_bar_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';

class OrdersShowPage extends StatefulWidget {
  const OrdersShowPage({super.key});

  @override
  State<OrdersShowPage> createState() => _OrdersShowPageState();
}

class _OrdersShowPageState extends State<OrdersShowPage> {
  final productController = Get.find<ProductControllerUser>();
  getOrders() async {
    await productController.getOrderedProduct();
  }

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  Future refresh() async {
    await Future.delayed(const Duration(seconds: 1), () {
      productController.getOrderedProduct();
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
          child: RefreshIndicator(
            onRefresh: refresh,
            child: Column(
              children: [
                const SizedBox(height: Dimensions.defualtHeightForSpace),
                const TitleBarWidget(
                  title: "My Orders",
                ),
                const SizedBox(height: Dimensions.defualtHeightForSpace),
                Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColorPallete.greyColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColorPallete.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: BigText(
                              text: "Upcoming",
                              color: AppColorPallete.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            // color: AppColorPallete.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: BigText(
                              text: "History",
                              color: AppColorPallete.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Dimensions.defualtHeightForSpace),
                const OrderedProductListBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
