// import 'package:flutter_remix/flutter_remix.dart';
// import 'package:fmlfantasy/app/app_colors/app_colors.dart';
// import 'package:fmlfantasy/app/textstyles/textstyle.dart';
// import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
// import 'package:fmlfantasy/ui/views/home/widgets/search_tournament.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class SportsNAme extends GetView<HomeController> {
//   const SportsNAme({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//     return LayoutBuilder(builder: (context, constraints) {
//       double textSize = constraints.maxWidth > 600 ? 20.sp : 28.sp;
//       double iconSize = constraints.maxWidth > 600 ? 20.sp : 15.sp;
//       return Padding(
//         padding: EdgeInsets.only(left: 20.w, right: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Obx(
//               () {
//                 switch (controller.selectedSport.value) {
//                   case 'BB':
//                     return Text(
//                       'Basketball',
//                       style: globalTextStyle(
//                         fontSize: textSize,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     );
//                   case 'AF':
//                     return Text(
//                       'American Football',
//                       style: globalTextStyle(
//                           fontSize: textSize, fontWeight: FontWeight.w600),
//                     );
//                   case 'FB':
//                     return Text(
//                       'Football',
//                       style: globalTextStyle(
//                           fontSize: textSize, fontWeight: FontWeight.w800),
//                     );
//                   case 'CR':
//                     return Text(
//                       'Cricket',
//                       style: globalTextStyle(
//                           fontSize: textSize, fontWeight: FontWeight.w800),
//                     );
//                   case 'BL':
//                     return Text(
//                       'Baseball',
//                       style: globalTextStyle(
//                           fontSize: textSize, fontWeight: FontWeight.w800),
//                     );
//                   case 'HK':
//                     return Text(
//                       'Hockey',
//                       style: globalTextStyle(
//                           fontSize: textSize, fontWeight: FontWeight.w800),
//                     );
//                   default:
//                     return Text(
//                       '',
//                       style: globalTextStyle(
//                           fontSize: textSize, fontWeight: FontWeight.w800),
//                     );
//                 }
//               },
//             ),
//             GestureDetector(
//               onTap: () {
//                 showSearch(
//                   context: context,
//                   delegate: SearchTournament(),
//                 );
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(5),
//                 decoration: const BoxDecoration(
//                     color: AppColors.secondary, shape: BoxShape.circle),
//                 child: Icon(
//                   FlutterRemix.menu_5_line,
//                   size: iconSize,
//                   color: AppColors.primaryVeryDark,
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     });
//   }
// }
