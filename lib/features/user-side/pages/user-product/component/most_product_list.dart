import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/features/user-side/pages/user-product/provider/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widget/small_text.dart';

class MostPopularProducts extends StatelessWidget {
  final String cat;
  const MostPopularProducts({
    super.key,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Consumer<ProductDetailsProvider>(
        builder: (context, value, child) {
          value.getProductCatWise(cat);
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: value.productsListCatWise.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8),
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColorPallete.whiteColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 70),
                          SmallText(
                            text: value.productsListCatWise[index].productName,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 5),
                          SmallText(
                            text:
                                "₹${value.productsListCatWise[index].productPrice}",
                            color: AppColorPallete.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 90),
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(value
                                .productsListCatWise[index].productImageString),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
