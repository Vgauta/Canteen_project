import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/util/image_strings.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/components/add-component/add_poster_page.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/add_edit_component_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/widget/app_bar_widget.dart';
import '../../../../../../../core/widget/snack_bar_helper.dart';
import '../../../../../data/product_data.dart';
import '../add-component/add_coupon_page.dart';

class PosterAndCouponsPage extends StatelessWidget {
  final bool isPoster;
  PosterAndCouponsPage({
    super.key,
    required this.isPoster,
  });

  final productData = Get.find<ProductDataAdmin>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBarWidget(title: isPoster ? "Posters" : "Coupons"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        child: Consumer<AddAndEditComponentProvider>(
          builder: (context, value, child) {
            return RefreshIndicator(
              onRefresh: () => value.refresh(),
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.defualtHeightForSpace),
                  isPoster ? _buildPosters() : _buildCoupons(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPosters() {
    return Expanded(
      child: ListView.builder(
        itemCount: productData.poster.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(bottom: Dimensions.defualtHeightForSpace),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image:
                              NetworkImage(productData.poster[index].posterUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.defaultPadding),
                    child: Row(
                      children: [
                        BigText(text: "${index + 1}."),
                        BigText(text: productData.poster[index].title),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddAndEditPosterPage(
                                        posterId: productData
                                            .poster[index].posterId)));
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        Consumer<AddAndEditComponentProvider>(
                          builder: (context, value, child) {
                            return !value.isLoading
                                ? IconButton(
                                    onPressed: () {
                                      value
                                          .deletePoster(productData
                                              .poster[index].posterId)
                                          .then((value) => {
                                                if (value.status == true)
                                                  {
                                                    SnackBarHelper.showSnackBar(
                                                        context,
                                                        value.message,
                                                        false),
                                                  }
                                                else
                                                  {
                                                    SnackBarHelper.showSnackBar(
                                                        context,
                                                        value.message,
                                                        true),
                                                  }
                                              });
                                    },
                                    icon: const Icon(Icons.delete),
                                  )
                                : const CircularProgressIndicator(
                                    color: Colors.black,
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCoupons() {
    return Expanded(
      child: ListView.builder(
        itemCount: productData.coupons.length,
        itemBuilder: (context, index) {
          return Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                BigText(text: "${index + 1}."),
                const SizedBox(width: 5),
                BigText(text: productData.coupons[index].couponCode),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddAndEditCouponPage(
                                couponId:
                                    productData.coupons[index].couponId)));
                  },
                  icon: const Icon(Icons.edit),
                ),
                Consumer<AddAndEditComponentProvider>(
                  builder: (context, value, child) {
                    return !value.isLoading
                        ? IconButton(
                            onPressed: () {
                              value
                                  .deleteCoupons(
                                      productData.coupon[index].couponId)
                                  .then((value) => {
                                        if (value.status == true)
                                          {
                                            SnackBarHelper.showSnackBar(
                                                context, value.message, false),
                                          }
                                        else
                                          {
                                            SnackBarHelper.showSnackBar(
                                                context, value.message, true),
                                          }
                                      });
                            },
                            icon: const Icon(Icons.delete),
                          )
                        : const CircularProgressIndicator(
                            color: Colors.black,
                          );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
