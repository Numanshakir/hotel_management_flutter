import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:cleancode/src/shared/presentation/widgets/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class RoomFeatures extends StatelessWidget {
  final
  List<Features> features; RoomFeatures({super.key,required this.features});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomText(
          title: "Features",
          color: AppColors.darkText,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        GridView.builder(
          itemCount: features.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(crossAxisCount: 2,height: 50,mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(right: index%2==0?20:0,left: index%2!=0?20:0),
              child: FeatureTile(feature: features[index]),
            );
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

class FeatureTile extends StatelessWidget {
  final Features feature; FeatureTile({super.key,required this.feature});

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
              image: AssetImage(feature.image),
              height: 22,
            ),
            SizedBox(
              width: 15,
            ),
            CustomText(
              title: "${feature.title}",
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
