// import 'package:fmlfantasy/app/app_colors/app_colors.dart';
// import 'package:fmlfantasy/app/textstyles/textstyle.dart';
// import 'package:fmlfantasy/ui/helpers/commons.dart';
// import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class TournamentLabel extends GetView<HomeController> {
//   final String title;
//   final String iconPathN;
//   final String iconPathP;
//   final VoidCallback onPrevious;
//   final VoidCallback onNext;
//   final Color previousButtonColor;
//   final Color previousIconColor;
//   final Color nextButtonColor;
//   final Color nextIconColor;

//   const TournamentLabel({
//     super.key,
//     required this.title,
//     required this.iconPathN,
//     required this.iconPathP,
//     required this.onPrevious,
//     required this.onNext,
//     required this.previousButtonColor,
//     required this.nextButtonColor,
//     required this.previousIconColor,
//     required this.nextIconColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//     return LayoutBuilder(builder: (context, constraints) {
//       double maxWidth = constraints.maxWidth;
//       return Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             SizedBox(
//               width: Get.width * 0.6,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SvgPicture.asset(
//                     'assets/icons/publictournament.svg',
//                     height: maxWidth > 600 ? 20.h : 25.h,
//                     color: AppColors.primary,
//                   ),
//                   horizontalSpace(10.w),
//                   Text(
//                     title,
//                     style: globalTextStyle(
//                         fontSize: maxWidth > 600 ? 12.sp : 16.sp,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.white),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: onPrevious,
//                   child: Container(
//                     height: 30.h,
//                     width: 30.w,
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(5.r),
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle, color: previousButtonColor),
//                     // ignore: deprecated_member_use
//                     child: SvgPicture.asset('assets/icons/arrowleft.svg',
//                         height: 10.h,
//                         // ignore: deprecated_member_use
//                         color: previousIconColor),
//                   ),
//                 ),
//                 horizontalSpace(10.w),
//                 GestureDetector(
//                   onTap: onNext,
//                   child: Container(
//                     height: 30.h,
//                     width: 30.w,
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(5.r),
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle, color: nextButtonColor),
//                     // ignore: deprecated_member_use
//                     child: SvgPicture.asset('assets/icons/arrowright.svg',
//                         height: 10.h, color: nextIconColor),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
