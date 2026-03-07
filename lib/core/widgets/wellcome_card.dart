import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class wellcomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  IconData? headerIcon;
  LinearGradient? headerGradientColor;
  wellcomeCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.headerIcon,
    this.headerGradientColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: headerGradientColor ?? AppColors.primaryGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 48.h, 24.w, 80.h),
        child: Column(
          children: [
            Container(
              height: 120.h,
              width: 120.w,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60.r),
              ),
              child: Image.asset(
                "assets/images/logo.png",
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(height: 15.h),
            Text(title, style: AppFonts.font28WhiteBold),
            SizedBox(height: 4.h),
            Text(
              subTitle,
              style: AppFonts.font14White,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
