import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/core/theme/app_colors.dart';
import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';

import 'package:cleancode/src/shared/presentation/widgets/appText/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/room_utlis.dart';
import '../widgets/shadow_overlay.dart';
import '../widgets/slider_view.dart';

class TopBar extends StatelessWidget {
  final HotelModel hotelModel; TopBar({super.key,required this.hotelModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 337,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SliderView(banners: hotelModel.banners,),
          ShadowOverlay(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 51,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        CupertinoIcons.arrow_left,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        CupertinoIcons.share,

                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        CupertinoIcons.heart,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: "${hotelModel.ratings}",
                          color: AppColors.white,
                          size: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 2,),
                        Icon(
                          CupertinoIcons.star_fill,
                          color: AppColors.primaryColor,
                          size: 10,
                        )
                      ],
                    ),
                    SizedBox(width: 5,),
                    Row(
                      children: [
                        CustomText(
                          title: "${hotelModel.reviews.length} reviews",
                          size: 12,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),

                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Image(image: AssetImage(Assets.location_flat),height: 14,),
                    SizedBox(
                      width: 2,
                    ),
                    CustomText(
                      title: "${hotelModel.location.address}",
                      color: AppColors.white,
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    CustomText(
                      title: "1 of ${hotelModel.banners.length}",
                      color: AppColors.white,
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),

                SizedBox(
                  height: 17,
                ),
                RoomUtils(hotelModel: hotelModel,),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



