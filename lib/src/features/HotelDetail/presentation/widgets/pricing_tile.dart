import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class PricingTile extends StatelessWidget {
  final HotelModel  hotelModel; PricingTile({super.key,required this.hotelModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ],
        borderRadius: BorderRadius.circular(26),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CustomText(
                      title: "\$ ${hotelModel.subtotal} ",
                      color: AppColors.darkText,
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),

                    CustomText(
                      title: "night",
                      color: AppColors.darkText,
                      size: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                CustomText(
                  title: "\$${hotelModel.total} before taxes & fess",
                  color: AppColors.darkText,
                  textDecoration: TextDecoration.underline,
                  size: 15,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Spacer(),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CustomText(
                  title: "Continue",
                  color: AppColors.white,
                  size: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
