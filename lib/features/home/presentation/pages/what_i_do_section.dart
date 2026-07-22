import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/themes/responsive_text_theme.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/service_card.dart';

class WhatIDoSection extends StatelessWidget {
  const WhatIDoSection({super.key});

  static const _services = [
    (
      icon: AppIcons.mobile,
      title: 'Cross-Platform Apps',
      desc: 'Build once and ship on multi-platforms like android, ios & web',
    ),
    (
      icon: AppIcons.painter,
      title: 'Beautiful UI/UX',
      desc: 'Crafting clean, modern and intuitive user experience',
    ),
    (
      icon: AppIcons.meter,
      title: 'Performance Focused',
      desc: 'Optimized apps that are fast smooth and reliable',
    ),
    (
      icon: AppIcons.cloud,
      title: 'Backend Integration',
      desc: 'REST APIs, Firebase and more',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    final int columns = isMobile ? 1 : (isTablet ? 2 : 4);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.w : 40.w,
        vertical: 5.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What I Do', style: context.fontStyle.headlineSmall),
          SizedBox(height: 10.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisSpacing: 16.w,
              crossAxisSpacing: 16.w,
              mainAxisExtent: isMobile ? 115.h : 145.h,
            ),
            itemBuilder: (context, index) {
              final s = _services[index];
              return ServiceCard(
                iconAsset: s.icon,
                title: s.title,
                description: s.desc,
              );
            },
          ),
        ],
      ),
    );
  }
}
