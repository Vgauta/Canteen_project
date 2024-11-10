import 'package:canteen/core/widget/snack_bar_helper.dart';
import 'package:canteen/features/admin-side/pages/orders_of_product/orders_page.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/components/add-component/add_category_and_sub_category.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/components/add-component/add_coupon_page.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/components/add-component/add_poster_page.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/components/add-component/add_product_page.dart';
import 'package:canteen/features/auth/presentation/pages/welcome_page.dart';
import 'package:canteen/services/http_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../features/admin-side/pages/product/presentation/components/edit-component/edit_posters_and_coupon_list_page.dart';
import '../provider/drawer_provider.dart';
import '../theme/color_pallete.dart';
import '../util/constants.dart';
import 'big_text.dart';
import 'small_text.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(
      builder: (context, value, child) {
        return Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "Meet Patel"),
                            SmallText(text: "Admin"),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(height: Dimensions.defualtHeightForSpace),
                ListTile(
                  title: const SmallText(
                    text: "Dashboard",
                    textAlign: TextAlign.left,
                    size: 16,
                  ),
                  leading: const Icon(Icons.dashboard),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.menu_book_outlined),
                  tileColor: value.isItemDrawerMenusOpen
                      ? AppColorPallete.primaryColor
                      : null,
                  title: const SmallText(
                    text: "Menus",
                    textAlign: TextAlign.left,
                    size: 16,
                  ),
                  onTap: () {
                    value.toggleItemDrawer(
                        !value.isItemDrawerMenusOpen, "Menus");
                  },
                ),
                value.isItemDrawerMenusOpen
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.linear,
                        color: value.isItemDrawerMenusOpen
                            ? AppColorPallete.orangeColorWitgOpeDarkMode
                            : null,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.food_bank),
                              title: const SmallText(
                                text: "Products",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.category),
                              title: const SmallText(
                                text: "Categories",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.category_outlined),
                              title: const SmallText(
                                text: "Sub Categories",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  tileColor: value.isItemDrawerOrdersOpen
                      ? AppColorPallete.primaryColor
                      : null,
                  title: const SmallText(
                    text: "Orders",
                    textAlign: TextAlign.left,
                    size: 16,
                  ),
                  onTap: () {
                    value.toggleItemDrawer(
                        !value.isItemDrawerOrdersOpen, "Orders");
                  },
                ),
                value.isItemDrawerOrdersOpen
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.linear,
                        color: value.isItemDrawerOrdersOpen
                            ? AppColorPallete.orangeColorWitgOpeDarkMode
                            : null,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.pending_actions),
                              title: const SmallText(
                                text: "Pending Orders",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OrdersPage(
                                        orderStatus: "Pending"),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.local_shipping_rounded,
                              ),
                              title: const SmallText(
                                text: "Served Orders",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OrdersPage(
                                        orderStatus: "Pending"),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.shopping_cart_outlined,
                              ),
                              title: const SmallText(
                                text: "Total Orders",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                ListTile(
                  title: const SmallText(
                    text: "Edit",
                    textAlign: TextAlign.left,
                    size: 16,
                  ),
                  tileColor: value.isItemDrawerEditsOpen
                      ? AppColorPallete.primaryColor
                      : null,
                  leading: const Icon(Icons.edit),
                  onTap: () {
                    value.toggleItemDrawer(
                        !value.isItemDrawerEditsOpen, "Edit");
                  },
                ),
                value.isItemDrawerEditsOpen
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.linear,
                        color: value.isItemDrawerEditsOpen
                            ? AppColorPallete.orangeColorWitgOpeDarkMode
                            : null,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.edit_attributes),
                              title: const SmallText(
                                text: "Edit Products",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.category,
                              ),
                              title: const SmallText(
                                text: "Edit Categorys",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.category_outlined,
                              ),
                              title: const SmallText(
                                text: "Edit Sub Categorys",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.post_add,
                              ),
                              title: const SmallText(
                                text: "Edit Posters",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PosterAndCouponsPage(
                                                isPoster: true)));
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.card_giftcard,
                              ),
                              title: const SmallText(
                                text: "Edit coupon",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PosterAndCouponsPage(
                                                isPoster: false)));
                              },
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                ListTile(
                  title: const SmallText(
                    text: "Add",
                    textAlign: TextAlign.left,
                    size: 16,
                  ),
                  tileColor: value.isItemDrawerAddOpen
                      ? AppColorPallete.primaryColor
                      : null,
                  leading: const Icon(Icons.add),
                  onTap: () {
                    value.toggleItemDrawer(!value.isItemDrawerAddOpen, "Add");
                  },
                ),
                value.isItemDrawerAddOpen
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.linear,
                        color: value.isItemDrawerAddOpen
                            ? AppColorPallete.orangeColorWitgOpeDarkMode
                            : null,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.edit_attributes),
                              title: const SmallText(
                                text: "Add Products",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddProductPage(
                                                productId: '')));
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.category,
                              ),
                              title: const SmallText(
                                text: "Add Categorys",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddAndEditCategorysAndSubCategorys(
                                            addId: 'Category', editId: ''),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.category_outlined,
                              ),
                              title: const SmallText(
                                text: "Add Sub Categorys",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddAndEditCategorysAndSubCategorys(
                                            addId: 'Sub Category', editId: ''),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.post_add,
                              ),
                              title: const SmallText(
                                text: "Add Posters",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddAndEditPosterPage(
                                                posterId: '')));
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.card_giftcard,
                              ),
                              title: const SmallText(
                                text: "Add coupon",
                                textAlign: TextAlign.left,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddAndEditCouponPage(
                                                couponId: '')));
                              },
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                ListTile(
                  title: const SmallText(
                    text: "Customer",
                    textAlign: TextAlign.left,
                    size: 16,
                  ),
                  leading: const Icon(Icons.person),
                  onTap: () {},
                ),
                ListTile(
                  title: const SmallText(
                    text: "Settings",
                    textAlign: TextAlign.left,
                    size: 16,
                  ),
                  leading: const Icon(Icons.settings),
                  onTap: () {},
                ),
                ListTile(
                  title: const SmallText(
                    text: "Log Out",
                    textAlign: TextAlign.left,
                    size: 16,
                  ),
                  leading: const Icon(Icons.logout_outlined),
                  onTap: () {
                    final service = Get.find<AuthServices>();
                    service.logOut().then(
                          (value) => {
                            if (value == true)
                              {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WelcomePage()),
                                    (route) => false)
                              }
                            else
                              {
                                SnackBarHelper.showSnackBar(
                                    context, "Something went wrong!", true)
                              }
                          },
                        );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
