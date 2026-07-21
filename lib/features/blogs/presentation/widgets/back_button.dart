import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';

import '../../../../core/themes/app_colors.dart';
import '../pages/blogs_page.dart';

class BlogBackButton extends StatelessWidget {
  const BlogBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go(BlogsPage.route);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: AppColors.divider, width: 1),
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 16.r,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              'Back to Blogs',
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.inter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
