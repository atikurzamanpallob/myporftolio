import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/circle_icon_button.dart';

class ExtraSection extends StatelessWidget {
  const ExtraSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool centered = !Responsive.isDesktop(context);
    final crossAlign = CrossAxisAlignment.start;
    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        _DownloadResumeButton(),
        SizedBox(height: 10.h),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            List<ContactInfo> contacts = [];
            contacts = state.contacts ?? [];

            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: centered
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Text(
                  "Let's connect",
                  style: context.fontStyle.bodySmall?.copyWith(
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
                                  style: context.fontStyle.bodySmall?.copyWith(
                                    color: AppColors.textPrimary,
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            HomeInfo? info = state.homeInfo;
            launchUrl(Uri.parse(info?.resumeUrl ?? ""));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.8),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Download Resume',
                  style: context.fontStyle.bodySmall?.copyWith(
                    color: AppColors.textPrimary,
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
