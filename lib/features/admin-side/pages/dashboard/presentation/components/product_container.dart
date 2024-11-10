import 'package:canteen/features/admin-side/controller/product_controller.dart';
import 'package:canteen/features/admin-side/pages/dashboard/presentation/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/theme/color_pallete.dart';
import '../../../../../../core/util/constants.dart';
import '../../../../../../core/widget/big_text.dart';
import '../../../../../../core/widget/custome_container.dart';
import '../../../../../../core/widget/small_text.dart';
import '../../../../../../model/product_model.dart';
import '../../../product/presentation/all_product_page.dart';
import '../../../product/presentation/product_list_page.dart';
import '../widgets/dashboard_card_widget.dart';
import '../widgets/eleve_widget.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProductProvider>(context);
    return Consumer<DashboardProductProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            CustomeContainer(
              height: 350,
              borderColor: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BigText(text: "Products"),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  CustomeContainer(
                    color: Theme.of(context).scaffoldBackgroundColor ==
                            AppColorPallete.backgroundColor
                        ? AppColorPallete.orangeColorWitgOpeDarkMode
                        : AppColorPallete.orangeColorWitgOpeLightMode,
                    isShadowOn: false,
                    borderColor: AppColorPallete.primaryColor,
                    child: const Row(
                      children: [
                        Expanded(
                          child: SmallText(
                            text: "Name",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: SmallText(
                            text: "Category",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: SmallText(
                            text: "Price",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: SmallText(
                            text: "Stock",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.productData.products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 40,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: SmallText(
                                    text: value.productData.products[index]
                                        .productName),
                              ),
                              Expanded(
                                child: SmallText(
                                    text: value.productData.products[index]
                                        .productCategory),
                              ),
                              Expanded(
                                child: SmallText(
                                    text: value.productData.products[index]
                                        .productPrice
                                        .toString()),
                              ),
                              Expanded(
                                child: SmallText(
                                    text: value.productData.products[index]
                                        .productStock),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimensions.defualtHeightForSpace),

            ElevatedButtonCustomeDashboard(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllProductPage()));
                },
                value: value.productData.products.length.toString(),
                title: "Product",
                color: AppColorPallete.primaryColor,
                containerColor: Theme.of(context).scaffoldBackgroundColor ==
                        AppColorPallete.backgroundColor
                    ? AppColorPallete.orangeColorWitgOpeDarkMode
                    : AppColorPallete
                        .orangeColorWitgOpeLightMode), //button custome widget
            const SizedBox(height: Dimensions.defualtHeightForSpace),

            CustomeContainer(
              height: 330,
              borderColor: Colors.transparent,
              child: Column(
                children: [
                  CardWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProductList(pageId: "menu")));
                    },
                    title: "Total Menus",
                    value: provider.productData.menus.length.toString(),
                    icon: Icons.menu_book_sharp,
                    borderColor: AppColorPallete.primaryColor,
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  Row(
                    children: [
                      Expanded(
                        child: CardWidget(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllProductPage()));
                            },
                            title: "Total Products",
                            value: value.productData.products.length.toString(),
                            icon: Icons.food_bank,
                            borderColor: AppColorPallete.primaryColor),
                      ),
                      const SizedBox(width: Dimensions.defualtWidthForSpace),
                      Expanded(
                        child: CardWidget(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductList(
                                        pageId: "categorys")));
                          },
                          title: "Total Categorys",
                          value:
                              provider.productData.categorys.length.toString(),
                          icon: Icons.category,
                          borderColor: AppColorPallete.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  Row(
                    children: [
                      Expanded(
                        child: CardWidget(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ProductList(
                                          pageId: "prioritys")));
                            },
                            title: "Total Prioritys",
                            value: provider.productData.prioritys.length
                                .toString(),
                            icon: Icons.type_specimen,
                            borderColor: AppColorPallete.primaryColor),
                      ),
                      const SizedBox(width: Dimensions.defualtWidthForSpace),
                      Expanded(
                        child: CardWidget(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductList(
                                        pageId: "subCategorys")));
                          },
                          title: "Total Sub Categorys",
                          value: provider.productData.subCategorys.length
                              .toString(),
                          icon: Icons.category_outlined,
                          borderColor: AppColorPallete.primaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
