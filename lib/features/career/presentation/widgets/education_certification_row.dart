import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive.dart';
import 'certification_section.dart';
import 'education_section.dart';

class EducationCertificationRow extends StatelessWidget {
  const EducationCertificationRow({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    if (isMobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const EducationSection(),
            SizedBox(height: 24.h),
            const CertificationSection(),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: 40.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EducationSection(),
            SizedBox(height: 20.h),
            CertificationSection(),
          ],
        ),
      );
    }
  }
}
