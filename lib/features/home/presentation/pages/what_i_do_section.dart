import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/features/home/domain/entity/service_item.dart';
import 'package:myportfolioapp/features/home/presentation/widgets/service_card.dart';
import '../../../../core/themes/responsive_text_theme.dart';

class WhatIDoSection extends StatelessWidget {
  const WhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 16.w : 40.w,
        vertical: 5.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What I Do', style: context.fontStyle.headlineSmall),
          SizedBox(height: 15.h),
          context.isMobile
              ? mobileView()
              : context.isTablet || context.isLaptop
              ? tabletView()
              : desktopView(),
        ],
      ),
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        ServiceCard(serviceItem: serviceItems[0]),
        SizedBox(height: 10.h),
        ServiceCard(serviceItem: serviceItems[1]),
        SizedBox(height: 10.h),
        ServiceCard(serviceItem: serviceItems[2]),
        SizedBox(height: 10.h),
        ServiceCard(serviceItem: serviceItems[3]),
      ],
    );
  }

  Widget tabletView() {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: ServiceCard(serviceItem: serviceItems[0])),
              SizedBox(width: 10.w),
              Expanded(child: ServiceCard(serviceItem: serviceItems[1])),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: ServiceCard(serviceItem: serviceItems[2])),
              SizedBox(width: 10.w),
              Expanded(child: ServiceCard(serviceItem: serviceItems[3])),
            ],
          ),
        ),
      ],
    );
  }

  Widget desktopView() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: ServiceCard(serviceItem: serviceItems[0])),
          SizedBox(width: 10.w),
          Expanded(child: ServiceCard(serviceItem: serviceItems[1])),
          SizedBox(width: 10.w),
          Expanded(child: ServiceCard(serviceItem: serviceItems[2])),
          SizedBox(width: 10.w),
          Expanded(child: ServiceCard(serviceItem: serviceItems[3])),
        ],
      ),
    );
  }
}
