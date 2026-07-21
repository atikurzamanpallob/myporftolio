import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_colors.dart';
import 'package:myportfolioapp/core/app_resources/app_constants.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/description_elements.dart';
import 'package:flutter_code_view/flutter_code_view.dart';

class DescriptionCard extends StatelessWidget {
  final DescriptionItem? element;
  const DescriptionCard({super.key, this.element});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;
    switch (element?.type) {
      case AppConstants.Heading:
        return Text(
          element?.text ?? "",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        );

      case AppConstants.Body:
        return Text(
          element?.text ?? "",
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: AppFonts.inter,
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        );
      case AppConstants.Spacer:
        return Container(
          color: AppColors.accentGreen,
          height: height * (element?.height ?? 1),
        );
      case AppConstants.Image:
        return element?.file != null
            ? Image.memory(
                element!.file!.bytes!,
                fit: BoxFit.fill,
                width: width * (element?.width ?? 1),
                height: height * (element?.height ?? 1),
              )
            : SizedBox.shrink();
      case AppConstants.Video:
        return Container();
      case AppConstants.DartCode:
        return FlutterCodeView(
          source: element?.text ?? "",
          themeType: ThemeType.atomOneDark,
          language: Languages.dart,
          borderRadiusCodeView: BorderRadius.circular(10.r),
          paddingBorder: EdgeInsets.all(1),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          autoDetection: true,
          borderColor: AppColors.background,
          showLineNumbers: true,
          selectionColor: AppColors.accentBlueLight.withValues(alpha: 0.5),
        );
      case AppConstants.JsCode:
        return FlutterCodeView(
          source: element?.text ?? "",
          themeType: ThemeType.atomOneDark,
          language: Languages.javascript,
          borderRadiusCodeView: BorderRadius.circular(10.r),
          paddingBorder: EdgeInsets.all(1),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          autoDetection: true,

          borderColor: AppColors.background,
          showLineNumbers: true,
          selectionColor: AppColors.accentBlueLight.withValues(alpha: 0.5),
        );

      default:
        return Container();
    }
  }
}
