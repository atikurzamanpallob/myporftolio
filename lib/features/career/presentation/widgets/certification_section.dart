import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/models/work_experience.dart';

class CertificationSection extends StatelessWidget {
  const CertificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isDesktop = Responsive.isDesktop(context);
    final int columns = isMobile ? 1 : 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Certifications',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.only(
            left: isDesktop ? 110.w : 0.w,
            right: isDesktop ? 25.w : 0.w,
          ),
          child: GlassCard(
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: AppColors.divider, width: 1),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: kCertifications.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  mainAxisSpacing: 14.h,
                  crossAxisSpacing: 14.w,
                  mainAxisExtent: 64.h,
                ),
                itemBuilder: (context, index) {
                  final cert = kCertifications[index];
                  return _CertificationChip(
                    title: cert.title,
                    issuer: cert.issuer,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CertificationChip extends StatelessWidget {
  const _CertificationChip({required this.title, required this.issuer});

  final String title;
  final String issuer;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            issuer,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.accentGreen,
            ),
          ),
        ],
      ),
    );
  }
}
