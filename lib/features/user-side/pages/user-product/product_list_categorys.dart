import 'package:canteen/core/util/constants.dart';
import 'package:canteen/features/user-side/pages/user-product/component/category_list_builder_widget.dart';
import 'package:canteen/features/user-side/widgets/photo_frame_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/color_pallete.dart';
import '../../../../core/widget/big_text.dart';
import '../../../../core/widget/small_text.dart';
import 'product_details_page.dart';
import 'provider/producr_list_categoory_provider.dart';

class ProductListCategoryWise extends StatefulWidget {
  final String categoryName;
  final String categoryImage;
  const ProductListCategoryWise(
      {super.key, required this.categoryImage, required this.categoryName});

  @override
  State<ProductListCategoryWise> createState() =>
      _ProductListCategoryWiseState();
}

class _ProductListCategoryWiseState extends State<ProductListCategoryWise> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductListCategoryProvider>(context, listen: false)
        .setSubCategory(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              PhotoFrameWidget(
                image: widget.categoryImage,
                title: widget.categoryName,
                subCategoryLength: 1,
              ),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              const Divider(),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              ListBuilderCategory(
                cateName: widget.categoryName,
              ),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              Consumer<ProductListCategoryProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.productList.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.defaultPadding),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(
                                  pdata: value.productList[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 280,
                            decoration: BoxDecoration(
                              color: AppColorPallete.whiteColor.withOpacity(.6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.060),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 200,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: Dimensions.defaultPadding,
                                        vertical: Dimensions.defaultPadding + 5,
                                      ),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            value.productList[index]
                                                .productImageString,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 100,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColorPallete.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: BigText(
                                              text:
                                                  "₹${value.productList[index].productPrice.toDouble()}",
                                              color:
                                                  AppColorPallete.primaryColor,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColorPallete.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.add_shopping_cart,
                                                color: AppColorPallete
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 170,
                                      left: Dimensions.defaultPadding,
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColorPallete.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.060),
                                                spreadRadius: 5,
                                                blurRadius: 10,
                                                offset: const Offset(0, 3),
                                              ),
                                            ]),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 25,
                                            ),
                                            SizedBox(width: 3),
                                            SmallText(
                                              text: '4.5',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(width: 3),
                                            SmallText(
                                              text: "(20+)",
                                              color: AppColorPallete.greyColor,
                                              size: 13,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: Dimensions.defualtHeightForSpace,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.defaultPadding,
                                  ),
                                  child: BigText(
                                    text: value.productList[index].productName,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.defaultPadding,
                                  ),
                                  child: SmallText(
                                    text: value
                                        .productList[index].productDescription,
                                    color: AppColorPallete.greyColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
