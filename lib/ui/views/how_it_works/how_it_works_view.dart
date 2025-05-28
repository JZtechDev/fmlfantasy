import 'package:flutter_svg/svg.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/how_it_works/controller/how_it_works_controller.dart';
import 'package:fmlfantasy/ui/views/how_it_works/widgets/gameplay_rules.dart';
import 'package:fmlfantasy/ui/views/how_it_works/widgets/intro_toggle.dart';
import 'package:fmlfantasy/ui/views/how_it_works/widgets/introduction_cards.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';

class HowItWorksView extends GetView<HowItWorksController> {
  const HowItWorksView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HowItWorksController());
    return Scaffold(
        appBar: const HomeAppBar(title: 'How It Works'),
        body: CustomScrollView(
          slivers: [
            CustomSliver(
              appBar: Obx(() {
                return SportsTabBar(
                    sportsList: controller.sportsList,
                    selectedIndex: controller.sportsList.indexWhere(
                        (sport) => sport.title == selectedSPort.value),
                    onTap: (index) {
                      selectedSPort.value = controller.sportsList[index].title;
                      controller.selectedIndex.value = index;
                      controller.selectedSport.value =
                          controller.sportsList[index].title;
                      //controller.animation();
                      controller.publicTournamentCrouselIndex.value = 0;
                      controller.privateTournamentCrouselIndex.value = 0;
                      controller.combineTitles();
                    });
              }),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DashboardButton(),
                  verticalSpace(10.h),
                  Container(
                    padding: const EdgeInsets.all(2),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 172, 62, 1),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  bottomLeft: Radius.circular(5.r),
                                ),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(44, 86, 80, 1),
                                    Color.fromRGBO(55, 132, 121, 1),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    height: 20,
                                    width: 20,
                                    'assets/new_images/create team.svg',
                                    color: AppColors.secondary,
                                  ),
                                  Text('  How it works',
                                      style: globalTextStyle(
                                        color: AppColors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ))
                                ],
                              )),
                        ),
                        horizontalSpace(2.w),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.r),
                                bottomRight: Radius.circular(5.r),
                              ),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(44, 86, 80, 1),
                                  Color.fromRGBO(55, 132, 121, 1),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Row(
                              children: [
                                Obx(
                                  () => Image.asset(
                                    controller.getIconPath(
                                        controller.selectedSport.value),
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                ),
                                horizontalSpace(5.w),
                                Obx(() => Text(
                                      controller
                                          .sportsList[
                                              controller.selectedIndex.value]
                                          .name!,
                                      style: globalTextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700),
                                    ))
                              ],
                            )),
                      ],
                    ),
                  ),
                  IntroCardsToggle(
                    onPrevious: () {
                      controller.carouselController.previousPage();
                    },
                    onNext: () {
                      controller.carouselController.nextPage();
                    },
                  ),
                  const IntroductionCards(),
                  verticalSpace(30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/new_images/rules.png',
                              height: 25.h,
                              width: 25.w,
                            ),
                            horizontalSpace(10.w),
                            Text(
                              'Game Rules',
                              style: globalTextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'We Use Negative Points',
                                  style: globalTextStyle(
                                      fontSize: 10.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                horizontalSpace(5.w),
                                Image.asset(
                                  'assets/new_images/exclaimation.png',
                                  height: 10.h,
                                  width: 10.w,
                                )
                              ],
                            ),
                            verticalSpace(5.w),
                            Row(
                              children: [
                                Text(
                                  'We Use Fractional Points',
                                  style: globalTextStyle(
                                      fontSize: 10.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                horizontalSpace(5.w),
                                Image.asset(
                                  'assets/new_images/exclaimation.png',
                                  height: 10.h,
                                  width: 10.w,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  verticalSpace(15.h),
                  const GamePlayRulesContainer(),
                  verticalSpace(20.h)
                ],
              ),
            ),
          ],
        ));
  }
}
