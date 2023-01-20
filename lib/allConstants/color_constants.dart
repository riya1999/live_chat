/*
import 'dart:ui';

class AppColors {
  AppColors._();

  static const Color spaceLight = Color(0xff2b3a67);
  static const Color orangeWeb = Color(0xFFf59400);
  static const Color white = Color(0xFFf5f5f5);
  static const Color greyColor = Color(0xffaeaeae);
  static const Color greyColor2 = Color(0xffE8E8E8);
  static const Color lightGrey = Color(0xff928a8a);
  static const Color burgundy = Color(0xFF880d1e);
  static const Color indyBlue = Color(0xFF414361);
  static const Color spaceCadet = Color(0xFF2a2d43);
}*/

import 'dart:ui';

class ColorConstants {
  static const themeColor = Color(0xFF414361);
  static Map<int, Color> swatchColor = {
    50: themeColor.withOpacity(0.1),
    100: themeColor.withOpacity(0.2),
    200: themeColor.withOpacity(0.3),
    300: themeColor.withOpacity(0.4),
    400: themeColor.withOpacity(0.5),
    500: themeColor.withOpacity(0.6),
    600: themeColor.withOpacity(0.7),
    700: themeColor.withOpacity(0.8),
    800: themeColor.withOpacity(0.9),
    900: themeColor.withOpacity(1),
  };
  static const primaryColor = Color(0xff203152);
  static const greyColor = Color(0xffaeaeae);
  static const greyColor2 = Color(0xffE8E8E8);
  static const lightGrey = Color(0xff928a8a);

}
