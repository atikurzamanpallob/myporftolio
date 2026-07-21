// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_colors.dart';
import 'package:myportfolioapp/core/app_resources/app_constants.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_details_item.dart';
import 'package:flutter_code_view/flutter_code_view.dart';

import '../../../../core/utils/size_helper.dart';
import '../../../../core/utils/toast.dart';

class DescriptionItemCard extends StatelessWidget {
  final BlogDetailsItem? element;
  final bool isMobile;
  final bool isTab;
  const DescriptionItemCard({
    super.key,
    this.element,
    required this.isMobile,
    required this.isTab,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;
    switch (element?.type) {
      case AppConstants.Heading:
        return Text(
          element?.text ?? "",
          style: TextStyle(
            fontSize: isMobile ? 16.sp : 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        );

      case AppConstants.Body:
        return Text(
          element?.text ?? "",
          style: TextStyle(
            fontSize: SizeHelper.getBodyFontSize(
              isMobile: isMobile,
              isTab: isTab,
            ),
            fontFamily: AppFonts.inter,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        );
      case AppConstants.Spacer:
        return SizedBox(height: height * (element?.height ?? 1));
      case AppConstants.Image:
        return CachedNetworkImage(
          imageUrl: element?.fileUrl ?? "",
          fit: BoxFit.fill,
          width: width * (element?.width ?? 1),
          height: height * (element?.height ?? 1),
          errorWidget: (context, url, error) => Image.asset(
            AppImages.placehHolder,
            fit: BoxFit.cover,
            width: width * (element?.width ?? 1),
            height: height * (element?.height ?? 1),
          ),
          placeholder: (context, url) => Image.asset(
            AppImages.placehHolder,
            fit: BoxFit.cover,
            width: width * (element?.width ?? 1),
            height: height * (element?.height ?? 1),
          ),
        );

      case AppConstants.Video:
        return Container();
      case AppConstants.DartCode:
        return Stack(
          alignment: Alignment.topRight,
          children: [
            FlutterCodeView(
              source: element?.text ?? "",
              themeType: ThemeType.atomOneDark,
              language: Languages.dart,
              fontSize: SizeHelper.getBodyFontSize(
                isMobile: isMobile,
                isTab: isTab,
              ),
              borderRadiusCodeView: BorderRadius.circular(10.r),
              paddingBorder: EdgeInsets.all(1),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              autoDetection: true,
              borderColor: AppColors.background,
              showLineNumbers: true,
              selectionColor: AppColors.accentBlueLight.withValues(alpha: 0.5),
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(
                  ClipboardData(text: element?.text ?? ""),
                );
                showToast(context, "Copied to Clipboard!!");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.copy, color: AppColors.textPrimary),
              ),
            ),
          ],
        );
      case AppConstants.JsCode:
        return Stack(
          alignment: Alignment.topRight,
          children: [
            FlutterCodeView(
              source: element?.text ?? "",
              themeType: ThemeType.atomOneDark,
              language: Languages.javascript,
              fontSize: SizeHelper.getBodyFontSize(
                isMobile: isMobile,
                isTab: isTab,
              ),
              borderRadiusCodeView: BorderRadius.circular(10.r),
              paddingBorder: EdgeInsets.all(1),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              autoDetection: true,
              borderColor: AppColors.background,
              showLineNumbers: true,
              selectionColor: AppColors.accentBlueLight.withValues(alpha: 0.5),
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(
                  ClipboardData(text: element?.text ?? ""),
                );
                showToast(context, "Copied to Clipboard!!");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.copy, color: AppColors.textPrimary),
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
