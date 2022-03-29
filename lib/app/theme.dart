import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSizes {
  static const double appBarBgGapRatio = 0.26;
  static const double appBarExpandedRatio = 0.18;
  static const double appBarRadius = 20;
  static const double searchInputRadius = 10;
  static const double categoryCardRadius = 11;
  static const double gridTilePadding = 13;

  // 135,43
  static const double extendedFloatingWidth = 140;
  static const double floatingHeight = 43;
  static const double extendedFloatingRadius = 50;

  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);

  static const appBarSize = 56.0;
  static const appBarExpandedSize = 180.0;
  static const appSideGap = 24.0;
  static const appTopGap = 30.0;
}

class AppColors {
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFFF2F2F2);
  static const darkGray = Color(0xFF535252);
  static const white = Color(0xFFFFFFFF);
  static const backgroundGrey = Color(0xFFF2F2F2);
  static const background = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const amber = Colors.amber;
  static const turquoise = Color(0xFF0CB8B6);
  static const middleBlue = Color(0xFF5C86CE);
  static const purple = Color(0xFF9F5DE2);
  static const searchInputColor = Color(0x40FFFFFF);
  static const floatingBtnShadowColor = Color(0x59FE806F);

  static const purpleGradient = LinearGradient(
      // tileMode: TileMode.repeated,
      begin: FractionalOffset(0.29, 0),
      end: FractionalOffset(0.8, 0),
      colors: [Color(0xEB7A08FA), Color(0xFFAD3BFC)]);

  static const redGradient = LinearGradient(
      begin: FractionalOffset(0.39, 0),
      end: FractionalOffset(0.8, 0),
      colors: [Color(0xFFFE806F), Color(0xFFE5366A)]);
// linear-gradient(88.2deg, #FE806F -0.18%, #E5366A 98.87%)
}

class AppTheme {
  static const headline2Style =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const captionStyle = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.darkGray);

  static final light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Proxima-Nova',
    // primarySwatch: Colors.deepPurple,

    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,
    ).copyWith(
      secondary: AppColors.middleBlue,
    ),
    // ignore: prefer_const_constructors
    textTheme: TextTheme(
      headline1: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      headline2: headline2Style,
      caption: headline2Style,
      subtitle1: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline3: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.darkGray,
          letterSpacing: 1.1
          // height: 16.5,
          ),
      headline4: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        // height: 16.5,
      ),
      button: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(color: AppColors.purple),
      unselectedLabelStyle: captionStyle.copyWith(height: 2),
      selectedLabelStyle:
          captionStyle.copyWith(color: AppColors.purple, height: 2),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.searchInputColor,
      prefixIconColor: AppColors.white,
      filled: true,
      hintStyle: headline2Style.copyWith(fontSize: 12, color: AppColors.white),
      contentPadding: const EdgeInsets.only(top: 12),
      isCollapsed: true,
      // isDense: true,
      border: OutlineInputBorder(
        borderSide: const BorderSide(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(
          AppSizes.searchInputRadius,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(
          AppSizes.searchInputRadius,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(
          AppSizes.searchInputRadius,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            primary: AppColors.purple,
            backgroundColor: AppColors.white,
            side: BorderSide(color: AppColors.purple,width: 2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            textStyle: const TextStyle(color: AppColors.purple))),

    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
