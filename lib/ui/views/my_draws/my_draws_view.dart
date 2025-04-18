import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/my_draws/controller/my_draws_controller.dart';
import 'package:fmlfantasy/ui/views/my_draws/widget/my_draws_teams.dart';
import 'package:fmlfantasy/ui/views/my_draws/widget/search.dart';
import 'package:flutter_svg/svg.dart';

class MyDrawsView extends GetView<MyDrawsController> {
  const MyDrawsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyDrawsController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarGeneral(
        title: 'My Draws',
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
                  controller.getSportsName();
                  controller.getSportsId();
                  controller.fetchDrawsTeams();
                })),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(10.h),
                  Text(
                    'My Draws'.tr,
                    style: globalTextStyle(
                        fontSize: 32.sp, fontWeight: FontWeight.w600),
                  ),
                  verticalSpace(15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: SearchDraws(),
                            );
                          },
                          child: SvgPicture.asset(AppImages.searchMenu)),
                      Row(
                        children: [
                          Text(
                            '\$1200',
                            style: globalTextStyle(fontSize: 30),
                          ),
                          horizontalSpace(5.w),
                          Text(
                            'totalwinning'.tr,
                            style: globalTextStyle2(
                              fontSize: 12.sp,
                              color: AppColors.textGray,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
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
