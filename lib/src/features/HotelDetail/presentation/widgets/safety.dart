import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:cleancode/src/shared/presentation/widgets/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class SafetyView extends StatelessWidget {
  final List<Safety> safety;
  SafetyView({super.key,required this.safety});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomText(
          title: "Safety",
          color: AppColors.darkText,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        GridView.builder(
          itemCount: safety.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(crossAxisCount: 2,height: 50,mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return SafetyViewTile(safety: safety[index],);
          },
        ),
        TextButton(
          onPressed: () {},
          child: CustomText(
            title: "Show more",
            color: AppColors.primaryColor,
            size: 14,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

class SafetyViewTile extends StatelessWidget {
  final Safety safety; SafetyViewTile({super.key,required this.safety});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 130,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Image(
              image: AssetImage(safety.image),
              height: 22,
            ),
            SizedBox(
              width: 15,
            ),
            CustomText(
              title:safety.title,
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

