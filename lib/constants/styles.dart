
import 'package:app_check_poc/constants/dimension.dart';
import 'package:flutter/material.dart';

// normal text style
TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight, Color? color) => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );

// regular text style
TextStyle getRegularStyle({
  required Color color, double? fontSize,
}) => _getTextStyle(
    fontSize ?? FontSize.sp12,
    FontConstants.fontFamily,
    FontWeightManager.regular,
    color,
  );

// bold text style
TextStyle getBoldStyle({
  required Color color, double? fontSize,
}) => _getTextStyle(
    fontSize ?? FontSize.sp12,
    FontConstants.fontFamily,
    FontWeightManager.bold,
    color,
  );

// semibold text style
TextStyle getSemiBoldStyle({
  double? fontSize,
  Color? color,
}) => _getTextStyle(
    fontSize ?? FontSize.sp12,
    FontConstants.fontFamily,
    FontWeightManager.semiBold,
    color,
  );

// medium text style
TextStyle getMediumStyle({
  required Color color, double? fontSize,
}) => _getTextStyle(
    fontSize ?? FontSize.sp12,
    FontConstants.fontFamily,
    FontWeightManager.medium,
    color,
  );
