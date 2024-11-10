import 'package:canteen/core/util/constants.dart';
import 'package:canteen/features/admin-side/controller/product_controller.dart';
import 'package:canteen/features/admin-side/pages/orders_of_product/components/ordered_product_list_builder_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/color_pallete.dart';
import '../../../../core/widget/app_bar_widget.dart';
import '../../../../core/widget/big_text.dart';

class OrderShowPageAdmin extends StatefulWidget {
  const OrderShowPageAdmin({super.key});

  @override
  State<OrderShowPageAdmin> createState() => _OrderShowPageAdminState();
}

class _OrderShowPageAdminState extends State<OrderShowPageAdmin> {
  final productController = Get.find<ProductControllerAdmin>();
  @override
  void initState() {
    super.initState();
    productController.getOrderedProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 40),
        child: AppBarWidget(title: "All Orders"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        child: Column(
          children: [
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
            const OrderedProductListBuilderAdmin(),
          ],
        ),
      ),
    );
  }
}
