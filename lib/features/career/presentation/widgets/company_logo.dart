import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../data/models/work_experience.dart';

/// Renders the small square logo/avatar shown on each experience card.
///
/// The design's resource pack didn't include the actual company logo
/// files, so this widget generates a clean placeholder:
/// - [LogoStyle.freelancer] -> a dark circular "hacker" avatar with a
///   "FREELANCER" ribbon, matching the mockup's freelance entry.
/// - [LogoStyle.initials] -> a white card with the company's initials in
///   the brand-ish orange/navy duotone used in the mockup.
///
/// Once you have real logo files, just pass [logoAsset] on the
/// [WorkExperience] and this widget will render that image instead.
class CompanyLogo extends StatelessWidget {
  const CompanyLogo({
    super.key,
    required this.company,
    required this.style,
    this.logoAsset,
    this.size,
  });

  final String company;
  final LogoStyle style;
  final String? logoAsset;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final double dim = size ?? 96.r;

    if (logoAsset != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset(
          logoAsset!,
          width: dim,
          height: dim,
          fit: BoxFit.cover,
        ),
      );
    }

    return style == LogoStyle.freelancer
        ? _FreelancerBadge(size: dim)
        : _InitialsLogo(company: company, size: dim);
  }
}

class _FreelancerBadge extends StatelessWidget {
  const _FreelancerBadge({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF0C1D33),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
              width: size * 0.66,
              height: size * 0.66,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF2E9BFA), Color(0xFF0C4A82)],
                ),
              ),
              child: Icon(
                Icons.face_retouching_natural_rounded,
                color: Colors.white,
                size: size * 0.36,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              color: Colors.black.withValues(alpha: 0.55),
              alignment: Alignment.center,
              child: Text(
                'FREELANCER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.5.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InitialsLogo extends StatelessWidget {
  const _InitialsLogo({required this.company, required this.size});
  final String company;
  final double size;

  String get _initials {
    final words = company.trim().split(RegExp(r'\s+'));
    if (words.isEmpty) return '?';
    if (words.length == 1) return words.first.substring(0, 1).toUpperCase();
    return (words[0].substring(0, 1) + words[1].substring(0, 1)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final initials = _initials;
    final first = initials.isNotEmpty ? initials[0] : '';
    final rest = initials.length > 1 ? initials.substring(1) : '';

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: first,
                  style: TextStyle(
                    fontSize: size * 0.34,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFFE8622C),
                    height: 1,
                  ),
                ),
                TextSpan(
                  text: rest,
                  style: TextStyle(
                    fontSize: size * 0.34,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1B2A4A),
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size * 0.04),
          Text(
            company,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: size * 0.1,
              fontWeight: FontWeight.w600,
              color: AppColors.background,
            ),
          ),
        ],
      ),
    );
  }
}
