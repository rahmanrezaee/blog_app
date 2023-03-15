
import 'package:bloc_app/theme/colors.dart';
import 'package:flutter/material.dart';

//Please don't set font sizes, colors and other things that they are depends on theme.
//Use this prebuild theme
blogTheme(BuildContext context) {

 
  return ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
    }),
    brightness: Brightness.light,
    primaryColor: const Color(0xff000000),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Color(0xff007C30),
      backgroundColor: Colors.white,
      elevation: 6,
    ),
    primaryColorLight: Color(0xffbbdefb),
    primaryColorDark: Color(0xff000000),
    canvasColor: Color(0xfffafafa),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Color(0xffffffff),
    dividerColor: Color(0x1f000000),
    highlightColor: Color(0xff969696),
    splashColor: Color(0x66c8c8c8),
    unselectedWidgetColor: Color(0x8a000000),
    disabledColor: Color(0x61000000),
    secondaryHeaderColor: Color(0xffe3f2fd),
    dialogBackgroundColor: Color(0xffffffff),
    indicatorColor: Color(0xff007C30),
    hintColor: Color(0x8a000000),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 12,
        color: Color(0xb3000000),
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: Colors.black54,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      headlineMedium: TextStyle(
        color: Colors.black54,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: Color(0xff000000),
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      displayLarge: TextStyle(
        color: Color(0xFF000000),
        fontSize: 22,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyMedium: TextStyle(
        color: Color(0xdd000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyLarge: TextStyle(
        color: Color(0xff000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodySmall: TextStyle(
        color: Color(0x8a000000),
        fontSize: 9,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      titleSmall: TextStyle(
        color: Color(0xff76B261),
        fontStyle: FontStyle.normal,
      ),
      labelSmall: TextStyle(
        color: Color(0xff000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    primaryTextTheme: TextTheme(
      headlineMedium: TextStyle(
        color: Color(0xb3000000),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      displaySmall: TextStyle(
        color: Color(0xb3ffffff),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      displayMedium: TextStyle(
        color: Color(0xff000000),
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      displayLarge: TextStyle(
        color: Color(0xff000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headlineSmall: TextStyle(
        color: Color(0xff000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      titleLarge: TextStyle(
        color: Color(0xff007C30),
        fontSize: 10,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      titleMedium: TextStyle(
        color: Color(0xff000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyMedium: TextStyle(
        color: Color(0xff969696),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyLarge: TextStyle(
        color: Color(0xff000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodySmall: TextStyle(
        color: Color(0xff000000),
        fontSize: 10,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      titleSmall: TextStyle(
        color: Color(0xff000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      labelSmall: TextStyle(
        color: Color(0xff000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return Colors.black;
            else if (states.contains(MaterialState.disabled))
              return Colors.grey;
            return Colors.black; // Use the component's default.
          },
        ),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
            return EdgeInsets.symmetric(vertical: 15, horizontal: 30);
          },
        ),
        // backgroundColor:
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Colors.white; // Use the component's default.
          },
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            // if (states.contains(MaterialState.pressed))
            //   return TextStyle(
            //     fontFamily: fontFamily,
            //     color: Colors.white,
            //     fontSize: 15,
            //     fontWeight: FontWeight.w600,
            //   );
            // else if (states.contains(MaterialState.disabled))
            //   return TextStyle(
            //     fontFamily: fontFamily,
            //     color: Colors.white,
            //     fontSize: 15,
            //     fontWeight: FontWeight.w600,
            //   );
            return TextStyle(
              // color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            );
          },
        ), // backgroundColor:
        //     MaterialStateProperty.all(Colors.black),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(
  
          decoration: TextDecoration.none,
          color: Color(0xff969696),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        )),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
            return EdgeInsets.symmetric(vertical: 8, horizontal: 16);
          },
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.green.withOpacity(0.38),
          side: BorderSide(color: Color(0xff007C30)),
          textStyle: TextStyle(
           
            decoration: TextDecoration.none,
            color: Color(0xff969696),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10)),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,

        //change your color here
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      elevation: 0,
      shape: Border(
        bottom: BorderSide(color: Color(0xFFE5E5E5), width: 1),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(color: Colors.red),
      hintStyle: TextStyle(
        color: Color(0xFF808080),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: EdgeInsets.all(10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: AppColors.redLightColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      iconColor: Color(0xFF555555),
      prefixStyle: TextStyle(fontSize: 14),
      fillColor: AppColors.inputColor,
      filled: true,
    ),
    iconTheme: IconThemeData(
      color: Color(0xdd000000),
      opacity: 1,
      size: 24,
    ),
    primaryIconTheme: IconThemeData(
      color: Color(0xdd000000),
      opacity: 1,
      size: 24,
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 1.5, color: AppColors.brandColor)),
        color: Colors.white,
      ),
      labelColor: AppColors.brandColor,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelColor: Color(0xFF6B6B6B),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Color(0x1f000000),
      brightness: Brightness.light,
      deleteIconColor: Color(0xde000000),
      disabledColor: Color(0x0c000000),
      labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
      labelStyle: TextStyle(
        color: Color(0xde000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      padding: EdgeInsets.all(0),
      secondaryLabelStyle: TextStyle(
        color: Color(0x3d000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      secondarySelectedColor: Color(0x3d2196f3),
      selectedColor: Color(0x3d000000),
      shape: StadiumBorder(
          side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      )),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff000000),
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFF000000),
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xffffffff)),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Color(0xff007C30);
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Color(0xff007C30);
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Color(0xff007C30);
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Color(0xff007C30);
        }
        return null;
      }),
    ),
    colorScheme: ColorScheme.light(
      primary: Color(0xff007C30),
      secondary: Color(0xff808080),
    )
        .copyWith(primary: Colors.green, background: Color(0xff007C30))
        .copyWith(error: Color(0xffd32f2f)),
  );
}


InputDecoration bordredInputTheme() => InputDecoration(
      errorStyle: TextStyle(color: Colors.red),
      hintStyle: TextStyle(
        color: AppColors.lightGreyTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.all(10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: AppColors.dividerColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: AppColors.redLightColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: AppColors.dividerColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: AppColors.dividerColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: AppColors.dividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: AppColors.dividerColor),
      ),
      fillColor: Colors.white,
      filled: true,
    );
