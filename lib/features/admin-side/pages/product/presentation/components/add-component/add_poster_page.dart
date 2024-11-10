import 'package:canteen/core/widget/app_bar_widget.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/core/widget/elve_button_two_custom.dart';
import 'package:canteen/core/widget/snack_bar_helper.dart';
import 'package:canteen/core/widget/txt_field.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/add_edit_component_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/theme/color_pallete.dart';
import '../../../../../../../core/util/constants.dart';

class AddAndEditPosterPage extends StatelessWidget {
  final String posterId;
  const AddAndEditPosterPage({
    super.key,
    required this.posterId,
  });

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AddAndEditComponentProvider>(context, listen: false);
    provider.clearFields();
    provider.setFields(posterId, "poster");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBarWidget(
          title: posterId.isEmpty ? "Add Poster" : "Edit Poster",
        ),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: Dimensions.defualtHeightForSpace),
            GestureDetector(
              onTap: provider.pickImage,
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
                    image: provider.base64Image.isNotEmpty
                        ? DecorationImage(
                            image: MemoryImage(
                              provider.image!,
                            ),
                            fit: BoxFit.cover,
                          )
                        : null),
                child: Center(
                  child: (provider.base64Image.isEmpty)
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
              key: provider.formKey,
              child: Column(
                children: [
                  TxtField(
                    hintText: "Poster Title",
                    controller: provider.titleController,
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  TxtField(
                    hintText: "Poster Description",
                    controller: provider.descriptionController,
                    maxLines: 5,
                    validator: (value) => value!.isEmpty ? "Required" : null,
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
                      value: provider.status,
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
                return ElevatedButtonCustomTwo(
                  color: AppColorPallete.primaryColor,
                  shadowColor: AppColorPallete.primaryColor50,
                  onPressed: () {
                    if (value.formKey.currentState!.validate()) {
                      posterId.isEmpty
                          ? value.addPoster().then(
                                (value) => {
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
                                },
                              )
                          : value.editPoster(posterId).then((value) => {
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
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                  child: !value.isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(
                              text: posterId.isEmpty
                                  ? "Add Poster"
                                  : "Edit Poster",
                              color: AppColorPallete.whiteColor,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
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
            )
          ],
        ),
      ),
    );
  }
}
