import 'package:app_check_poc/configs/assets/colors.gen.dart';
import 'package:app_check_poc/configs/assets/fonts.gen.dart';
import 'package:app_check_poc/constants/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore_for_file: public_member_api_docs
// ignore_for_file: avoid_classes_with_only_static_members
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: AppFonts.latoRegular,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primaryColor,

    //!appbar
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      color: AppColors.white,
      titleTextStyle: TextStyle(color: AppColors.primaryColor),
      elevation: 0,
    ),

    //! Text
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeightManager.semiBold,
        color: AppColors.primaryColor,
        fontFamily: AppFonts.latoRegular,
      ),
      displayLarge: TextStyle(letterSpacing: 1, fontWeight: FontWeightManager.semiBold, color: AppColors.primaryColor),
    ).apply(bodyColor: AppColors.primaryColor),
    buttonTheme: const ButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
        textStyle: MaterialStateProperty.all(const TextStyle(color: AppColors.white)),
      ),
    ),
    //! dialog
    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.white,
      contentTextStyle: TextStyle(color: AppColors.primaryColor),
      titleTextStyle: TextStyle(color: AppColors.primaryColor),
    ),

    //! Input decoration
    inputDecorationTheme: InputDecorationTheme(
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      hintStyle: const TextStyle(color: AppColors.primaryColor, fontSize: 11),
      fillColor: AppColors.primaryColor,
      border: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppRadius.r50),
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
    ),
  );
}
