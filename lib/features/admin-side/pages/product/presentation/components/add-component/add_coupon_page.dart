import 'package:canteen/core/widget/app_bar_widget.dart';
import 'package:canteen/core/widget/eleve_button.dart';
import 'package:canteen/core/widget/snack_bar_helper.dart';
import 'package:canteen/core/widget/txt_field.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/add_edit_component_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/theme/color_pallete.dart';
import '../../../../../../../core/util/constants.dart';
import '../../../../../../../core/widget/big_text.dart';
import '../../../../dashboard/presentation/widgets/drop_down_widget.dart';

class AddAndEditCouponPage extends StatelessWidget {
  final String couponId;
  const AddAndEditCouponPage({
    super.key,
    required this.couponId,
  });

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AddAndEditComponentProvider>(context, listen: false);
    provider.clearFields();
    provider.setFields(couponId, "coupon");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBarWidget(
          title: couponId.isEmpty ? "Add Coupon" : "Edit Coupon",
        ),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        child: Column(
          children: [
            const SizedBox(height: Dimensions.defualtHeightForSpace),
            Form(
              key: provider.formKey,
              child: Column(
                children: [
                  TxtField(
                    hintText: "Enter Title (optional)",
                    controller: provider.titleController,
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  TxtField(
                    hintText: "Enter Coupon Code",
                    controller: provider.couponCodeController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Coupon Name Or Id";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  TxtField(
                    hintText: "Enter Coupon Discount value (in percentage)",
                    controller: provider.discountPercentageController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Coupon Value Or Discounted Price";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  DropDownWidget(
                    list: provider.productData.categorys
                        .map((e) => e.categoryNameMain)
                        .toList(),
                    editOn: false,
                    onChanged: (val) {
                      provider.setStatus(
                        "",
                        "setappliedToCateId",
                        provider.productData.categorys
                            .firstWhere(
                                (element) => element.categoryNameMain == val)
                            .id,
                      );
                    },
                    hintText: couponId.isEmpty
                        ? "Select Category"
                        : provider.appliedToCateId,
                    validatorText: "Category",
                    suffixIcon: Icons.edit,
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  TxtField(
                    hintText: "Enter Description",
                    controller: provider.descriptionController,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimensions.defualtHeightForSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BigText(text: "Status"),
                Consumer<AddAndEditComponentProvider>(
                  builder: (context, value, child) {
                    return CupertinoSwitch(
                      value: value.status,
                      onChanged: (val) {
                        value.setStatus("poster", "", "");
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: Dimensions.defualtHeightForSpace),
            Consumer<AddAndEditComponentProvider>(
              builder: (context, value, child) {
                return ElevatedButtonCustom(
                  color: Theme.of(context).scaffoldBackgroundColor ==
                          AppColorPallete.backgroundColor
                      ? AppColorPallete.orangeColorWitgOpeDarkMode
                      : AppColorPallete.orangeColorWitgOpeLightMode,
                  borderColor: AppColorPallete.primaryColor,
                  onPressed: () {
                    if (value.formKey.currentState!.validate()) {
                      couponId.isEmpty
                          ? value.addCoupons().then((value) => {
                                if (value.status == true)
                                  {
                                    SnackBarHelper.showSnackBar(
                                        context, value.message, false),
                                    Navigator.pop(context),
                                  }
                                else
                                  {
                                    SnackBarHelper.showSnackBar(
                                        context, value.message, true),
                                  }
                              })
                          : value.editCoupons(couponId).then((value) => {
                                if (value.status == true)
                                  {
                                    SnackBarHelper.showSnackBar(
                                        context, value.message, false),
                                    Navigator.pop(context),
                                  }
                                else
                                  {
                                    SnackBarHelper.showSnackBar(
                                        context, value.message, true),
                                  }
                              });
                    }
                  },
                  child: !value.isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: couponId.isEmpty
                                  ? "Add Coupon"
                                  : "Edit Coupon",
                              color: AppColorPallete.whiteColor,
                            ),
                            const SizedBox(
                                width: Dimensions.defualtWidthForSpace),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: AppColorPallete.whiteColor,
                            ),
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: AppColorPallete.whiteColor,
                          ),
                        ),
                );
              },
            ),
            const SizedBox(height: Dimensions.defualtHeightForSpace),
          ],
        ),
      ),
    );
  }
}
