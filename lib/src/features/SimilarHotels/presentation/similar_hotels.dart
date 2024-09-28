import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/shared/presentation/widgets/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/presentation/widgets/appText/app_text.dart';

class SimilarHotels extends StatelessWidget {
  const SimilarHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomText(
          title: "Similar listings ",
          color: AppColors.darkText,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 260,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: HotelTile(),
                );
              }),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class HotelTile extends StatelessWidget {
  const HotelTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ]),
      child: Column(
        children: [
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
              color: AppColors.red,
              image: DecorationImage(
                  image: AssetImage(Assets.hotel), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: "Stunning 6 bedrooms Mansion",
                  color: AppColors.darkText,
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CustomText(
                      title: "5.0",
                      color: AppColors.darkText,
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      CupertinoIcons.star_fill,
                      color: AppColors.primaryColor,
                      size: 10,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 10,
                      child: VerticalDivider(
                        color: AppColors.divider,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      title: "50 reviews",
                      color: AppColors.darkText,
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image(
                      image: AssetImage(Assets.location_flat),
                      height: 10,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      title: "11.6 mi from current location ",
                      color: AppColors.darkText,
                      size: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
