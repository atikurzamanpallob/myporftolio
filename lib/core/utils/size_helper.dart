import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeHelper {
  static double getBodyFontSize({bool isMobile = false, bool isTab = false}) {
    return isMobile
        ? 8.sp
        : isTab
        ? 12.sp
        : 14.sp;
  }

  static double getBodyFontSize2({bool isMobile = false, bool isTab = false}) {
    return isMobile
        ? 8.sp
        : isTab
        ? 12.sp
        : 12.sp;
  }
}
