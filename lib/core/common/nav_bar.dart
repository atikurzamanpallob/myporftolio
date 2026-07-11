import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_resources/app_colors.dart';
import '../app_resources/app_icons.dart';
import '../utils/responsive.dart';

const List<String> kNavItems = [
  'Home',
  'Career',
  'Skills',
  'Projects',
  'Blogs',
  'Contact',
];

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key, required this.activeItem, this.onItemTap});

  final String activeItem;
  final ValueChanged<String>? onItemTap;

  @override
  Size get preferredSize => Size.fromHeight(64.h);

  @override
  Widget build(BuildContext context) {
    final bool showFullNav = Responsive.isDesktop(context);

    return Container(
      height: preferredSize.height,
      color: AppColors.navBackground,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 16.w : 40.w,
      ),
      child: Row(
        children: [
          _Logo(),
          const Spacer(),
          if (showFullNav)
            Row(
              children: kNavItems
                  .map(
                    (item) => _NavItem(
                      label: item,
                      onHover: () {},
                      isActive: item == activeItem,
                      onTap: () => onItemTap?.call(item),
                    ),
                  )
                  .toList(),
            )
          else
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded, color: Colors.white, size: 28.r),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.flutter, width: 34.r, height: 34.r),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pallob',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.accentGreen,
                height: 1.1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.isActive,
    this.onTap,
    this.onHover,
  });

  final String label;
  final bool isActive;
  final VoidCallback? onTap;
  final VoidCallback? onHover;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {},
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: isActive ? AppColors.primaryBlue : Colors.white,
                ),
              ),
              SizedBox(height: 4.h),
              if (isActive)
                Container(
                  height: 2.h,
                  width: 30.w,
                  color: AppColors.primaryBlue,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Slide-out drawer used on mobile / tablet widths in place of the full nav row.
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key, required this.activeItem, this.onItemTap});

  final String activeItem;
  final ValueChanged<String>? onItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.navBackground,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(20.r), child: _Logo()),
            Divider(color: AppColors.divider, height: 1),
            ...kNavItems.map(
              (item) => ListTile(
                title: Text(
                  item,
                  style: TextStyle(
                    color: item == activeItem
                        ? AppColors.primaryBlue
                        : Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  onItemTap?.call(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
