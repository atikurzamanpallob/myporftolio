// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:myportfolioapp/core/app_resources/app_colors.dart';
// import 'package:myportfolioapp/core/app_resources/app_fonts.dart';
// import 'package:myportfolioapp/core/app_resources/app_icons.dart';
// import 'package:myportfolioapp/core/app_resources/app_images.dart';
// import 'package:myportfolioapp/core/common/glass_card.dart';
// import 'package:myportfolioapp/core/common/nav_bar.dart';
// import 'package:myportfolioapp/core/common/navigation.dart';
// import 'package:myportfolioapp/core/utils/responsive.dart';
// import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
// import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_bloc.dart';
// import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_state.dart';
// import '../../../home/presentation/pages/footer_section.dart';

// /// Route: /blogs/:id
// class BlogDetailsPage extends StatelessWidget {
//   const BlogDetailsPage({super.key, required this.blogId});

//   final int blogId;

//   static const String activeItem = 'Blogs';
//   static String routeFor(int id) => '/blogs/$id';

//   @override
//   Widget build(BuildContext context) {
//     final bool showDrawer = !Responsive.isDesktop(context);

//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: NavBar(
//         activeItem: activeItem,
//         onItemTap: (item) => navigateToSection(context, item),
//       ),
//       endDrawer: showDrawer
//           ? NavDrawer(
//               activeItem: activeItem,
//               onItemTap: (item) => navigateToSection(context, item),
//             )
//           : null,
//       body: BlocBuilder<BlogBloc, BlogState>(
//         builder: (context, state) {
//           if (state.isBlogLoading) {
//             return const Center(
//               child: CircularProgressIndicator(color: AppColors.primaryBlue),
//             );
//           }
//           final post = state.blogs.where((b) => b.id == blogId).firstOrNull;
//           if (post == null) {
//             return _EmptyState(onBack: () => context.pop());
//           }
//           final detail = _stub(post);
//           final otherPosts = state.blogs.where((b) => b.id != blogId).toList();
//           return _BlogDetailBody(detail: detail, recentPosts: otherPosts);
//         },
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Empty / error state
// // ─────────────────────────────────────────────────────────────────────────────

// class _EmptyState extends StatelessWidget {
//   const _EmptyState({required this.onBack});
//   final VoidCallback onBack;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.article_outlined, size: 64.r, color: AppColors.textMuted),
//           SizedBox(height: 16.h),
//           Text(
//             'Blog post not found',
//             style: TextStyle(
//               fontSize: 18.sp,
//               color: AppColors.textSecondary,
//               fontFamily: AppFonts.inter,
//             ),
//           ),
//           SizedBox(height: 24.h),
//           _OutlineButton(label: '← Back to Blogs', onTap: onBack),
//         ],
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Body
// // ─────────────────────────────────────────────────────────────────────────────

// class _BlogDetailBody extends StatelessWidget {
//   const _BlogDetailBody({required this.detail, required this.recentPosts});

//   final BlogDetailItem detail;
//   final List<BlogItem> recentPosts;

//   @override
//   Widget build(BuildContext context) {
//     final bool isMobile = Responsive.isMobile(context);
//     final bool isDesktop = Responsive.isDesktop(context);
//     final double hPad = isMobile
//         ? 16
//         : isDesktop
//         ? 80
//         : 40;

//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: hPad.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 24.h),
//             _BackButton(),
//             SizedBox(height: 20.h),
//             if (isDesktop)
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(flex: 7, child: _MainContent(detail: detail)),
//                   SizedBox(width: 24.w),
//                   SizedBox(
//                     width: 290.w,
//                     child: _Sidebar(detail: detail, recentPosts: recentPosts),
//                   ),
//                 ],
//               )
//             else
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _MainContent(detail: detail),
//                   SizedBox(height: 32.h),
//                   _Sidebar(detail: detail, recentPosts: recentPosts),
//                 ],
//               ),
//             SizedBox(height: 48.h),
//             const FooterSection(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Back button
// // ─────────────────────────────────────────────────────────────────────────────

// class _BackButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: () => context.pop(),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               padding: EdgeInsets.all(6.r),
//               decoration: BoxDecoration(
//                 color: AppColors.cardBackground,
//                 borderRadius: BorderRadius.circular(6.r),
//                 border: Border.all(color: AppColors.divider, width: 1),
//               ),
//               child: Icon(
//                 Icons.arrow_back_rounded,
//                 color: Colors.white,
//                 size: 16.r,
//               ),
//             ),
//             SizedBox(width: 10.w),
//             Text(
//               'Back to Blogs',
//               style: TextStyle(
//                 fontSize: 13.sp,
//                 color: AppColors.textSecondary,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: AppFonts.inter,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Main content
// // ─────────────────────────────────────────────────────────────────────────────

