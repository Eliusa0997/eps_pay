import 'package:easy_localization/easy_localization.dart';
import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class wellcomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  Widget? headerIcon;
  bool isAuth = false;
  Function()? onBackButtonPressed;
  LinearGradient? headerGradientColor;
  wellcomeCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.headerIcon,
    this.headerGradientColor,
    required this.isAuth,
    this.onBackButtonPressed,
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
        padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 80.h),
        child: Column(
          children: [
            Row(
              children: [
                isAuth
                    ? SizedBox()
                    : IconButton(
                        onPressed:
                            onBackButtonPressed ??
                            () => context.pushNamed(Routes.homeDashboardScreen),

                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.1),
                        ),
                      ),
              ],
            ),
            Container(
              height: 120.h,
              width: 120.w,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60.r),
              ),
              child:
                  headerIcon ??
                  Image.asset("assets/images/logo.png", height: 50, width: 50),
            ),
            SizedBox(height: 15.h),
            Text(title.tr(), style: AppFonts.font28WhiteBold),
            SizedBox(height: 4.h),
            Text(
              subTitle.tr(),
              style: AppFonts.font14White,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
