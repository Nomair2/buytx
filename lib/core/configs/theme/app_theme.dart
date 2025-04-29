import 'package:flutter/material.dart';
import 'package:marabh/core/configs/theme/app_colors.dart';
import 'package:marabh/core/configs/theme/app_text.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.dark(
      surface:AppColors.lightBackground,
        onSecondary: Colors.black,
        onBackground: AppColors.lightButton,
        brightness: Brightness.light,
        inversePrimary: Color(0xff4D4E4D),
        primaryContainer: AppColors.lightBackground),
    textTheme: AppText.lightText,
    // fontFamily: 'CircularStd',
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.lightBackground,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //     filled: true,
    //     fillColor: AppColors.secondBackground,
    //     hintStyle: const TextStyle(
    //       color: Color(0xffA7A7A7),
    //       fontWeight: FontWeight.w400,
    //     ),
    //     contentPadding: const EdgeInsets.all(16),
    //     border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(4),
    //         borderSide: BorderSide.none),
    //     enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(4),
    //         borderSide: BorderSide.none)),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         backgroundColor: AppColors.lightButton,
    //         elevation: 2,
    //         textStyle:
    //             const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(100)))
    //             )
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: AppText.darkText,
    colorScheme: ColorScheme.dark(
        surface: AppColors.darkBackground,
        onSecondary: Colors.white,
        onBackground: AppColors.darkButton,
        brightness: Brightness.dark,
        inversePrimary: Colors.white,
        primaryContainer: AppColors.black),
    // fontFamily: 'CircularStd',
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.darkBackground,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //     filled: true,
    //     fillColor: AppColors.secondBackground,
    //     hintStyle: const TextStyle(
    //       color: Color(0xffA7A7A7),
    //       fontWeight: FontWeight.w400,
    //     ),
    //     contentPadding: const EdgeInsets.all(16),
    //     border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(4),
    //         borderSide: BorderSide.none),
    //     enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(4),
    //         borderSide: BorderSide.none)),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         backgroundColor: AppColors.darkButton,
    //         elevation: 2,
    //         textStyle:
    //             const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(100))))
  );
}
