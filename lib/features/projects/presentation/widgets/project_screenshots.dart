import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/app_resources/app_images.dart';
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
  CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(10),
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
                      Column(
                        crossAxisAlignment: .center,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: .center,
                              children: [
                                for (int i = 0; i < images.length; i++) ...[
                                  Container(
                                    width: isMobileScreenshot ? 40.w : 80.w,
                                    height: isMobileScreenshot ? 80.h : null,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: currentIndex == i
                                            ? AppColors.cyan
                                            : Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 3.w,
                                    ),
                                    child: InkWell(
                                      onTap: () =>
                                          carouselController.animateToPage(
                                            i,
                                            duration: Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.linear,
                                          ),
                                      child: CachedNetworkImage(
                                        imageUrl: images[i],
                                        fit: BoxFit.contain,
                                        placeholder: (context, url) => Center(
                                          child:
                                              const CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image(
                                              image: AssetImage(
                                                AppImages.placehHolder,
                                              ),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),

                          SizedBox(height: 10.h),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.isMobile ? 10 : 40,
                            ),
                            child: CarouselSlider.builder(
                              carouselController: carouselController,
                              itemCount: images.length,
                              itemBuilder: (context, index, realIndex) {
                                String image = images[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),

                                    border: Border.all(
                                      color: index == currentIndex
                                          ? AppColors.cyan
                                          : Colors.transparent,
                                      width: 1.w,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: CachedNetworkImage(
                                      imageUrl: image,
                                      height: getHeight(isMobileScreenshot),
                                      placeholder: (context, url) => Center(
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image(
                                            image: AssetImage(
                                              AppImages.placehHolder,
                                            ),
                                          ),
                                    ),
                                  ),
                                );
                              },

                              options: CarouselOptions(
                                height: getHeight(isMobileScreenshot),
                                viewportFraction: getViewportFraction(
                                  isMobileScreenshot,
                                ),
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: true,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration: Duration(
                                  milliseconds: 1200,
                                ),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: getEnlargeFactor(
                                  isMobileScreenshot,
                                ),
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              carouselController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
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
                              carouselController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
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

  double getViewportFraction(bool isMobileScreenshot) {
    if (isMobileScreenshot) {
      if (context.isMobile) {
        return 0.8;
      } else if (context.isTablet || context.isLaptop) {
        return 0.5;
      } else {
        return 0.2;
      }
    } else {
      return 1;
    }
  }

  double getEnlargeFactor(bool isMobileScreenshot) {
    if (isMobileScreenshot) {
      if (context.isMobile) {
        return 0.8;
      } else if (context.isTablet || context.isLaptop) {
        return 0.5;
      } else {
        return 0.2;
      }
    } else {
      return 0.3;
    }
  }

  double? getHeight(bool isMobileScreenshot) {
    if (isMobileScreenshot) {
      if (context.isMobile) {
        return 580.h;
      } else if (context.isTablet || context.isLaptop) {
        return 650.h;
      } else {
        return 800.h;
      }
    } else {
      return null;
    }
  }
}
