import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';

class ProgressWindow extends StatefulWidget {
  const ProgressWindow({super.key});

  @override
  State<ProgressWindow> createState() => _ProgressWindowState();
}

class _ProgressWindowState extends State<ProgressWindow> {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: SizedBox(
        height: 400.h,
        width: 400.w,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
