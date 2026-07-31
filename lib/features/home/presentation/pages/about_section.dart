import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/themes/responsive_text_theme.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../widgets/stat_item.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.isMobile;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 40.w),
      child: GlassCard(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 15.r : 20.r),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final info = state.homeInfo;

              if (context.isMobile) {
                return mobileView(context, info);
              } else if (context.isTablet || context.isLaptop) {
                return tabletView(context, info);
              } else {
                return desktopView(context, info);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget mobileView(BuildContext context, HomeInfo? info) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Center(
          child: profileImage(
            imageUrl: info?.profileUrl ?? "",
            width: 200.w,
            height: 210.h,
          ),
        ),
        SizedBox(height: 10.h),
        descriptionText(info: info, context: context),
        SizedBox(height: 16.h),
        Divider(color: AppColors.divider, thickness: 1),
        SizedBox(height: 16.h),
        stats(context, info),
      ],
    );
  }

  Widget tabletView(BuildContext context, HomeInfo? info) {
    return Column(
      children: [
        Row(
          children: [
            profileImage(
              imageUrl: info?.profileUrl ?? "",
              width: 230.w,
              height: 200.h,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: descriptionText(info: info, context: context),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Divider(color: AppColors.divider, thickness: 1),
        SizedBox(height: 16.h),
        stats(context, info),
      ],
    );
  }

  Widget desktopView(BuildContext context, HomeInfo? info) {
    return IntrinsicHeight(
      child: Row(
        children: [
          profileImage(
            imageUrl: info?.profileUrl ?? "",
            width: 230.w,
            height: 250.h,
          ),
          SizedBox(width: 20.w),
          Expanded(
            flex: 7,
            child: descriptionText(info: info, context: context),
          ),
          SizedBox(width: 10.w),
          VerticalDivider(color: AppColors.divider, thickness: 2),
          SizedBox(width: 10.w),
          Expanded(flex: 3, child: stats(context, info)),
        ],
      ),
    );
  }

  Widget profileImage({
    required String imageUrl,
    required double width,
    required double height,
  }) {
    final image = Image.asset(
      AppImages.profile,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => image,
        placeholder: (context, url) => image,
      ),
    );
  }

  Widget descriptionText({HomeInfo? info, required BuildContext context}) {
    return Text(
      info?.description ?? kBio,
      textAlign: TextAlign.justify,
      style: context.fontStyle.bodySmall?.copyWith(
        color: AppColors.textSecondary,
        height: 1.7,
        letterSpacing: 0.3,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget stats(BuildContext context, HomeInfo? info) {
    return Wrap(
      alignment: .start,
      crossAxisAlignment: .start,
      direction: context.isTablet || context.isLaptop
          ? Axis.horizontal
          : Axis.vertical,
      children: [
        StatItem(
          iconAsset: AppIcons.experience,
          value: info?.totalExperience ?? '5.5 +',
          label: 'Years Of Experience',
        ),
        SizedBox(width: 20.w, height: 20.h),
        StatItem(
          iconAsset: AppIcons.projects,
          value: info?.totalProjects ?? '15 +',
          label: 'Projects Completed',
        ),
        SizedBox(width: 20.w, height: 20.h),
        StatItem(
          iconAsset: AppIcons.client,
          value: info?.clientSatisfaction ?? '100 %',
          label: 'Client Satisfaction',
        ),
      ],
    );
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
