// import 'package:fmlfantasy/app/app_colors/app_colors.dart';
// import 'package:fmlfantasy/model/sports_type.dart';
// import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class HomeTabar extends GetView<HomeController> {
//   const HomeTabar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//     return Container(
//       alignment: Alignment.center,
//       width: Get.width,
//       height: 50.h,
//       color: AppColors.dark,
//       child: Obx(
//         () {
//           final double containerWidth = 60.w;
//           final double containerHeight = 40.h;
//           final double totalWidth =
//               containerWidth * controller.sportsList.length;
//           final double leftOffset =
//               containerWidth * controller.selectedIndex.value;

//           return Stack(
//             children: [
//               AnimatedPositioned(
//                 duration: const Duration(milliseconds: 300),
//                 left: (Get.width - totalWidth) / 2 + leftOffset,
//                 top: 0,
//                 child: Container(
//                   width: containerWidth,
//                   height: containerHeight,
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.circular(5.r),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   controller.sportsList.length,
//                   (index) {
//                     Sport sport = controller.sportsList[index];
//                     bool isSelected = index == controller.selectedIndex.value;
//                     return SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: GestureDetector(
//                         onTap: () {
//                           controller.selectedIndex.value = index;
//                           controller.selectedSport.value = sport.title;
//                           controller.animation();
//                           controller.publicTournamentCrouselIndex.value = 0;
//                           controller.privateTournamentCrouselIndex.value = 0;
//                         },
//                         child: Container(
//                           alignment: Alignment.center,
//                           width: containerWidth,
//                           height: containerHeight,
//                           color: Colors.transparent,
//                           child: AnimatedOpacity(
//                             duration: const Duration(milliseconds: 300),
//                             opacity: isSelected ? 1.0 : 0.5,
//                             child: SvgPicture.asset(
//                               sport.icon,
//                               // ignore: deprecated_member_use
//                               color:
//                                   isSelected ? AppColors.dark : AppColors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
