

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/theme/color_pallete.dart';
import '../../../../../../core/util/constants.dart';
import '../../../../../../core/widget/big_text.dart';
import '../widgets/dashboard_card_widget.dart';

class RevenueContainer extends StatelessWidget {
  const RevenueContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: double.infinity,
      padding: const EdgeInsets.all(Dimensions.defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: Constants.boxShadow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: "Revenue"),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CardWidget(
                  title: "Today",
                  value: "1000",
                  icon: Icons.currency_rupee,
                  borderColor: AppColorPallete.greenColor,
                ),
              ),
              SizedBox(
                width: Dimensions.defualtWidthForSpace,
              ),
              Expanded(
                child: CardWidget(
                  title: "Yesterday",
                  value: "1000",
                  icon: Icons.currency_rupee,
                  borderColor: AppColorPallete.greenColor,
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.defualtHeightForSpace),
          BigText(text: "Monthly Revenue"),
          SizedBox(height: Dimensions.defualtHeightForSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CardWidget(
                  title: "This Month",
                  value: "1000",
                  icon: Icons.currency_rupee,
                  borderColor: AppColorPallete.greenColor,
                ),
              ),
              SizedBox(
                width: Dimensions.defualtWidthForSpace,
              ),
              Expanded(
                child: CardWidget(
                  title: "Last Month",
                  value: "1000",
                  icon: Icons.currency_rupee,
                  borderColor: AppColorPallete.greenColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
