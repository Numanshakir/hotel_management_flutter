import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class BathRoomDetails extends StatelessWidget {
  final BathRoom bathRoom; BathRoomDetails({super.key,required this.bathRoom});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 170,

      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey,
                blurRadius: 1,spreadRadius: 1,
                offset: Offset(0, 1)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: bathRoom.title,
                  color: AppColors.darkText,
                  size: 13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 2,
                ),
                CustomText(
                  title: "Toilet, sink, shower bathtub",
                  color: AppColors.darkText,
                  size: 13,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage(Assets.icon_boat_bath),
                  height: 24,
                ),
                Image(
                  image: AssetImage(Assets.sink),
                  height: 24,
                ),
                Image(
                  image: AssetImage(Assets.shower),
                  height: 24,
                ),
                Image(
                  image: AssetImage(Assets.hot_tube),
                  height: 24,
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
