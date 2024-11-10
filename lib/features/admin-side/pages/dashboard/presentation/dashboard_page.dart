import 'package:canteen/features/admin-side/controller/product_controller.dart';
import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/features/admin-side/pages/dashboard/presentation/provider/product_provider.dart';
import 'package:canteen/features/admin-side/pages/orders_of_product/orders_show_page_admin.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/all_product_page.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/product_list_page.dart';
import 'package:canteen/features/user-side/pages/order-product/order_show_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/util/constants.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/big_text.dart';
import '../../../../../core/widget/bottom_navigation_bar_custome.dart';
import '../../../../../core/widget/custome_container.dart';
import '../../../../../core/widget/drawer_custome.dart';
import '../../../../../core/widget/small_text.dart';
import '../../product/presentation/components/add-component/add_product_page.dart';
import 'components/analytics_section.dart';
import 'components/product_container.dart';
import 'components/recent_order_container.dart';
import 'components/revenue_container.dart';
import 'widgets/dashboard_card_widget.dart';
import 'widgets/eleve_widget.dart';
import 'package:flutter/material.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  final productControllerAdmin = Get.find<ProductControllerAdmin>();
  final productDataAdmin = Get.find<ProductDataAdmin>();

  get() async {
    await productControllerAdmin.getAll();
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  Future refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar widget
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 40),
        child: AppBarWidget(
          title: "Dashboard",
        ),
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: const BottomNavigationBarCustome(),
      floatingActionButton: CircleAvatar(
        backgroundColor: AppColorPallete.primaryColor,
        radius: 30,
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductPage(
                  productId: '',
                ),
              ),
            );
          },
          icon: const Icon(Icons.add),
          color: Colors.white,
          iconSize: 30,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => refresh(),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
          child: FutureBuilder(
            future: productControllerAdmin.getAll(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  //AnalyticsSection

                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  const BigText(text: "Welcome, Meet"),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  AnalyticsSection(),

                  //AnalyticsSection
                  Divider(
                    thickness: 2,
                    color: Theme.of(context).dividerColor,
                  ),

                  //RecentOrderContainer

                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  RecentOrderContainer(),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),

                  //RecentOrderContainer

                  ElevatedButtonCustomeDashboard(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderShowPageAdmin()));
                    },
                    value: productControllerAdmin.productData.orders.length
                        .toString(),
                    title: "Orders",
                    containerColor: AppColorPallete.colorGreenWithope,
                    color: AppColorPallete.greenColor,
                  ), //button custome widget

                  //RevenueContainer

                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  const RevenueContainer(),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),

                  //RevenueContainer

                  Divider(
                    thickness: 2,
                    color: Theme.of(context).dividerColor,
                  ),

                  //ProductContainer

                  const SizedBox(height: Dimensions.defualtHeightForSpace),

                  ProductContainer(),

                  const SizedBox(height: Dimensions.defualtHeightForSpace),

                  const SizedBox(height: Dimensions.defualtHeightForSpace),

                  //ProductContainer
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
