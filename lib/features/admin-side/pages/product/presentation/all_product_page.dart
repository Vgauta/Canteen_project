import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/widget/eleve_button.dart';
import 'package:canteen/core/widget/small_text.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/components/add-component/add_product_page.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/product_list_provider.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/big_text.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProductListProvider>(context, listen: false);
    provider.getHeader("categorys");
    provider.setDataZerothIndex("categorys", provider.cate[0].categoryNameMain);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 40),
        child: AppBarWidget(title: "Products"),
      ),
      body: Column(
        children: [
          const SizedBox(height: Dimensions.defualtHeightForSpace),
          SizedBox(
            height: 30,
            child: Consumer<ProductListProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.cate.length,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.defaultPadding),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.defaultPadding),
                      child: InkWell(
                        onTap: () {
                          value.setData(index, "categorys",
                              value.cate[index].categoryNameMain);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: value.indexPage == index
                                ? const Border(
                                    bottom: BorderSide(
                                      color: AppColorPallete.primaryColor,
                                      width: 3,
                                    ),
                                  )
                                : null,
                          ),
                          child: SmallText(
                              text: value.cate[index].categoryNameMain),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: Dimensions.defualtHeightForSpace),
          Expanded(child: Consumer<ProductListProvider>(
            builder: (context, value, child) {
              return FutureBuilder(
                future: Provider.of<ProductProvider>(context).getProduct(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: value.products.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.defaultPadding),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: BigText(
                              text: value.products[index].priorityOfFood,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 315,
                            child: ListView.builder(
                              itemCount: value.products.length,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColorPallete.whiteColor),
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.060),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 160,
                                            width: double.infinity,
                                            padding: const EdgeInsets.only(
                                              right: Dimensions.defaultPadding,
                                              top: Dimensions.defaultPadding,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                image: NetworkImage(value
                                                    .products[index]
                                                    .productImageString),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    ),
                                                    SizedBox(width: 3),
                                                    SmallText(
                                                      text: "4.5",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: SmallText(
                                                      text: value
                                                          .products[index]
                                                          .productName,
                                                      textAlign: TextAlign.left,
                                                      size: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SmallText(
                                                        text:
                                                            "₹${value.products[index].productPrice}",
                                                      ),
                                                      const Spacer(),
                                                      SmallText(
                                                        text: value
                                                            .products[index]
                                                            .productQuantity,
                                                        color: AppColorPallete
                                                            .greyColor,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5),
                                                  ElevatedButtonCustom(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => AddProductPage(
                                                                  productId: value
                                                                      .products[
                                                                          index]
                                                                      .productId)));
                                                    },
                                                    color: AppColorPallete
                                                        .primaryColor,
                                                    borderColor: AppColorPallete
                                                        .primaryColor,
                                                    child: const Row(
                                                      children: [
                                                        SmallText(
                                                            text:
                                                                "Edit Product"),
                                                        Spacer(),
                                                        Icon(Icons.edit),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          size: 18,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