// class _MainContent extends StatelessWidget {
//   const _MainContent({required this.detail});
//   final BlogDetailItem detail;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _HeroBanner(detail: detail),
//         SizedBox(height: 20.h),
//         GlassCard(
//           child: Padding(
//             padding: EdgeInsets.all(24.r),
//             child: _ContentSections(sections: detail.sections),
//           ),
//         ),
//         SizedBox(height: 20.h),
//         _TagsRow(categoryName: detail.categoryName),
//       ],
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Hero banner
// // ─────────────────────────────────────────────────────────────────────────────

// class _HeroBanner extends StatelessWidget {
//   const _HeroBanner({required this.detail});
//   final BlogDetailItem detail;

//   @override
//   Widget build(BuildContext context) {
//     final bool isMobile = Responsive.isMobile(context);

//     return GlassCard(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(8.r),
//         child: SizedBox(
//           height: isMobile ? 240.h : 300.h,
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               // Thumbnail
//               CachedNetworkImage(
//                 imageUrl: detail.thumbnail,
//                 fit: BoxFit.cover,
//                 errorWidget: (_, __, ___) =>
//                     Image.asset(AppImages.placehHolder, fit: BoxFit.cover),
//                 placeholder: (_, __) =>
//                     Image.asset(AppImages.placehHolder, fit: BoxFit.cover),
//               ),
//               // Gradient — left-heavy so text stays readable
//               DecoratedBox(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.centerRight,
//                     end: Alignment.centerLeft,
//                     stops: const [0.0, 0.5, 1.0],
//                     colors: [
//                       Colors.transparent,
//                       AppColors.background.withValues(alpha: 0.75),
//                       AppColors.background.withValues(alpha: 0.97),
//                     ],
//                   ),
//                 ),
//               ),
//               // Bottom fade for mobile readability
//               if (isMobile)
//                 DecoratedBox(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       stops: const [0.4, 1.0],
//                       colors: [
//                         Colors.transparent,
//                         AppColors.background.withValues(alpha: 0.9),
//                       ],
//                     ),
//                   ),
//                 ),
//               // Text overlay
//               Padding(
//                 padding: EdgeInsets.all(isMobile ? 20.r : 32.r),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Category chip
//                     _CategoryChip(label: detail.categoryName),
//                     SizedBox(height: 14.h),
//                     // Title
//                     SizedBox(
//                       width: isMobile ? double.infinity : 500.w,
//                       child: Text(
//                         detail.title,
//                         style: TextStyle(
//                           fontSize: isMobile ? 20.sp : 28.sp,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white,
//                           height: 1.25,
//                           letterSpacing: -0.3,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     // Short description
//                     SizedBox(
//                       width: isMobile ? double.infinity : 460.w,
//                       child: Text(
//                         detail.shortDescription,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 12.5.sp,
//                           color: AppColors.textSecondary,
//                           fontFamily: AppFonts.inter,
//                           height: 1.5,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 18.h),
//                     // Meta row
//                     Wrap(
//                       spacing: 20.w,
//                       runSpacing: 8.h,
//                       crossAxisAlignment: WrapCrossAlignment.center,
//                       children: [
//                         _MetaChip(icon: AppIcons.calender, label: detail.date),
//                         _MetaChip(
//                           icon: AppIcons.minutesIcon,
//                           label: detail.readTime,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _CategoryChip extends StatelessWidget {
//   const _CategoryChip({required this.label});
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
//       decoration: BoxDecoration(
//         color: AppColors.primaryBlue.withValues(alpha: 0.15),
//         borderRadius: BorderRadius.circular(4.r),
//         border: Border.all(
//           color: AppColors.primaryBlue.withValues(alpha: 0.45),
//           width: 0.8,
//         ),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           fontSize: 11.sp,
//           fontWeight: FontWeight.w600,
//           color: AppColors.primaryBlue,
//           fontFamily: AppFonts.inter,
//           letterSpacing: 0.2,
//         ),
//       ),
//     );
//   }
// }

// class _MetaChip extends StatelessWidget {
//   const _MetaChip({required this.icon, required this.label});
//   final String icon;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//       decoration: BoxDecoration(
//         color: Colors.white.withValues(alpha: 0.07),
//         borderRadius: BorderRadius.circular(20.r),
//         border: Border.all(
//           color: Colors.white.withValues(alpha: 0.12),
//           width: 0.8,
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SvgPicture.asset(icon, height: 13.h, width: 13.w),
//           SizedBox(width: 6.w),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 11.sp,
//               color: AppColors.textSecondary,
//               fontFamily: AppFonts.inter,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Tags row (bottom of main content)
// // ─────────────────────────────────────────────────────────────────────────────

