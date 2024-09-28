import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class HowToAccessView extends StatelessWidget {
  final HowToAccess howToAccess; HowToAccessView({super.key,required this.howToAccess});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomText(
          title: "How to access",
          color: AppColors.darkText,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
            itemCount: howToAccess.instructions.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15,),
                    Image(
                      image: AssetImage(Assets.smart_lock_flat),
                      height: 24,
                    ),
                    SizedBox(width: 15,),
                    CustomText(
                      title: "${howToAccess.instructions[index]}",
                      color: AppColors.darkText,
                      size: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }
}
