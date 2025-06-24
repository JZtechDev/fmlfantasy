import 'package:flutter/cupertino.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/my_draws/controller/my_draws_controller.dart';
import 'package:fmlfantasy/ui/views/my_draws/widget/my_draws_teams.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';

class MyDrawsView extends GetView<MyDrawsController> {
  const MyDrawsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyDrawsController());
    return Scaffold(
      appBar: const HomeAppBar(title: 'My Draws'),
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliver(
            appBar: Obx(() => SportsTabBar(
                sportsList: controller.sportsList,
                selectedIndex: controller.sportsList
                    .indexWhere((sport) => sport.title == selectedSPort.value),
                onTap: (index) {
                  selectedSPort.value = controller.sportsList[index].title;
                  controller.selectedIndex.value = index;
                  controller.selectedSport.value =
                      controller.sportsList[index].title;
                  controller.getSportsName();
                  controller.getSportsId();
                  controller.fetchDrawsTeams();
                })),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DashboardButton(),
                  verticalSpace(10.h),
                  Text(
                    'My Draws'.tr,
                    style: globalTextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w800),
                  ),
                  verticalSpace(15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(77, 134, 126, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.r),
                              bottomLeft: Radius.circular(5.r),
                            ),
                          ),
                          child: SizedBox(
                              height: 40,
                              width: Get.width * 0.44,
                              child: TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    fillColor: AppColors.primaryLight,
                                    border: InputBorder.none,
                                    suffixIcon: const Icon(
                                      CupertinoIcons.search,
                                      color: AppColors.white,
                                    ),
                                    hintText: 'Search'.tr,
                                    hintStyle: globalTextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: AppColors.white,
                                    )),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: AppColors.white,
                                    ))),
                              ))),
                      horizontalSpace(2),
                      Container(
                        width: Get.width * 0.44,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.r),
                            bottomRight: Radius.circular(5.r),
                          ),
                        ),
                        child: SizedBox(
                          width: Get.width * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$1200',
                                style: globalTextStyle(
                                    fontSize: 24.sp, color: AppColors.dark),
                              ),
                              horizontalSpace(10.w),
                              Text(
                                'totalwinning'.tr,
                                style: globalTextStyle2(
                                  fontSize: 12.sp,
                                  color: AppColors.primaryDark,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  verticalSpace(10.h),
                  const MyDrawsTeams(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
