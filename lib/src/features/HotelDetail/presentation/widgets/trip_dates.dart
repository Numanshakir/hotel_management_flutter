import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class TripDates extends StatelessWidget {
  final HotelModel hotelModel; TripDates({super.key,required this.hotelModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: "Trip dates ",
          color: AppColors.darkText,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 125,
          width: MediaQuery.of(context).size.width,

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
          child: Column(
            children: [
              Row(


                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(Assets.checkin),
                          height: 24,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "Check-in",
                              color: AppColors.primaryColor,
                              size: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomText(
                              title: "${hotelModel.tripCheckin}",
                              color: AppColors.darkText,
                              size: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,child: VerticalDivider(color: AppColors.divider,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(Assets.checkout),
                          height: 24,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "Check-out",
                              color: AppColors.primaryColor,
                              size: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomText(
                              title: "${hotelModel.tripCheckout}",
                              color: AppColors.darkText,
                              size: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Divider(color: AppColors.divider,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(Assets.pessenger_flat),
                      height: 24,
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Guests",
                          color: AppColors.primaryColor,
                          size: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomText(
                          title: "${hotelModel.guests.totalGuests} guests, ${hotelModel.guests.adults} Adults, ${hotelModel.guests.childerns} Children, ${hotelModel.guests.infants} Infant, ${hotelModel.guests.pets} Pet",
                          color: AppColors.darkText,
                          size: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
