import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class BedroomDetails extends StatelessWidget {
  final BedRoom bedRoom; BedroomDetails({super.key,required this.bedRoom});

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
                  title:bedRoom.title,
                  color: AppColors.darkText,
                  size: 13,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 2,
                ),
                CustomText(
                  title: "${bedRoom.kingBed} king bed, ${bedRoom.singleBed} single bed ${bedRoom.bunkBed} bunk bed, ${bedRoom.babyCrib} baby crib",
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
                  image: AssetImage(Assets.icon_king_flat),
                  height: 24,
                ),
                Image(
                  image: AssetImage(Assets.icon_single_flat),
                  height: 24,
                ),
                Image(
                  image: AssetImage(Assets.icon_bed_bunk_flat),
                  height: 24,
                ),
                Image(
                  image: AssetImage(Assets.icon__baby_bed_flat),
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
