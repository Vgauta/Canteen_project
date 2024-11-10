import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/theme/color_pallete.dart';
import '../../../../../../../core/util/constants.dart';
import '../../../../../../../core/widget/app_bar_widget.dart';
import '../../../../../../../core/widget/big_text.dart';
import '../../../../../../../core/widget/eleve_button.dart';
import '../../../../../../../core/widget/small_text.dart';
import '../../../../../../../core/widget/snack_bar_helper.dart';
import '../../../../../../../core/widget/txt_field.dart';
import '../../../../../../../model/product_model.dart';
import '../../../../dashboard/presentation/widgets/drop_down_widget.dart';
import '../../provider/product_provider.dart';

class AddProductPage extends StatefulWidget {
  final String productId;
  const AddProductPage({super.key, required this.productId});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.clearProvider();
    provider.setField(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBarWidget(
          title: widget.productId.isEmpty
              ? "Add Product Form"
              : "Edit Product Form",
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        child: SingleChildScrollView(
          child: Consumer<ProductProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  Form(
                    key: value.addProductKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: value.pickImage,
                          child: Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor ==
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
                        const SizedBox(
                            height: Dimensions.defualtHeightForSpace),
                        TxtField(
                          width: double.infinity,
                          hintText: "Product Name",
                          controller: value.productName,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Product Name is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                            height: Dimensions.defualtHeightForSpace),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TxtField(
                                hintText: "Product Price",
                                controller: value.productPrice,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Product Price is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                                width: Dimensions.defualtWidthForSpace),
                            Expanded(
                              child: TxtField(
                                width: double.infinity,
                                hintText: "Product Quantity",
                                controller: value.productQuantity,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Product Quantity is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height: Dimensions.defualtHeightForSpace),
                        TxtField(
                          width: double.infinity,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Stock is required";
                            }
                            return null;
                          },
                          hintText: "Enter Stock",
                          controller: value.stockController,
                        ),
                        const SizedBox(
                            height: Dimensions.defualtHeightForSpace),
                        (value.isWriteMenu == false)
                            ? DropDownWidget(
                                list: value.productData.menus
                                    .map((e) => e.name)
                                    .toList(),
                                onPressed: () {
                                  value.setWritingState(
                                      !value.isWriteMenu, "menu");
                                },
                                onChanged: (val) {
                                  value.menuName.text = val;
                                },
                                hintText: "Select Menu",
                                validatorText: "Menu",
                                suffixIcon: Icons.edit,
                              )
                            : TxtField(
                                width: double.infinity,
                                suffixIconButton: IconButton(
                                  icon: const Icon(Icons.list),
                                  onPressed: () {
                                    value.setWritingState(
                                        !value.isWriteMenu, "menu");
                                  },
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Menu is required";
                                  }
                                  return null;
                                },
                                hintText: "Write Menu Name",
                                controller: value.menuName,
                              ),
                        const SizedBox(
                            height: Dimensions.defualtHeightForSpace),
                        (value.isWriteCategory == false)
                            ? DropDownWidget(
                                list: value.productData.categorys
                                    .map((e) => e.categoryNameMain)
                                    .toList(),
                                onPressed: () {
                                  value.setWritingState(
                                      !value.isWriteCategory, "Category");
                                },
                                onChanged: (val) {
                                  value.selectedCategory.text = val;
                                },
                                hintText: "Select Category",
                                validatorText: "Category",
                                suffixIcon: Icons.edit,
                              )
                            : TxtField(
                                width: double.infinity,
                                suffixIconButton: IconButton(
                                  icon: const Icon(Icons.list),
                                  onPressed: () {
                                    value.setWritingState(
                                        !value.isWriteCategory, "Category");
                                  },
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Category is required";
                                  }
                                  return null;
                                },
                                hintText: "Write Category",
                                controller: value.selectedCategory,
                              ),
                        const SizedBox(
                            height: Dimensions.defualtHeightForSpace),
                        (value.isWriteSubCategory == false)
                            ? DropDownWidget(
                                list: value.productData.subCategorys
                                    .map((e) => e.subCategory)
                                    .toList(),
                                onPressed: () {
                                  value.setWritingState(
                                      !value.isWriteSubCategory, "SubCategory");
                                },
                                onChanged: (val) {
                                  value.selectedSubCategory.text = val;
                                },
                                hintText: "Select Sub Category",
                                validatorText: "Sub Category",
                                suffixIcon: Icons.edit,
                              )
                            : TxtField(
                                width: double.infinity,
                                suffixIconButton: IconButton(
                                  icon: const Icon(Icons.list),
                                  onPressed: () {
                                    value.setWritingState(
                                        !value.isWriteSubCategory,
                                        "SubCategory");
                                  },
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Sub Category is required";
                                  }
                                  return null;
                                },
                                hintText: "Write Sub Category",
                                controller: value.selectedSubCategory,
                              ),
                        const SizedBox(
                            height: Dimensions.defualtHeightForSpace),
                        (value.isWritePriorityOfFood == false)
                            ? DropDownWidget(
                                list: value.productData.prioritys
                                    .map((e) => e.name)
                                    .toList(),
                                onPressed: () {
                                  value.setWritingState(
                                      !value.isWritePriorityOfFood, "Priority");
                                },
                                onChanged: (val) {
                                  value.selectedPriority.text = val;
                                },
                                hintText: "Select Priority Of Food",
                                validatorText: "Priority",
                                suffixIcon: Icons.edit,
                              )
                            : TxtField(
                                width: double.infinity,
                                suffixIconButton: IconButton(
                                  icon: const Icon(Icons.list),
                                  onPressed: () {
                                    value.setWritingState(
                                        !value.isWritePriorityOfFood,
                                        "Priority");
                                  },
                                ),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Priority of Food is required";
                                  }
                                  return null;
                                },
                                hintText: "Write Priority Of Food",
                                controller: value.selectedPriority,
                              ),
                        const SizedBox(
                            height: Dimensions.defualtHeightForSpace),
                        TxtField(
                          hintText: "Write Description....",
                          controller: value.productDescription,
                          maxLines: 5,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Product Description is required";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SmallText(
                        text: "Status Available",
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      CupertinoSwitch(
                        value: value.isAvailableStatusActive,
                        onChanged: (val) {
                          value.setStatus(
                              !value.isAvailableStatusActive, "Available");
                        },
                        activeColor: AppColorPallete.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SmallText(
                        text: "Discount Active",
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      CupertinoSwitch(
                        value: value.isDiscountActive,
                        onChanged: (val) {
                          value.setStatus(!value.isDiscountActive, "Discount");
                        },
                        activeColor: AppColorPallete.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  value.isDiscountActive
                      ? TxtField(
                          hintText: "Discount in pecentage",
                          controller: value.discountPercentage,
                        )
                      : const SizedBox(),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  ElevatedButtonCustom(
                    onPressed: () {
                      if (value.addProductKey.currentState!.validate()) {
                        if (widget.productId.isEmpty) {
                          value.addProductProviderFunc().then(
                            (val) {
                              if (val.status) {
                                value.setLoading();
                                SnackBarHelper.showSnackBar(
                                    context, val.message, false);
                                Navigator.pop(context);
                                value.clearProvider();
                              } else {
                                SnackBarHelper.showSnackBar(
                                    context, val.message, true);
                              }
                            },
                          );
                        } else {
                          value.updateProduct(widget.productId).then(
                            (val) {
                              if (val.status) {
                                value.setLoading();
                                SnackBarHelper.showSnackBar(
                                    context, val.message, false);
                                value.setLoading();
                                Navigator.pop(context);
                                value.clearProvider();
                              } else {
                                SnackBarHelper.showSnackBar(
                                    context, val.message, true);
                              }
                            },
                          );
                        }

                        // value.clearProvider();
                      }
                    },
                    color: Theme.of(context).scaffoldBackgroundColor ==
                            AppColorPallete.backgroundColor
                        ? AppColorPallete.orangeColorWitgOpeDarkMode
                        : AppColorPallete.orangeColorWitgOpeLightMode,
                    borderColor: AppColorPallete.primaryColor,
                    isBorderOn: true,
                    child: !value.isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text: widget.productId.isEmpty
                                    ? "Add Product"
                                    : "Update Product",
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
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
