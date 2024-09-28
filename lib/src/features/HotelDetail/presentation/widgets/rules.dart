import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/features/HotelDetail/domain/models/hotel_model.dart';
import 'package:cleancode/src/shared/presentation/widgets/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

class Rules extends StatelessWidget {
  final List<Things> allowedThings;
  final List<Things> notAllowedThings;
  final List<String> additionalRules;
  Rules({super.key,required this.notAllowedThings,required this.allowedThings,required this.additionalRules});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomText(
          title: "House rules",
          color: AppColors.darkText,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 17,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: "CHECK-IN",
                    color: AppColors.darkText,
                    size: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    title: "After 4:00 PM",
                    color: AppColors.darkText,
                    size: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: "CHECK-IN",
                    color: AppColors.darkText,
                    size: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    title: "After 4:00 PM",
                    color: AppColors.darkText,
                    size: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 1,
          color: AppColors.divider,
        ),
        SizedBox(
          height: 20,
        ),
        ThingsAllowedAndNot(isAllowed: true,things: allowedThings,),
        SizedBox(
          height: 20,
        ),
        ThingsAllowedAndNot(things: notAllowedThings,),
        SizedBox(
          height: 20,
        ),
        AdditionalRules(rules:additionalRules),
      ],
    );
  }
}

class ThingsAllowedAndNot extends StatelessWidget {
  final bool isAllowed;
  List<Things> things;

  ThingsAllowedAndNot({super.key, this.isAllowed = false,required this.things});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              title: isAllowed ? "Things allowed" : "Things Not allowed",
              color: AppColors.darkText,
              size: 13,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 10,
            ),
        SizedBox(
          height: 55,
          child: ListView.builder(
            itemCount: things.length,
            scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              // physics: NeverScrollableScrollPhysics(),

              itemBuilder: (context,index){
            return    Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ThingsTile(things[index]),
            );
          }),
        ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

Widget ThingsTile(Things things) {
  return Column(
    children: [
      Image(
        image: AssetImage(things.image),
        height: 28,
      ),
      SizedBox(
        height: 10,
      ),
      CustomText(
        title: things.title,
        color: AppColors.darkText,
        size: 12,
        alignment: TextAlign.center,
        fontWeight: FontWeight.w400,
      ),
    ],
  );
}

class AdditionalRules extends StatelessWidget {
  final List<String> rules;
  AdditionalRules({
    super.key,
    required this.rules
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            CustomText(
              title: "Additional rules",
              color: AppColors.darkText,
              size: 16,
              fontWeight: FontWeight.w600,
            ),

            ListView.builder(
              shrinkWrap: true,
                itemCount: rules.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomText(
                      title: rules[index],
                      color: AppColors.darkText,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }),
            TextButton(
              onPressed: () {},
              child: CustomText(
                title: "Show more",
                color: AppColors.primaryColor,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
