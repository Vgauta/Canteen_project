import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/features/admin-side/provider/order_product_show_provider_admin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/util/constants.dart';
import '../widgets/dashboard_card_widget.dart';

class AnalyticsSection extends StatelessWidget {
  AnalyticsSection({super.key});

  final value = Get.find<ProductDataAdmin>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 120,
          crossAxisSpacing: Dimensions.defaultPadding,
          mainAxisSpacing: Dimensions.defaultPadding,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CardWidget(
            title: "Total Orders",
            value: value.orders.length.toString(),
            icon: Icons.shopping_cart,
          ),
          CardWidget(
            title: "Total Served",
            value: value.ordersServed.length.toString(),
            icon: FontAwesomeIcons.truck,
          ),
          CardWidget(
            title: "Total Pending",
            value: value.ordersPending.length.toString(),
            icon: Icons.pending_actions_outlined,
          ),
          CardWidget(
            title: "Total Income",
            value: value.totalIncome.toString(),
            icon: Icons.currency_rupee,
          ),
        ],
      ),
    );
  }
}
