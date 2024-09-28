import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class RoomUtils extends StatelessWidget {
  final HotelModel hotelModel; RoomUtils({super.key,required this.hotelModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffffffff).withOpacity(0.6),
                Color(0xffffffff).withOpacity(0.0)
              ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              title: "Area ${hotelModel.area} sqft",
              color: AppColors.white,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              title: "Sleeps ${hotelModel.sleeps}",
              color: AppColors.white,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              title: "Bedrooms ${hotelModel.bedrooms}",
              color: AppColors.white,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              title: "Bathrooms ${hotelModel.bedrooms}",
              color: AppColors.white,
              size: 12,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
