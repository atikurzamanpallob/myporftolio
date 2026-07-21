import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';
import 'package:myportfolioapp/features/career/presentation/bloc/career_bloc.dart';
import 'package:myportfolioapp/features/career/presentation/bloc/career_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/responsive.dart';

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
              child: BlocBuilder<CareerBloc, CareerState>(
                builder: (context, state) {
                  List<CertificationItem> certificates =
                      (state.certificates?.isEmpty ?? false)
                      ? fallBackItems
                      : state.certificates ?? fallBackItems;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: certificates.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: isDesktop ? 1.15 : 1,
                      crossAxisCount: columns,
                      mainAxisSpacing: 14.h,
                      crossAxisSpacing: 14.w,
                    ),
                    itemBuilder: (context, index) {
                      final cert = certificates[index];
                      return _CertificationChip(
                        title: cert.title,
                        issuer: cert.issuer,
                        imageUrl: cert.certificateImageUrl,
                        certificateurl: cert.certificateUrl,
                      );
                    },
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
  const _CertificationChip({
    required this.title,
    required this.issuer,
    required this.imageUrl,
    required this.certificateurl,
  });

  final String title;
  final String issuer;
  final String imageUrl;
  final String certificateurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 15.w),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(certificateurl));
                },
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: AppColors.primaryBlue, width: 1),
                  ),
                  child: Icon(
                    Icons.arrow_outward,
                    size: 15.r,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            issuer,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.accentGreen,
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) =>
                  Image.asset(AppImages.placehHolder, fit: BoxFit.fill),
              placeholder: (context, url) =>
                  Image.asset(AppImages.placehHolder, fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