// class _TagsRow extends StatelessWidget {
//   const _TagsRow({required this.categoryName});
//   final String categoryName;

//   static const _tags = ['Flutter', 'Performance', 'Mobile', 'Best Practices'];

//   @override
//   Widget build(BuildContext context) {
//     return GlassCard(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
//         child: Row(
//           children: [
//             Text(
//               'Tags:',
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 color: AppColors.textMuted,
//                 fontFamily: AppFonts.inter,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(width: 12.w),
//             Expanded(
//               child: Wrap(
//                 spacing: 8.w,
//                 runSpacing: 6.h,
//                 children: _tags.map((t) => _TagChip(label: t)).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TagChip extends StatelessWidget {
//   const _TagChip({required this.label});
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         borderRadius: BorderRadius.circular(4.r),
//         border: Border.all(color: AppColors.divider, width: 0.8),
//       ),
//       child: Text(
//         '#$label',
//         style: TextStyle(
//           fontSize: 11.sp,
//           color: AppColors.textSecondary,
//           fontFamily: AppFonts.inter,
//         ),
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Content sections
// // ─────────────────────────────────────────────────────────────────────────────

// class _ContentSections extends StatelessWidget {
//   const _ContentSections({required this.sections});
//   final List<BlogContentSection> sections;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: sections.map((s) {
//         return Padding(
//           padding: EdgeInsets.only(bottom: 18.h),
//           child: switch (s.type) {
//             BlogContentType.paragraph => _ParagraphWidget(text: s.content),
//             BlogContentType.heading => _HeadingWidget(text: s.content),
//             BlogContentType.bulletList => _BulletListWidget(raw: s.content),
//             BlogContentType.codeBlock => _CodeBlockWidget(code: s.content),
//           },
//         );
//       }).toList(),
//     );
//   }
// }

// class _ParagraphWidget extends StatelessWidget {
//   const _ParagraphWidget({required this.text});
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: 13.5.sp,
//         color: AppColors.textSecondary,
//         fontFamily: AppFonts.inter,
//         height: 1.8,
//       ),
//     );
//   }
// }

// class _HeadingWidget extends StatelessWidget {
//   const _HeadingWidget({required this.text});
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 6.h),
//         Row(
//           children: [
//             Container(
//               width: 3.w,
//               height: 20.h,
//               margin: EdgeInsets.only(right: 10.w),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryBlue,
//                 borderRadius: BorderRadius.circular(2.r),
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.white,
//                   height: 1.3,
//                   letterSpacing: -0.2,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class _BulletListWidget extends StatelessWidget {
//   const _BulletListWidget({required this.raw});
//   final String raw;

//   @override
//   Widget build(BuildContext context) {
//     final items = raw.trim().split('\n').where((l) => l.isNotEmpty).toList();
//     return Container(
//       padding: EdgeInsets.all(16.r),
//       decoration: BoxDecoration(
//         color: AppColors.primaryBlue.withValues(alpha: 0.04),
//         borderRadius: BorderRadius.circular(8.r),
//         border: Border.all(
//           color: AppColors.primaryBlue.withValues(alpha: 0.15),
//           width: 0.8,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: items.map((item) {
//           return Padding(
//             padding: EdgeInsets.only(bottom: 8.h),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 7.h, right: 10.w),
//                   child: Container(
//                     width: 5.r,
//                     height: 5.r,
//                     decoration: const BoxDecoration(
//                       color: AppColors.primaryBlue,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Text(
//                     item,
//                     style: TextStyle(
//                       fontSize: 13.sp,
//                       color: AppColors.textSecondary,
//                       fontFamily: AppFonts.inter,
//                       height: 1.65,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// class _CodeBlockWidget extends StatefulWidget {
//   const _CodeBlockWidget({required this.code});
//   final String code;

//   @override
//   State<_CodeBlockWidget> createState() => _CodeBlockWidgetState();
// }

// class _CodeBlockWidgetState extends State<_CodeBlockWidget> {
//   bool _copied = false;

