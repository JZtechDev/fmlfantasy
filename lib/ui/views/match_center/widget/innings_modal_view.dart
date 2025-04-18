// import 'package:fmlfantasy/app/app_images/app_images.dart';
// import 'package:fmlfantasy/app/textstyles/textstyle.dart';
// import 'package:fmlfantasy/core/imports/imports.dart';
// import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
// import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
// import 'package:flutter_svg/svg.dart';

// class InningsModal extends GetView<MatchCenterInner> {
//   const InningsModal({
//     super.key,
//     required this.homebastsman1,
//     required this.hometopbatsman2,
//     required this.homebowler1,
//     required this.homebowler2,
//     required this.homeImageUrl,
//     required this.homeName,
//     required this.awaybastsman1,
//     required this.awaytopbatsman2,
//     required this.awaybowler1,
//     required this.awaybowler2,
//     required this.awayImageUrl,
//     required this.awayName,
//   });

//   final String homebastsman1;
//   final String hometopbatsman2;
//   final String homebowler1;
//   final String homebowler2;
//   final String homeImageUrl;
//   final String homeName;
//   final String awaybastsman1;
//   final String awaytopbatsman2;
//   final String awaybowler1;
//   final String awaybowler2;
//   final String awayImageUrl;
//   final String awayName;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       insetPadding:
//           EdgeInsets.only(left: 15.w, right: 15.w, top: 146.h, bottom: 140.h),
//       backgroundColor: AppColors.white,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.only(
//                   left: 2.5.w, right: 2.5.w, bottom: 2.5.h, top: 2.5.h),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5.r),
//                   color: AppColors.grey),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 10.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // ignore: unnecessary_null_comparison
//                         homeImageUrl == null
//                             ? const SizedBox(
//                                 height: 30,
//                                 width: 30,
//                               )
//                             : homeImageUrl.endsWith('.png')
//                                 ? Image.network(
//                                     homeImageUrl,
//                                     height: 22.h,
//                                     width: 22.w,
//                                   )
//                                 : controller.sportsCode == 'CR'
//                                     ? Image.network(
//                                         replaceSvgWithPng(homeImageUrl),
//                                         height: 22.h,
//                                         width: 22.w,
//                                       )
//                                     : SvgPicture.network(
//                                         homeImageUrl,
//                                         height: 22.h,
//                                         width: 22.w,
//                                       ),
//                         horizontalSpace(10.w),
//                         Text(
//                           homeName,
//                           style: globalTextStyle(
//                               fontSize: 14.sp, fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   ),
//                   verticalSpace(10.h),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2.5.r),
//                       color: AppColors.white,
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: 2.5.w, top: 2.5.h, bottom: 2.5.h),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2.5),
//                             color: AppColors.grey,
//                           ),
//                           child: Image.asset(
//                             AppImages.topBatsmen,
//                             height: 38.h,
//                             width: 38.w,
//                           ),
//                         ),
//                         horizontalSpace(5.w),
//                         SizedBox(
//                           width: Get.width * 0.28,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 homebastsman1,
//                                 style: globalTextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '58',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   horizontalSpace(2.w),
//                                   Text(
//                                     '(45)',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         horizontalSpace(10.w),
//                         Container(
//                           margin: EdgeInsets.only(top: 2.5.h, bottom: 2.5.h),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2.5),
//                             color: AppColors.grey,
//                           ),
//                           child: Image.asset(
//                             AppImages.topBowlers,
//                             height: 38.h,
//                             width: 38.w,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                         horizontalSpace(5.w),
//                         SizedBox(
//                           width: Get.width * 0.32,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 homebowler1,
//                                 style: globalTextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     '58',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   horizontalSpace(2.w),
//                                   Text(
//                                     '(45)',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   verticalSpace(5.h),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2.5.r),
//                       color: AppColors.white,
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: 2.5.w, top: 2.5.h, bottom: 2.5.h),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2.5),
//                             color: AppColors.grey,
//                           ),
//                           child: Image.asset(
//                             AppImages.topBatsmen,
//                             height: 38.h,
//                             width: 38.w,
//                           ),
//                         ),
//                         horizontalSpace(5.w),
//                         SizedBox(
//                           width: Get.width * 0.28,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 hometopbatsman2,
//                                 style: globalTextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '58',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   horizontalSpace(2.w),
//                                   Text(
//                                     '(45)',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         horizontalSpace(10.w),
//                         Container(
//                           margin: EdgeInsets.only(top: 2.5.h, bottom: 2.5.h),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2.5),
//                             color: AppColors.grey,
//                           ),
//                           child: Image.asset(
//                             AppImages.topBowlers,
//                             height: 38.h,
//                             width: 38.w,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                         horizontalSpace(5.w),
//                         SizedBox(
//                           width: Get.width * 0.32,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 homebowler2,
//                                 style: globalTextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     '58',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   horizontalSpace(2.w),
//                                   Text(
//                                     '(45)',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             verticalSpace(10.h),
//             Container(
//               padding: EdgeInsets.only(
//                   left: 2.5.w, right: 2.5.w, bottom: 2.5.h, top: 2.5.h),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5.r),
//                   color: AppColors.grey),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 10.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // ignore: unnecessary_null_comparison
//                         awayImageUrl == null
//                             ? const SizedBox(
//                                 height: 30,
//                                 width: 30,
//                               )
//                             : awayImageUrl.endsWith('.png')
//                                 ? Image.network(
//                                     homeImageUrl,
//                                     height: 22.h,
//                                     width: 22.w,
//                                   )
//                                 : controller.sportsCode == 'CR'
//                                     ? Image.network(
//                                         replaceSvgWithPng(awayImageUrl),
//                                         height: 22.h,
//                                         width: 22.w,
//                                       )
//                                     : SvgPicture.network(
//                                         awayImageUrl,
//                                         height: 22.h,
//                                         width: 22.w,
//                                       ),
//                         horizontalSpace(10.w),
//                         Text(
//                           awayName,
//                           style: globalTextStyle(
//                               fontSize: 14.sp, fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   ),
//                   verticalSpace(10.h),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2.5.r),
//                       color: AppColors.white,
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: 2.5.w, top: 2.5.h, bottom: 2.5.h),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2.5),
//                             color: AppColors.grey,
//                           ),
//                           child: Image.asset(
//                             AppImages.topBatsmen,
//                             height: 38.h,
//                             width: 38.w,
//                           ),
//                         ),
//                         horizontalSpace(5.w),
//                         SizedBox(
//                           width: Get.width * 0.28,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 awaybastsman1,
//                                 style: globalTextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '58',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   horizontalSpace(2.w),
//                                   Text(
//                                     '(45)',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         horizontalSpace(10.w),
//                         Container(
//                           margin: EdgeInsets.only(top: 2.5.h, bottom: 2.5.h),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2.5),
//                             color: AppColors.grey,
//                           ),
//                           child: Image.asset(
//                             AppImages.topBowlers,
//                             height: 38.h,
//                             width: 38.w,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                         horizontalSpace(5.w),
//                         SizedBox(
//                           width: Get.width * 0.32,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 awaybowler1,
//                                 style: globalTextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     '58',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   horizontalSpace(2.w),
//                                   Text(
//                                     '(45)',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   verticalSpace(5.h),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(2.5.r),
//                       color: AppColors.white,
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: 2.5.w, top: 2.5.h, bottom: 2.5.h),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2.5),
//                             color: AppColors.grey,
//                           ),
//                           child: Image.asset(
//                             AppImages.topBatsmen,
//                             height: 38.h,
//                             width: 38.w,
//                           ),
//                         ),
//                         horizontalSpace(5.w),
//                         SizedBox(
//                           width: Get.width * 0.28,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 awaytopbatsman2,
//                                 style: globalTextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '58',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   horizontalSpace(2.w),
//                                   Text(
//                                     '(45)',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         horizontalSpace(10.w),
//                         Container(
//                           margin: EdgeInsets.only(top: 2.5.h, bottom: 2.5.h),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2.5),
//                             color: AppColors.grey,
//                           ),
//                           child: Image.asset(
//                             AppImages.topBowlers,
//                             height: 38.h,
//                             width: 38.w,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                         horizontalSpace(5.w),
//                         SizedBox(
//                           width: Get.width * 0.32,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 awaybowler2,
//                                 style: globalTextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     '58',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   horizontalSpace(2.w),
//                                   Text(
//                                     '(45)',
//                                     style: globalTextStyle(
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             verticalSpace(10.h),

