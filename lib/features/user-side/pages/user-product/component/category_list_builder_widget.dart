import 'package:canteen/features/user-side/pages/user-product/provider/producr_list_categoory_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/widget/small_text.dart';

class ListBuilderCategory extends StatelessWidget {
  final String cateName;
  const ListBuilderCategory({
    super.key,
    required this.cateName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Consumer<ProductListCategoryProvider>(
        builder: (context, value, child) {
          value.setSubCategory(cateName);
          return ListView.builder(
            itemCount: value.subCategoryList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    value.setData(
                      value.subCategoryList[index].subCategory,
                      index,
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
                      border: value.index == index
                          ? Border.all(
                              color: AppColorPallete.primaryColor,
                              width: 2,
                            )
                          : null,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                value.subCategoryList[index].image,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        SmallText(
                          text: value.subCategoryList[index].subCategory,
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
