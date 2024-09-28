import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class CancellatioPolicy extends StatelessWidget {
  final Cancellation cancellation; CancellatioPolicy({super.key,required this.cancellation});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomText(
          title: "Cancellation policy ",
          color: AppColors.darkText,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 15,),
            Image(
              image: AssetImage(Assets.like),
              height: 24,
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: "Flexible",
                  color: AppColors.darkText,
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  title: "Full refund before ${cancellation.cancelTill.day}-${cancellation.cancelTill.month}-${cancellation.cancelTill.year
                  }.",
                  color: AppColors.darkText,
                  size: 12,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
        TextButton(onPressed: (){}, child:    CustomText(
          title: "See full policy",
          color: AppColors.primaryColor,
          size: 14,
          fontWeight: FontWeight.w600,
        ),)
      ],
    );
  }
}