//             // PrimaryButton(

//             //     buttonText: 'Close', onPressed: () {}, isEnabled: true)
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.r))),
//               onPressed: () {},
//               child: SizedBox(
//                 width: Get.width * 0.75,
//                 child: Center(
//                   child: Text(
//                     'Close',
//                     style: globalTextStyle(
//                         fontSize: 12.sp, color: AppColors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void showInningsModalDialog(
//   BuildContext context,
//   String homebastsman1,
//   String hometopbatsman2,
//   String homebowler1,
//   String homebowler2,
//   String homeImageUrl,
//   String homeName,
//   String awaybastsman1,
//   String awaytopbatsman2,
//   String awaybowler1,
//   String awaybowler2,
//   String awayImageUrl,
//   String awayName,
// ) {
//   Get.dialog(
//     InningsModal(
//       homebastsman1: homebastsman1,
//       hometopbatsman2: hometopbatsman2,
//       homebowler1: homebowler1,
//       homebowler2: homebowler2,
//       homeImageUrl: homeImageUrl,
//       homeName: homeName,
//       awaybastsman1: awaybastsman1,
//       awaytopbatsman2: awaytopbatsman2,
//       awaybowler1: awaybowler1,
//       awaybowler2: awaybowler2,
//       awayImageUrl: awayImageUrl,
//       awayName: awayName,
//     ),
//     barrierDismissible: false,
//     barrierColor: Colors.white54,
//   );
// }
