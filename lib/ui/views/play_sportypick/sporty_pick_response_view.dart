import 'package:flutter/cupertino.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/controller/play_sportypick_responses_controller.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/widgets/teams_responses.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';

class PlaySportyResponses extends GetView<PlaySportypickResponsesController> {
  const PlaySportyResponses({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlaySportypickResponsesController());
    return Scaffold(
      appBar: HomeAppBar(title: 'SportyPick\'em'.tr),
      backgroundColor: AppColors.backgroud,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          CustomSliver(
            height: 140.h,
            appBar: Column(
              children: [
                Obx(() => SportsTabBar(
                    sportsList: controller.sportsList,
                    selectedIndex: controller.sportsList.indexWhere(
                        (sport) => sport.title == selectedSPort.value),
                    onTap: (index) {
                      selectedSPort.value = controller.sportsList[index].title;
                      controller.selectedIndex.value = index;
                      controller.selectedSport.value =
                          controller.sportsList[index].title;
                    })),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  decoration: const BoxDecoration(color: AppColors.darkGreen),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My SportyPick\'em'.tr,
                        style: globalTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.secondary),
                      ),
                      GestureDetector(
                          onTap: () {
                            // showSearch(
                            //   context: context,
                            //   delegate: SearchDraws(),
                            // );
                          },
                          child: Icon(CupertinoIcons.search,
                              color: AppColors.secondary, size: 20.h)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DashboardButton(),
                  verticalSpace(10.h),
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
