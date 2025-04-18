import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/controller/players_stats_controller.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/widgets/player_stats.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/widgets/players_info_card.dart';
import 'package:fmlfantasy/ui/widgets/dropdown.dart';
import '../../../core/imports/imports.dart';

class PlayersStatsView extends StatelessWidget {
  const PlayersStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlayersStatsController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarInner(title: 'Players Stats'),
      body: GetBuilder<PlayersStatsController>(
          builder: (controller) => controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const PlayersInfoCard(),
                      verticalSpace(10.h),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: AppDropdown(
                            items: controller.statsFilter,
                            hint: 'Stats Filter',
                            dropdownColor: AppColors.primary,
                            titleColor: AppColors.dark,
                            hintTextColor: AppColors.white,
                            selectedTextColor: AppColors.white,
                            trailingColor: AppColors.white,
                            fontSize: 12.sp,
                            value: controller.selectedTitle.value,
                            onChanged: (value) {
                              controller.selectedTitle.value = value!;
                            },
                          ),
                        ),
                      ),
                      const PlayersStats()
                      // controller.isStatsoadding
                      //     ? Container()
                      //     : Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Container(
                      //           clipBehavior: Clip.hardEdge,
                      //           padding: const EdgeInsets.all(8.0),
                      //           decoration: BoxDecoration(
                      //             color: AppColors.white,
                      //             borderRadius: BorderRadius.circular(10.r),
                      //             border:
                      //                 Border.all(color: AppColors.borderColor),
                      //           ),
                      //           child: Stack(
                      //             clipBehavior: Clip.none,
                      //             children: [
                      //               Positioned(
                      //                 top: -10,
                      //                 left: -10,
                      //                 child: Container(
                      //                     alignment: Alignment.center,
                      //                     width: Get.width,
                      //                     padding: const EdgeInsets.all(8.0),
                      //                     decoration: BoxDecoration(
                      //                       color: AppColors.secondary,
                      //                       borderRadius:
                      //                           BorderRadius.circular(5.r),
                      //                     ),
                      //                     child: Text(
                      //                       'Players Stats For Previous 5 Matches',
                      //                       style: globalTextStyle2(
                      //                           fontSize: 12.sp,
                      //                           color: AppColors.white),
                      //                     )),
                      //               ),
                      //               Align(
                      //                 alignment: Alignment.topRight,
                      //                 child: Transform.rotate(
                      //                   origin: const Offset(
                      //                       280, -210), // 180, -170
                      //                   angle: pi /
                      //                       4.5, // Rotate 60 degrees clockwise
                      //                   child: Container(
                      //                     height:
                      //                         460.0, // Adjust height of the bar
                      //                     width:
                      //                         75.0, // Adjust width of the bar
                      //                     decoration: BoxDecoration(
                      //                       borderRadius:
                      //                           BorderRadius.circular(5),
                      //                       gradient: LinearGradient(
                      //                         colors: [
                      //                           AppColors.primary
                      //                               .withOpacity(0.25),
                      //                           AppColors.primary
                      //                               .withOpacity(0.2)
                      //                               .withOpacity(0.0),
                      //                         ],
                      //                         begin: Alignment.topCenter,
                      //                         end: Alignment.bottomCenter,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               Align(
                      //                 alignment: Alignment.topRight,
                      //                 child: Transform.rotate(
                      //                   origin: const Offset(70, -45),
                      //                   angle: pi / 4.5,
                      //                   child: Container(
                      //                     height: 260.0,
                      //                     width: 75.0,
                      //                     decoration: BoxDecoration(
                      //                       borderRadius:
                      //                           BorderRadius.circular(5),
                      //                       gradient: LinearGradient(
                      //                         colors: [
                      //                           AppColors.primary
                      //                               .withOpacity(0.20),
                      //                           AppColors.primary
                      //                               .withOpacity(0.2)
                      //                               .withOpacity(0.0),
                      //                         ],
                      //                         begin: Alignment.topCenter,
                      //                         end: Alignment.bottomCenter,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               Align(
                      //                 alignment: Alignment.topRight,
                      //                 child: Transform.rotate(
                      //                   origin: const Offset(100, -70),
                      //                   angle: pi / 4.5,
                      //                   child: Container(
                      //                     height: 450.0,
                      //                     width: 80.0,
                      //                     decoration: BoxDecoration(
                      //                       borderRadius:
                      //                           BorderRadius.circular(5),
                      //                       gradient: LinearGradient(
                      //                         colors: [
                      //                           AppColors.primary
                      //                               .withOpacity(0.1),
                      //                           AppColors.primary
                      //                               .withOpacity(0.1)
                      //                               .withOpacity(0.0),
                      //                         ],
                      //                         begin: Alignment.topCenter,
                      //                         end: Alignment.bottomCenter,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               Column(
                      //                 children: [
                      //                   verticalSpace(40),
                      //                   //const PlayersFantaspoints(),
                      //                   verticalSpace(10),
                      //                   // Text('Stats Breakdown',
                      //                   //     style: globalTextStyle(
                      //                   //       fontSize: 16.sp,
                      //                   //     )),
                      //                   verticalSpace(10),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       )
                    ],
                  ),
                )),
    );
  }
}
