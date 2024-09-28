import 'package:cleancode/src/core/screenUtils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

/// Light theme
final ThemeData appTheme = ThemeData(
  dialogBackgroundColor: AppColors.greyText,
  cardColor: AppColors.primaryColor,
  appBarTheme: AppBarTheme(
    // shadowColor: AppColors.lightGray,
    color: AppColors.white,
    elevation: 2,
    toolbarTextStyle: const TextTheme(
      titleLarge: AppTextStyle.xxxLargeBlack,
    ).bodyLarge,
    titleTextStyle: const TextTheme(
      titleLarge: AppTextStyle.xxxLargeBlack,
    ).titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  fontFamily: "Georgia",
  scaffoldBackgroundColor: AppColors.white,
  iconTheme: const IconThemeData(color: AppColors.black, size: 25),
  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.xxxLargeBlack,
    headlineMedium: AppTextStyle.xLargeBlack,
    titleMedium: AppTextStyle.xSmallBlack,
    titleSmall: AppTextStyle.smallBlack,
    bodyLarge: AppTextStyle.largeBlack,
    bodyMedium: AppTextStyle.mediumBlack,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 50.h, vertical: 12.v),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.adaptSize),
      ),
    ),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
  inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.transparent,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.h,
      ),
      suffixIconColor: AppColors.black,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.adaptSize),
          borderSide: const BorderSide(color: AppColors.white, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.adaptSize),
          borderSide: const BorderSide(color: AppColors.white, width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.adaptSize),
          borderSide: const BorderSide(color: AppColors.white, width: 1)),
      errorMaxLines: 2),
);

/// Dark theme
final ThemeData darkAppTheme = ThemeData(
  dialogBackgroundColor: AppColors.primaryColor,
  cardColor: AppColors.orange.withOpacity(0.5),
  appBarTheme: AppBarTheme(
    shadowColor: AppColors.white,
    color: AppColors.darkText,
    elevation: 0,
    toolbarTextStyle: const TextTheme(
      titleLarge: AppTextStyle.xxxLargeWhite,
    ).bodyLarge,
    titleTextStyle: const TextTheme(
      titleLarge: AppTextStyle.xxxLargeWhite,
    ).titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  fontFamily: "Georgia",
  scaffoldBackgroundColor: AppColors.primaryColor,
  iconTheme: const IconThemeData(color: AppColors.white, size: 25),
  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.xxxLargeWhite,
    headlineMedium: AppTextStyle.xLargeWhite,
    titleMedium: AppTextStyle.xSmallWhite,
    titleSmall: AppTextStyle.smallWhite,
    bodyLarge: AppTextStyle.largeWhite,
    bodyMedium: AppTextStyle.mediumWhite,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: 50.h,
        vertical: 12.v,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 10.h,
    ),
    filled: true,
    suffixIconColor: AppColors.white,
    fillColor: AppColors.transparent,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.adaptSize),
        borderSide: const BorderSide(color: AppColors.greyText, width: 1)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.adaptSize),
        borderSide: const BorderSide(color: AppColors.greyText, width: 1)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.adaptSize),
        borderSide: const BorderSide(color: AppColors.greyText, width: 1)),
    errorMaxLines: 2,
  ),
);
