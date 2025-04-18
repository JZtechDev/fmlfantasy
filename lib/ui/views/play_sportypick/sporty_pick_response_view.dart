import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/controller/play_sportypick_responses_controller.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/widgets/teams_responses.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/app_images/app_images.dart';

class PlaySportyResponses extends GetView<PlaySportypickResponsesController> {
  const PlaySportyResponses({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlaySportypickResponsesController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarGeneral(
        title: 'Play Sportypick Responses',
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 45.h,
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Obx(() => SportsTabBar(
                sportsList: controller.sportsList,
                selectedIndex: controller.sportsList
                    .indexWhere((sport) => sport.title == selectedSPort.value),
                onTap: (index) {
                  selectedSPort.value = controller.sportsList[index].title;
                  controller.selectedIndex.value = index;
                  controller.selectedSport.value =
                      controller.sportsList[index].title;
                })),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My SportyPick\'em'.tr,
                        style: globalTextStyle(
                            fontSize: 26.sp, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                          onTap: () {
                            // showSearch(
                            //   context: context,
                            //   delegate: SearchDraws(),
                            // );
                          },
                          child: SvgPicture.asset(AppImages.searchMenu)),
                    ],
                  ),
                  verticalSpace(15.h),
                  const MyResponsesTeams(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
