import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';

class ScreenShotPreview extends StatefulWidget {
  final List<PlatformFile> files;
  final bool isMobileScreenshot;
  const ScreenShotPreview({
    super.key,
    required this.files,
    this.isMobileScreenshot = false,
  });

  @override
  State<ScreenShotPreview> createState() => _ScreenShotPreviewState();
}

class _ScreenShotPreviewState extends State<ScreenShotPreview> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10.h,
      spacing: 10.w,
      direction: Axis.horizontal,
      children: [
        for (int i = 0; i < widget.files.length; i++)
          Stack(
            children: [
              Container(
                height: 200.r,
                width: widget.isMobileScreenshot == true ? 80.w : 200.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0.1, color: AppColors.primaryBlue),
                ),
                child: Image.memory(widget.files[i].bytes!, fit: BoxFit.fill),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () => setState(() => widget.files.removeAt(i)),
                  child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 12, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
