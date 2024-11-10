import 'package:canteen/features/user-side/data/product_data.dart';
import 'package:canteen/features/user-side/pages/user-home/provider/home_page_provider.dart';
import 'package:canteen/features/user-side/pages/user-product/product_list_categorys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/widget/small_text.dart';
import '../../user-product/provider/producr_list_categoory_provider.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Consumer<HomePageProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.productData.categorys.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Provider.of<ProductListCategoryProvider>(context,
                            listen: false)
                        .productList
                        .clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductListCategoryWise(
                          categoryName: value
                              .productData.categorys[index].categoryNameMain,
                          categoryImage:
                              value.productData.categorys[index].image,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 90,
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
                      children: [
                        Container(
                          height: 65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                value.productData.categorys[index].image,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        SmallText(
                          text: value
                              .productData.categorys[index].categoryNameMain,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
