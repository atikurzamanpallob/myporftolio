import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({super.key, this.logoUrl, this.size});
  final String? logoUrl;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final double dim = size ?? 96.r;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CachedNetworkImage(
        imageUrl: logoUrl ?? "",
        width: dim,
        height: dim,
        fit: BoxFit.fill,
        placeholder: (context, url) => Image.asset(
          AppImages.placehHolder,
          width: dim,
          height: dim,
          fit: BoxFit.cover,
        ),
        errorWidget: (context, url, error) => Image.asset(
          AppImages.placehHolder,
          width: dim,
          height: dim,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
