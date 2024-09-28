import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff6568F1);
  static const Color transparent = Colors.transparent;
  static const Color shadow = Color(0xFF0000001A);
  static const Color border = Color(0xFFE2E8F0);
  static const Color screenBG = Color(0xFFF9F9F9);

  static const Color secondaryColor = Color(0xff132945);
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFFDDDDDD);
  static const Color orange = Color(0xFFFFBC04);
  static const Color red = Color(0xFFE2383A);
  static const Color divider = Color(0xFFD3D3D3);
  static const Color marker = Color(0xFF21B9E6);
  static const Color green = Color(0xFF1DC9A0);
  static const Color lightGreen = Color(0xFF1DC9A0);
  static const Color appBar = Color(0xFFFDB515);

// ! Text Colors
  static const Color darkText = Color(0xFF1C1C27);
  static const Color greyText = Color(0xff808D9E);

  // ! TextField Colors
  static const Color lightBG = Color(0xffF9F9FC);
  static const Color googleBTN = Color(0xffEA4335);
  static const Color appleBTN = Color(0xff1D2733);
}

class FontWeights {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