//   void _copy() async {
//     await Clipboard.setData(ClipboardData(text: widget.code));
//     setState(() => _copied = true);
//     await Future.delayed(const Duration(seconds: 2));
//     if (mounted) setState(() => _copied = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: const Color(0xFF060E1F),
//         borderRadius: BorderRadius.circular(8.r),
//         border: Border.all(color: AppColors.divider, width: 1),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header bar
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//             decoration: BoxDecoration(
//               color: AppColors.cardBackground.withValues(alpha: 0.6),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(8.r),
//                 topRight: Radius.circular(8.r),
//               ),
//               border: Border(
//                 bottom: BorderSide(color: AppColors.divider, width: 0.8),
//               ),
//             ),
//             child: Row(
//               children: [
//                 // Traffic-light dots
//                 Row(
//                   children: [
//                     _Dot(color: const Color(0xFFFF5F56)),
//                     SizedBox(width: 6.w),
//                     _Dot(color: const Color(0xFFFFBD2E)),
//                     SizedBox(width: 6.w),
//                     _Dot(color: const Color(0xFF27C93F)),
//                   ],
//                 ),
//                 const Spacer(),
//                 // Copy button
//                 MouseRegion(
//                   cursor: SystemMouseCursors.click,
//                   child: GestureDetector(
//                     onTap: _copy,
//                     child: AnimatedSwitcher(
//                       duration: const Duration(milliseconds: 200),
//                       child: _copied
//                           ? Row(
//                               key: const ValueKey('copied'),
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(
//                                   Icons.check_rounded,
//                                   size: 14.r,
//                                   color: AppColors.accentGreen,
//                                 ),
//                                 SizedBox(width: 4.w),
//                                 Text(
//                                   'Copied!',
//                                   style: TextStyle(
//                                     fontSize: 11.sp,
//                                     color: AppColors.accentGreen,
//                                     fontFamily: AppFonts.inter,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           : Row(
//                               key: const ValueKey('copy'),
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(
//                                   Icons.copy_rounded,
//                                   size: 13.r,
//                                   color: AppColors.textMuted,
//                                 ),
//                                 SizedBox(width: 4.w),
//                                 Text(
//                                   'Copy',
//                                   style: TextStyle(
//                                     fontSize: 11.sp,
//                                     color: AppColors.textMuted,
//                                     fontFamily: AppFonts.inter,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Code body
//           Padding(
//             padding: EdgeInsets.all(20.r),
//             child: SelectableText(
//               widget.code,
//               style: TextStyle(
//                 fontSize: 13.sp,
//                 color: const Color(0xFFB8C4D9),
//                 fontFamily: 'monospace',
//                 height: 1.75,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {
//   const _Dot({required this.color});
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 10.r,
//       height: 10.r,
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Sidebar
// // ─────────────────────────────────────────────────────────────────────────────

// class _Sidebar extends StatelessWidget {
//   const _Sidebar({required this.detail, required this.recentPosts});

//   final BlogDetailItem detail;
//   final List<BlogItem> recentPosts;

//   @override
//   Widget build(BuildContext context) {
//     final bool isMobile = Responsive.isMobile(context);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _AuthorCard(detail: detail),
//         SizedBox(height: 16.h),
//         _CategoriesCard(),
//         SizedBox(height: 16.h),
//         if (recentPosts.isNotEmpty) _RecentPostsCard(posts: recentPosts),
//         if (isMobile) SizedBox(height: 8.h),
//       ],
//     );
//   }
// }

// // ─── Author card ─────────────────────────────────────────────────────────────

// class _AuthorCard extends StatelessWidget {
//   const _AuthorCard({required this.detail});
//   final BlogDetailItem detail;

//   @override
//   Widget build(BuildContext context) {
//     return GlassCard(
//       child: Padding(
//         padding: EdgeInsets.all(20.r),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _SidebarHeading(title: 'About The Author'),
//             SizedBox(height: 16.h),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Avatar circle
//                 Container(
//                   width: 46.r,
//                   height: 46.r,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       colors: [
//                         AppColors.primaryBlue.withValues(alpha: 0.7),
//                         AppColors.accentGreen.withValues(alpha: 0.5),
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     border: Border.all(
//                       color: AppColors.primaryBlue.withValues(alpha: 0.4),
//                       width: 1.5,
//                     ),
//                   ),
//                   child: detail.authorAvatar != null
//                       ? ClipOval(
//                           child: CachedNetworkImage(
//                             imageUrl: detail.authorAvatar!,
//                             fit: BoxFit.cover,
//                           ),
//                         )
//                       : Icon(
//                           Icons.person_rounded,
//                           color: Colors.white,
//                           size: 26.r,
//                         ),
//                 ),
//                 SizedBox(width: 12.w),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         detail.authorName,
//                         style: TextStyle(
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white,
//                           height: 1.2,
//                         ),
//                       ),
//                       SizedBox(height: 3.h),
//                       Text(
//                         detail.authorRole,
//                         style: TextStyle(
//                           fontSize: 11.sp,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.accentGreen,
//                           fontFamily: AppFonts.inter,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 12.h),
//             Text(
//               detail.authorBio,
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 color: AppColors.textSecondary,
//                 fontFamily: AppFonts.inter,
//                 height: 1.6,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─── Categories card ─────────────────────────────────────────────────────────

// class _CategoriesCard extends StatelessWidget {
//   static const _categories = [
//     'All',
//     'Flutter',
//     'Firebase',
//     'Node',
//     'Problem Solving',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return GlassCard(
//       child: Padding(
//         padding: EdgeInsets.all(20.r),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _SidebarHeading(title: 'Categories'),
//             SizedBox(height: 12.h),
//             ..._categories.asMap().entries.map((entry) {
//               final isLast = entry.key == _categories.length - 1;
//               return Column(
//                 children: [
//                   MouseRegion(
//                     cursor: SystemMouseCursors.click,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10.h),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 4.w,
//                             height: 4.h,
//                             margin: EdgeInsets.only(right: 10.w),
//                             decoration: const BoxDecoration(
//                               color: AppColors.primaryBlue,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                           Expanded(
//                             child: Text(
//                               entry.value,
//                               style: TextStyle(
//                                 fontSize: 13.sp,
//                                 color: AppColors.textSecondary,
//                                 fontFamily: AppFonts.inter,
//                               ),
//                             ),
//                           ),
//                           Icon(
//                             Icons.chevron_right_rounded,
//                             size: 16.r,
//                             color: AppColors.textMuted,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   if (!isLast)
//                     Divider(
//                       height: 1,
//                       color: AppColors.divider.withValues(alpha: 0.4),
//                     ),
//                 ],
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─── Recent posts card ───────────────────────────────────────────────────────

// class _RecentPostsCard extends StatelessWidget {
//   const _RecentPostsCard({required this.posts});
//   final List<BlogItem> posts;

//   @override
//   Widget build(BuildContext context) {
//     final recent = posts.take(4).toList();

//     return GlassCard(
//       child: Padding(
//         padding: EdgeInsets.all(20.r),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _SidebarHeading(title: 'Recent Posts'),
//             SizedBox(height: 14.h),
//             ...recent.asMap().entries.map((entry) {
//               final isLast = entry.key == recent.length - 1;
//               return Column(
//                 children: [
//                   _RecentPostItem(post: entry.value),
//                   if (!isLast)
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 4.h),
//                       child: Divider(
//                         height: 1,
//                         color: AppColors.divider.withValues(alpha: 0.4),
//                       ),
//                     ),
//                 ],
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _RecentPostItem extends StatelessWidget {
//   const _RecentPostItem({required this.post});
//   final BlogItem post;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.h),
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         child: GestureDetector(
//           onTap: () => context.push(BlogDetailPage.routeFor(post.id)),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Thumbnail
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(6.r),
//                 child: SizedBox(
//                   width: 58.w,
//                   height: 46.h,
//                   child: CachedNetworkImage(
//                     imageUrl: post.thumbnail,
//                     fit: BoxFit.cover,
//                     errorWidget: (_, __, ___) =>
//                         Image.asset(AppImages.placehHolder, fit: BoxFit.cover),
//                     placeholder: (_, __) =>
//                         Image.asset(AppImages.placehHolder, fit: BoxFit.cover),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 12.w),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       post.title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                         height: 1.35,
//                         fontFamily: AppFonts.inter,
//                       ),
//                     ),
//                     SizedBox(height: 5.h),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.access_time_rounded,
//                           size: 11.r,
//                           color: AppColors.textMuted,
//                         ),
//                         SizedBox(width: 4.w),
//                         Text(
//                           post.date,
//                           style: TextStyle(
//                             fontSize: 10.sp,
//                             color: AppColors.textMuted,
//                             fontFamily: AppFonts.inter,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Shared helpers
// // ─────────────────────────────────────────────────────────────────────────────

// class _SidebarHeading extends StatelessWidget {
//   const _SidebarHeading({required this.title});
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 3.w,
//           height: 16.h,
//           margin: EdgeInsets.only(right: 8.w),
//           decoration: BoxDecoration(
//             color: AppColors.primaryBlue,
//             borderRadius: BorderRadius.circular(2.r),
//           ),
//         ),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w700,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _OutlineButton extends StatelessWidget {
//   const _OutlineButton({required this.label, required this.onTap});
//   final String label;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.primaryBlue, width: 0.8),
//             borderRadius: BorderRadius.circular(8.r),
//           ),
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 13.sp,
//               color: AppColors.primaryBlue,
//               fontFamily: AppFonts.inter,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
