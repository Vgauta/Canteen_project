import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/core/widget/small_text.dart';
import 'package:canteen/features/auth/presentation/pages/welcome_page.dart';
import 'package:canteen/features/user-side/controller/product_controller.dart';
import 'package:canteen/features/user-side/pages/cart/cart_page.dart';
import 'package:canteen/features/user-side/pages/user-home/components/category_container.dart';
import 'package:canteen/features/user-side/pages/user-home/components/poster_container.dart';
import 'package:canteen/features/user-side/pages/user-home/components/prioritys_wise_products_show.dart';
import 'package:canteen/features/user-side/pages/user-home/provider/home_page_provider.dart';
import 'package:canteen/features/user-side/provider/cart_provider.dart';
import 'package:canteen/features/user-side/widgets/app_bar_user.dart';
import 'package:canteen/services/http_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/color_pallete.dart';
import '../../controller/cart_controller.dart';

class HomePageUser extends StatefulWidget {
  const HomePageUser({super.key});

  @override
  State<HomePageUser> createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  final homePageProvider = HomePageProvider();
  final service = Get.find<AuthServices>();
  final productControllerUser = Get.find<ProductControllerUser>();

  getProduct() async {
    await productControllerUser.getProducts();
    await productControllerUser.getOrderedProduct();
  }

  @override
  void initState() {
    super.initState();
    getProduct();
    Provider.of<CartProvider>(context, listen: false).getProductCount();
  }

  Future refresh() async {
    getProduct();
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: SafeArea(
          child: AppBarUser(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Badge(
              backgroundColor: AppColorPallete.primaryColor,
              label: Consumer<CartProvider>(
                builder: (context, value, child) {
                  return SmallText(
                    text: value.productCountInCart.toString(),
                    color: AppColorPallete.whiteColor,
                    size: 12,
                  );
                },
              ),
              child: const Icon(Icons.shopping_cart),
            ),
            label: "Cart",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: "Logout",
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          } else if (index == 2) {
            service.logOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => WelcomePage()),
                (route) => false);
          }
        },
      ),
      body: RefreshIndicator(
        onRefresh: () => refresh(),
        child: FutureBuilder(
          future: homePageProvider.getAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                physics: ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "What would you like to order",
                      color: AppColorPallete.primaryColor,
                      size: 32,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.visible,
                    ),
                    SizedBox(height: Dimensions.defualtHeightForSpace),
                    PosterContainer(),
                    SizedBox(height: Dimensions.defualtHeightForSpace),
                    Divider(),
                    BigText(
                      text: "Categorys",
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: Dimensions.defualtHeightForSpace),
                    CategoryContainer(),
                    SizedBox(height: Dimensions.defualtHeightForSpace),
                    PrioritysWiseProductsShow(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
