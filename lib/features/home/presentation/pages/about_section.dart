import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/utils/responsive.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../widgets/stat_item.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 55.w),
      child: GlassCard(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 15.r : 20.r),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final info = state.homeInfo;
              if (isDesktop) {
                return desktopView(
                  info: info,
                  isMobile: isMobile,
                  isDesktop: isDesktop,
                );
              } else {
                return mobileView(
                  info: info,
                  isMobile: isMobile,
                  isDesktop: isDesktop,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _wrapStat(Widget child) =>
      Align(alignment: Alignment.centerLeft, child: child);

  Widget desktopView({
    HomeInfo? info,
    required bool isMobile,
    required bool isDesktop,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileImage(info: info, isMobile: isMobile, isDesktop: isDesktop),
          SizedBox(width: 28.w),
          Expanded(child: descriptionText(info: info)),
          SizedBox(width: 28.w),
          VerticalDivider(
            color: AppColors.textPrimary,
            thickness: 5,
            width: 10,
            radius: BorderRadius.circular(10.r),
          ),
          SizedBox(width: 28.w),
          Expanded(
            child: stats(info: info, isMobile: isMobile, isDesktop: isDesktop),
          ),
        ],
      ),
    );
  }

  Widget mobileView({
    HomeInfo? info,
    required bool isMobile,
    required bool isDesktop,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        profileImage(info: info, isMobile: isMobile, isDesktop: isDesktop),
        SizedBox(height: 10.h),
        descriptionText(info: info),
        SizedBox(height: 24.h),
        Divider(color: AppColors.divider, thickness: 1),
        SizedBox(height: 20.h),
        stats(isMobile: isMobile, isDesktop: isDesktop),
      ],
    );
  }

  Widget profileImage({
    HomeInfo? info,
    required bool isMobile,
    required bool isDesktop,
  }) {
    final image = Image.asset(
      AppImages.profile,
      width: isDesktop ? 220.w : (isMobile ? 320.w : 200.w),
      height: isDesktop ? 270.h : (isMobile ? 245.h : 218.h),
      fit: BoxFit.cover,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CachedNetworkImage(
        imageUrl: info?.profileUrl ?? "",
        width: isDesktop ? 220.w : (isMobile ? 320.w : 200.w),
        height: isDesktop ? 270.h : (isMobile ? 245.h : 218.h),
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => image,
        placeholder: (context, url) => image,
      ),
    );
  }

  Widget descriptionText({HomeInfo? info}) {
    return Text(
      info?.description ?? kBio,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 12.sp,
        color: AppColors.textSecondary,
        height: 1.7,
        letterSpacing: 0.3,

        fontFamily: AppFonts.inter,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget stats({
    HomeInfo? info,
    required bool isMobile,
    required bool isDesktop,
  }) {
    if (isMobile) {
      return Column(
        children: [
          _wrapStat(
            StatItem(
              iconAsset: AppIcons.experience,
              value: info?.totalExperience ?? '5.5 +',
              label: 'Years Of Experience',
            ),
          ),
          SizedBox(height: 15.h),
          _wrapStat(
            StatItem(
              iconAsset: AppIcons.projects,
              value: info?.totalProjects ?? '15 +',
              label: 'Projects Completed',
            ),
          ),
          SizedBox(height: 15.h),
          _wrapStat(
            StatItem(
              iconAsset: AppIcons.client,
              value: info?.clientSatisfaction ?? '100 %',
              label: 'Client Satisfaction',
            ),
          ),
        ],
      );
    } else {
      return Flex(
        direction: isDesktop ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: isDesktop
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          StatItem(
            iconAsset: AppIcons.experience,
            value: info?.totalExperience ?? '5.5 +',
            label: 'Years Of Experience',
          ),
          SizedBox(
            height: isDesktop ? 15.h : 0.0,
            width: isDesktop ? 0.0 : 12.w,
          ),
          StatItem(
            iconAsset: AppIcons.projects,
            value: info?.totalProjects ?? '15 +',
            label: 'Projects Completed',
          ),
          SizedBox(
            height: isDesktop ? 15.h : 0.0,
            width: isDesktop ? 0.0 : 12.w,
          ),
          StatItem(
            iconAsset: AppIcons.client,
            value: info?.clientSatisfaction ?? '100 %',
            label: 'Client Satisfaction',
          ),
        ],
      );
    }
  }
}

String kBio =
    "I'm a Flutter developer with over 5.5+ years of experience building "
    "high-performance, visually appealing, and scalable cross-platform "
    "applications. I specialize in creating pixel-perfect UI, efficient "
    "state management, and seamless real-time features using Flutter and "
    "Dart. My expertise includes clean architecture, performance "
    "optimization, secure API integration, and handling complex app logic "
    "with isolates and background services. I've worked on diverse "
    "projects including eCommerce apps, SaaS platforms, and real-time chat "
    "applications.";
