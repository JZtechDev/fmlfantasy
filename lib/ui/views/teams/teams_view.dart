import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/teams/controller/teams_controller.dart';
import 'package:fmlfantasy/ui/views/teams/widgets/teams_tile.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class TeamsView extends StatelessWidget {
  const TeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TeamsController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarGeneral(title: 'Players'),
      body: GetBuilder<TeamsController>(
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 45.h,
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: Obx(
                  () => SportsTabBar(
                    sportsList: controller.sportsList,
                    selectedIndex: controller.sportsList.indexWhere(
                        (sport) => sport.title == selectedSPort.value),
                    onTap: (index) {
                      selectedSPort.value = controller.sportsList[index].title;
                      controller.selectedIndex.value = index;
                      // controller.selectedSport.value =
                      //     controller.sportsList[index].title;
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'All Teams'.tr,
                                style: globalTextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              //verticalSpace(10.h),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.isSearch = !controller.isSearch;
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: 36.h,
                              width: 36.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.isSearch
                                      ? AppColors.dark
                                      : AppColors.white),
                              child: SvgPicture.asset(AppImages.search,
                                  height: 25.h,
                                  width: 25.w,
                                  // ignore: deprecated_member_use
                                  color: controller.isSearch
                                      ? AppColors.white
                                      : AppColors.dark),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(10),
                      AnimatedContainer(
                          clipBehavior: Clip.hardEdge,
                          height: controller.isSearch ? 60 : 0,
                          duration: const Duration(milliseconds: 400),
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(5)),
                          child: OverflowBox(
                            fit: OverflowBoxFit.deferToChild,
                            minHeight: 0,
                            maxHeight: 60,
                            child: AppTextField(
                              fillColor: AppColors.white,
                              labelText: 'search'.tr,
                              controller: controller.searchController,
                              onChanged: (value) {
                                // controller.searchQuery.value = value;
                              },
                            ),
                          )),
                      verticalSpace(10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rank'.tr,
                              style: globalTextStyle2(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: Get.width * 0.28,
                              child: Text(
                                textAlign: TextAlign.center,
                                'Team Name'.tr,
                                style: globalTextStyle2(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              'Matches Win'.tr,
                              style: globalTextStyle2(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Matches Lost'.tr,
                              style: globalTextStyle2(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(10),
                      ...controller.teams.map((player) => GestureDetector(
                          onTap: () {
                            // Get.toNamed(
                            //   AppRoutes.playersStatsView,
                            //   arguments: {
                            //     'assetCode': player.assetCode,
                            //   },
                            // );
                          },
                          child: TeamsTile(teams: player)))
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
