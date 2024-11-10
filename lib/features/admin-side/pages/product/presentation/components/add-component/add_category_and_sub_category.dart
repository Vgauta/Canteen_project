import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/widget/app_bar_widget.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/core/widget/eleve_button.dart';
import 'package:canteen/core/widget/snack_bar_helper.dart';
import 'package:canteen/core/widget/txt_field.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/add_edit_component_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/theme/color_pallete.dart';

class AddAndEditCategorysAndSubCategorys extends StatelessWidget {
  final String addId;
  final String editId;
  const AddAndEditCategorysAndSubCategorys({
    super.key,
    required this.addId,
    required this.editId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: SafeArea(
          child: AppBarWidget(
            title: "Add $addId",
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        child: Consumer<AddAndEditComponentProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                GestureDetector(
                  onTap: value.pickImage,
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor ==
                                AppColorPallete.backgroundColor
                            ? AppColorPallete.backgroundColor
                            : AppColorPallete.greyColor200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColorPallete.greyColor200,
                        ),
                        image: value.base64Image.isNotEmpty
                            ? DecorationImage(
                                image: MemoryImage(
                                  value.image!,
                                ),
                                fit: BoxFit.cover,
                              )
                            : null),
                    child: Center(
                      child: (value.base64Image.isEmpty)
                          ? const Icon(
                              Icons.add_a_photo_outlined,
                              size: 30,
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.defualtHeightForSpace),
                Form(
                  key: value.formKey,
                  child: Column(
                    children: [
                      addId == "Category"
                          ? TxtField(
                              hintText: "Enter Category Name",
                              controller: value.categoryName,
                            )
                          : TxtField(
                              hintText: "Enter Sub Category Name",
                              controller: value.subCategoryName,
                            ),
                      const SizedBox(height: Dimensions.defualtHeightForSpace),
                      addId == "Sub Category"
                          ? TxtField(
                              hintText: "Enter Main Category Name",
                              controller: value.categoryName,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(height: Dimensions.defualtHeightForSpace),
                ElevatedButtonCustom(
                  onPressed: () {
                    if (value.formKey.currentState!.validate()) {
                      if (addId == "Category" && editId == "") {
                        value.addCate().then((value) => {
                              if (value.status == true)
                                {
                                  Navigator.pop(context),
                                  SnackBarHelper.showSnackBar(
                                      context, value.message, false),
                                }
                              else
                                {
                                  SnackBarHelper.showSnackBar(
                                      context, value.message, true),
                                }
                            });
                      } else if (addId == "Sub Category" && editId == "") {
                        value.addSubCate().then((value) => {
                              if (value.status == true)
                                {
                                  Navigator.pop(context),
                                  SnackBarHelper.showSnackBar(
                                      context, value.message, false),
                                }
                              else
                                {
                                  SnackBarHelper.showSnackBar(
                                      context, value.message, true),
                                }
                            });
                      }
                    }
                  },
                  color: AppColorPallete.primaryColor,
                  child: Row(
                    children: [
                      BigText(
                          text: editId.isEmpty ? "Add $addId" : "Edit $addId"),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
