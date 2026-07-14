import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/circle_icon_button.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    if (isDesktop) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 6, child: _HeroText()),
            SizedBox(width: 30.w),
            Expanded(flex: 5, child: _HeroImage()),
          ],
        ),
      );
    }

    // Tablet / Mobile: stacked layout, image on top for visual impact.
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20.w : 40.w,
        vertical: 5.h,
      ),
      child: Stack(
        children: [
          Opacity(opacity: 0.2, child: _HeroImage()),
          _HeroText(centered: true),
        ],
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({this.centered = false});

  final bool centered;

  @override
  Widget build(BuildContext context) {
    final crossAlign = centered
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.start;
    final bool isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: isMobile ? 30.sp : 36.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.1,
            ),
            children: [
              const TextSpan(
                text: 'I Build Beautiful & \nHigh Performance\nApps With ',
              ),
              TextSpan(
                text: 'Flutter',
                style: TextStyle(color: AppColors.primaryBlue),
              ),
            ],
          ),
          textAlign: textAlign,
        ),
        SizedBox(height: 20.h),
        Text(
          'I create cross-platform applications that are fast, scalable '
          '\n& provide smooth user experience.',
          textAlign: textAlign,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondary,
            fontFamily: AppFonts.inter,
            fontStyle: FontStyle.normal,
            height: 1.2,
          ),
        ),
        SizedBox(height: 15.h),
        _DownloadResumeButton(),
        SizedBox(height: 10.h),
        BlocConsumer<HomeBloc, HomeState>(
          listener: (ctx, state) {},
          builder: (ctx, state) {
            List<ContactInfo> contacts = [];
            if (state is ContactLoaded) {
              contacts = state.contacts ?? [];
            }
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: centered
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Text(
                  "Let's connect",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: 16.w),

                CircleIconButton(
                  assetPath: AppIcons.github,
                  onTap: () {
                    String? url = contacts
                        .where((e) => e.contactType.contains("Github"))
                        .firstOrNull
                        ?.contactValue;
                    if (url != null) {
                      launchUrl(Uri.parse(url));
                    }
                  },
                ),
                SizedBox(width: 10.w),
                CircleIconButton(
                  assetPath: AppIcons.linkedin,
                  onTap: () {
                    String? url = contacts
                        .where((e) => e.contactType.contains("Linkedin"))
                        .firstOrNull
                        ?.contactValue;
                    if (url != null) {
                      launchUrl(Uri.parse(url));
                    }
                  },
                ),
                SizedBox(width: 10.w),
                CircleIconButton(
                  assetPath: AppIcons.gmail,
                  onTap: () async {
                    String? email = contacts
                        .where((e) => e.contactType.contains("Email"))
                        .firstOrNull
                        ?.contactValue;

                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10.r),
                        ),
                        titlePadding: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 10.w,
                        ),
                        insetPadding: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 10.w,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w,
                        ),
                        title: Text('Email'),
                        content: Column(
                          mainAxisSize: .min,
                          children: [
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                SelectableText(
                                  email ?? "",
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Clipboard.setData(
                                      ClipboardData(text: email ?? ""),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.copy_outlined,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 10.w),
                CircleIconButton(
                  assetPath: AppIcons.hackerrank,
                  onTap: () {
                    String? url = contacts
                        .where((e) => e.contactType.contains("HackerRank"))
                        .firstOrNull
                        ?.contactValue;
                    if (url != null) {
                      launchUrl(Uri.parse(url));
                    }
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _DownloadResumeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (ctx, state) {},
      builder: (context, state) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (state is InfoLoaded) {
              HomeInfo? info = state.homeInfo;
              launchUrl(Uri.parse(info?.resumeUrl ?? ""));
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.7),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Download Resume',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(
                  Icons.file_download_outlined,
                  color: Colors.white,
                  size: 20.r,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final double circleSize = isMobile
        ? 280.h
        : (Responsive.isTablet(context) ? 340.h : 340.h);

    return SizedBox(
      width: circleSize,
      height: circleSize,
      child: Image.asset(AppImages.homeImage, fit: BoxFit.contain),
    );
  }
}
