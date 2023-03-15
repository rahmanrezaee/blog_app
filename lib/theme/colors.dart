import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Colors
  static Color brandColor = Color(0xff007C30);
  static String brandColorString = "007C30";
  static Color lightGreenColor = Color(0xff1EAF46);
  static Color blueColor = Color(0xFF1094F4);
  static Color blue2Color = Color(0xFF1E68F9);
  static Color orangeColor = Color(0xFFF48B10);
  static Color blueLightColor = Color(0xFF5C9BC9);
  static Color redColor = Color(0xffEE362C);
  static Color redLightColor = Color(0xffF46159);
  static Color pinkColor = Color(0xffF542E3);
  static Color blackColor = Color(0xff191919);

  // Text Color
  static Color accentLighter = Color(0xffFFF8D6);
  static Color redLight = Color(0xffF46159);
  static Color grayNormal = Color(0xffB5B5B5);

  static Color grayDark = Color(0xff646262);
  static Color grayLight = Color(0xffF4F4F4);
  static Color listBackground = Color(0xffF1F1F1);
  static Color grayText = Color(0xffC2C2C2);
  static Color blackTextColor = Color(0xff191919);
  static Color datePickerTextColor = Color(0xffADADAD);
  static Color grayText2 = Color(0xff808080);
  static Color grayTitleText = Color(0xff808080);

  //border line
  static Color blackBorderColor = Color(0xffF3F3F3);

  static Color inputIconColor = Color(0xffC4C4C4);

  static Color containerBackground = Color(0xffFBFBFB);
  static Color errorBackground = Color(0xffEE362C);
  static Color successBackground = Color(0xff007C30);
  static Color inputColor = Color(0xFFFBFBFB);
  static Color borderGreyColor = Color(0xFFEEEEEE);
  static Color borderCircleColor = Color(0xFF007C30);
  static Color linkColor = Color(0xFF3270E0);
  static Color lightGreyTextColor = Color(0xFFABABAB);
  static Color greyTextColor = Color(0xFF7E7E7E);
  static Color grayDividerColor = Color(0xFFF8F8F8);
  static Color dividerColor = Color(0xFFE4E4E4);

  static RadialGradient getGradient(Color color,
      [double depth = 0.20, double radius = 0.5]) {
    return RadialGradient(
      colors: [
        color.withOpacity(depth),
        color.withOpacity(0),
      ],
      radius: radius,
    );
  }
}
