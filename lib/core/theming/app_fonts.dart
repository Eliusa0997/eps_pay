import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
  static TextStyle font28WhiteBold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle font14White = TextStyle(
    fontSize: 14.sp,
    color: Colors.white,
  );

  static TextStyle font10extTertiary = TextStyle(
    fontSize: 10.sp,
    color: AppColors.textTertiary,
  );

  static TextStyle font14W600textPrimary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle font13W600Primary = TextStyle(
    fontSize: 13.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
  );
}
