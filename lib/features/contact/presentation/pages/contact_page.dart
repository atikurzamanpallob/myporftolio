import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/common/hero_header.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/common/nav_bar.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/utils/responsive.dart';
import '../../../home/presentation/pages/footer_section.dart';
import '../widgets/availability_card.dart';
import '../widgets/contact_form.dart';
import '../widgets/contact_info_card.dart';
import '../widgets/trust_badges_column.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const String activeItem = 'Contact';
  static const String route = "/contact";

  @override
  Widget build(BuildContext context) {
    final bool showDrawer = !Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: NavBar(
        activeItem: activeItem,
        onItemTap: (item) => navigateToSection(context, item),
      ),
      endDrawer: showDrawer
          ? NavDrawer(
              activeItem: activeItem,
              onItemTap: (item) => navigateToSection(context, item),
            )
          : null,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          const HeroHeader(
            heading1: "Let's Build Amazing \nThings ",
            heading2: 'Together',
            bodyText:
                'Have project in mind or just want to say Hi? I would love to hear from you.'
                '\nLet’s turn your ideas into real products.',
            backgroundImage: AppImages.contactImage,
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 40.w),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TrustBadgesColumn(),
                      SizedBox(height: 20.h),
                      const AvailabilityCard(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Expanded(flex: 4, child: TrustBadgesColumn()),
                      SizedBox(width: 24.w),
                      const Expanded(flex: 6, child: AvailabilityCard()),
                    ],
                  ),
          ),
          SizedBox(height: 28.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 40.w),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GlassCard(child: ContactForm()),
                      SizedBox(height: 20.h),
                      const GlassCard(child: ContactInfoCard()),
                    ],
                  )
                : IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(child: GlassCard(child: ContactForm())),
                        SizedBox(width: 24.w),
                        const Expanded(
                          child: GlassCard(child: ContactInfoCard()),
                        ),
                      ],
                    ),
                  ),
          ),
          SizedBox(height: 20.h),
          const FooterSection(),
        ],
      ),
    );
  }
}
