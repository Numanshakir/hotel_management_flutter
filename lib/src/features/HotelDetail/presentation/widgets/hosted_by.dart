import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:cleancode/src/shared/presentation/widgets/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class HostedBy extends StatelessWidget {
  final Host host; HostedBy({super.key,required this.host});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomText(
          title: "Hosted by",
          color: AppColors.darkText,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        HostTile(host:host,),
      ],
    );
  }
}

class HostTile extends StatelessWidget {
  final Host host; HostTile({super.key,required this.host});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Assets.PhotoProfile),
                  height: 67,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: host.name,
                      color: AppColors.darkText,
                      size: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      title: "Joined ${host.joined.day}-${host.joined.month}-${host.joined.year}",
                      color: AppColors.darkText,
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: "Verified Host",
                          color: AppColors.darkText,
                          size: 10,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Image(
                          image: AssetImage(Assets.user_verify_flat),
                          height: 20,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          title: "${host.rating}",
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
                          width: 10,
                        ),
                        CustomText(
                          title: "${host.reviews.length} reviews",
                          color: AppColors.darkText,
                          size: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffC7C7FB),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(Assets.host_message),
                    height: 14,
                  ),
                  SizedBox(width: 10,),
                  CustomText(
                    title: "Message host",
                    color: AppColors.darkText,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
