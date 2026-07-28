import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/common/glass_card.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_state.dart';
import 'contents_header.dart';

class ProjectScreenshots extends StatefulWidget {
  const ProjectScreenshots({super.key});

  @override
  State<ProjectScreenshots> createState() => _ProjectScreenshotsState();
}

class _ProjectScreenshotsState extends State<ProjectScreenshots> {
  bool isHovering = false;
  int? hoveredIndex;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ContentsHeader(
              icon: AppIcons.screenshots,
              title: "Screenshots",
              iconColor: AppColors.magenta,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  bool isMobileScreenshot = state.projectItem?.type == 0;
                  List<String> images = state.projectDetails?.screenshots ?? [];

                  return Stack(
                    alignment: .center,
                    children: [
                      Container(
                        height: 550.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.isMobile ? 10 : 45,
                        ),
                        child: ScrollablePositionedList.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) =>
                              item(images[index], index, isMobileScreenshot),
                          itemScrollController: itemScrollController,
                          scrollOffsetController: scrollOffsetController,
                          itemPositionsListener: itemPositionsListener,
                          scrollOffsetListener: scrollOffsetListener,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (counter >= 1) {
                                setState(() {
                                  counter = counter == images.length
                                      ? counter - 1
                                      : counter;
                                });
                                itemScrollController.scrollTo(
                                  index: counter--,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOutCubic,
                                );
                              }
                            },
                            icon: Container(
                              padding: EdgeInsets.all(5),

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryBlue,
                              ),
                              child: Icon(Icons.arrow_back_ios),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (counter < images.length) {
                                setState(() {
                                  counter = counter == 0
                                      ? counter + 1
                                      : counter;
                                });
                                itemScrollController.scrollTo(
                                  index: counter++,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                            icon: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryBlue,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(String image, int index, bool isMobileScreenshot) {
    final isHovered = hoveredIndex == index;
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          hoveredIndex = null;
        });
      },
      child: AnimatedScale(
        scale: context.isDesktop || context.isTablet
            ? isHovered
                  ? 1.15
                  : 1
            : 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? 0.35 : 0.15),
                blurRadius: isHovered ? 30 : 10,
                spreadRadius: isHovered ? 5 : 0,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: image,
              height: 550.h,
              width: isMobileScreenshot ? null : 600.w,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
