import 'package:easy_localization/easy_localization.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 20.h, 12.w, 50.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () =>
                  context.pushReplacementNamed(Routes.checkReciverScreen),
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Text(
              'Transfer Money'.tr(),
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 40.w),
          ],
        ),
      ),
    );
  }
}
