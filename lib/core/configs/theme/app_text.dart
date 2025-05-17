import 'package:flutter/material.dart';
import 'package:marabh/core/configs/theme/app_colors.dart';

class AppText {
  static const lightText = TextTheme(
    titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40,
        color: AppColors.lightPrimary),
    titleMedium: TextStyle(
        fontWeight: FontWeight.w700, fontSize: 24, color: AppColors.black),
    bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.lightPrimary),
    bodySmall: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.black),
    labelMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.backgroundCategories),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.lightBackground),
    displaySmall: TextStyle(
<<<<<<< HEAD
        fontWeight: FontWeight.w300, fontSize: 16, color: Colors.black),
=======
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 15,
    ),
>>>>>>> c92adb2aaad40f2799e81c394ce719ead3ad6726
  );

  static const darkText = TextTheme(
    titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40,
        color: AppColors.darkPrimary),
    titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: AppColors.lightBackground),
    bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.darkPrimary),
    labelMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.lightBackground),
    bodySmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.lightBackground),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.lightBackground),
    displaySmall: TextStyle(
<<<<<<< HEAD
        fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white),
=======
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 15,
    ),
>>>>>>> c92adb2aaad40f2799e81c394ce719ead3ad6726
  );
}
