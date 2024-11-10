import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/features/admin-side/provider/order_product_show_provider_admin.dart';
import 'package:canteen/features/user-side/pages/order-product/provider/order_show_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/util/constants.dart';
import '../../../../../../core/widget/big_text.dart';
import '../../../../../../core/widget/custome_container.dart';
import '../../../../../../core/widget/small_text.dart';

class RecentOrderContainer extends StatelessWidget {
  RecentOrderContainer({
    super.key,
  });

  final value = Get.find<ProductDataAdmin>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      padding: const EdgeInsets.all(Dimensions.defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: Constants.boxShadow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BigText(text: "Recent Orders"),
          const SizedBox(height: 10),
          const CustomeContainer(
            height: 40,
            width: double.infinity,
            color: Color.fromARGB(143, 76, 175, 79),
            borderColor: Color(0xff2bc155),
            isShadowOn: false,
            child: Row(
              children: [
                Expanded(
                  child: SmallText(
                    text: "Order ID",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SmallText(
                    text: "Customer",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SmallText(
                    text: "Date",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SmallText(
                    text: "Status",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: value.orders.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: SmallText(
                          text: value.orders[index].orderId,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: SmallText(
                          text: value.orders[index].userFullName!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: SmallText(
                          text: value.orders[index].orderDate.substring(0, 10),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: SmallText(
                          text: value.orders[index].orderStatus,
                          textAlign: TextAlign.center,
                          color: value.orders[index].orderStatus == "Pending"
                              ? Colors.red
                              : value.orders[index].orderStatus == "Served"
                                  ? Colors.green
                                  : Colors.blue,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
