import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';

class ProjectThumbnails extends StatelessWidget {
  const ProjectThumbnails({
    super.key,
    required this.imageUrls,
    this.width = 180,
    this.height = 180,
  });

  final List<String> imageUrls;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      width: width.r,
      height: height.r,
      imageUrl: imageUrls.isNotEmpty ? imageUrls.first : "",
    );
  }
}

class _PhoneFrame extends StatelessWidget {
  const _PhoneFrame({
    required this.width,
    required this.height,
    required this.imageUrl,
  });

  final double width;
  final double height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.r)),
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) =>
              Image.asset(AppImages.placehHolder),
          placeholder: (context, url) => Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Image.asset(AppImages.placehHolder),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
