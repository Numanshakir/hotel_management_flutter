import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/shared/presentation/widgets/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomText(
          title: "Approximate location",
          color: AppColors.darkText,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 14,
        ),
        CustomText(
          title:
              "The exact address will be shared once your booking is confirmed.",
          color: AppColors.darkText,
          size: 12,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}

class FeatureTile extends StatelessWidget {
  const FeatureTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 130,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Image(
              image: AssetImage(Assets.icon_king_flat),
              height: 22,
            ),
            SizedBox(
              width: 15,
            ),
            CustomText(
              title: "Pool",
              color: AppColors.darkText,
              size: 12,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
