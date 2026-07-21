import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/features/contact/data/models/contact_models.dart';
import 'package:myportfolioapp/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:myportfolioapp/features/contact/presentation/bloc/contact_state.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        List<ContactInfo> contacts =
            state.contacts?.where((ob) => ob.id >= 4).toList() ?? [];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get In Touch',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 18.h),
              for (final item in contacts)
                Padding(
                  padding: EdgeInsets.only(bottom: 14.h),
                  child: _ContactInfoRow(item: item),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ContactInfoRow extends StatelessWidget {
  const _ContactInfoRow({required this.item});
  final ContactInfo item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          colors: [
            AppColors.cardBackground.withValues(alpha: 0.2),
            AppColors.cardBackground.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42.r,
            height: 42.r,
            padding: EdgeInsets.all(9.r),
            decoration: BoxDecoration(
              color: AppColors.iconCircleFill,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.iconCircleBorder, width: 1),
            ),
            child: SvgPicture.asset(icons[item.id - 1]),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.contactType,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  item.contactValue,
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    fontFamily: AppFonts.inter,
                    color: AppColors.textSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
