import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/players/controller/players_controller.dart';
import 'package:fmlfantasy/ui/views/players/widgets/players_tile.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class PlayersView extends StatelessWidget {
  const PlayersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlayersController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarGeneral(title: 'Players'),
      body: GetBuilder<PlayersController>(
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
                                'Players'.tr,
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
                      ...controller.playersList.map((player) => GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.playersStatsView,
                              arguments: {
                                'assetCode': player.assetCode,
                              },
                            );
                          },
                          child: PlayersTile(player: player)))
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
