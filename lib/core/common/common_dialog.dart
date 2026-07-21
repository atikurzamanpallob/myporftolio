// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void CommonDialog({required Widget child, required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white.withValues(alpha: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10.r),
        ),
        child: child,
      );
    },
  );
}
