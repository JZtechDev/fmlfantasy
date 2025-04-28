import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/components/drawer.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
import 'package:fmlfantasy/ui/views/home/widgets/public_tournament_card.dart';
import 'package:fmlfantasy/ui/views/home/widgets/tournament_card.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';
import 'package:fmlfantasy/ui/widgets/dropdown.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      drawer: const DrawerView(),
      backgroundColor: AppColors.backgroud,
      resizeToAvoidBottomInset: true,
      appBar: const HomeAppBar(
        title: 'Home',
      ),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          CustomSliver(
            appBar: Obx(
              () => SportsTabBar(
                sportsList: controller.sportsList,
                selectedIndex: controller.sportsList
                    .indexWhere((sport) => sport.title == selectedSPort.value),
                onTap: (index) {
                  selectedSPort.value = controller.sportsList[index].title;
                  controller.selectedIndex.value = index;
                  controller.selectedSport.value =
                      controller.sportsList[index].title;
                  controller.publicTournamentCrouselIndex.value = 0;
                  controller.privateTournamentCrouselIndex.value = 0;
                  controller.fetchData();
                  controller.fetchPrivateTournaments();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: Get.height,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      const DashboardButton(),
                      verticalSpace(10),
                      Container(
                        width: AppSizing.width(context),
                        decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 25),
                                width: AppSizing.width(context),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(44, 86, 80, 1),
                                      Color.fromRGBO(55, 132, 121, 1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  // Example
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Image.asset(
                                          controller
                                              .getIconPath(selectedSPort.value),
                                          height: 24),
                                    ),
                                    verticalSpace(10),
                                    Text('Create a Team',
                                        style: globalTextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.white)),
                                    Text('Public Tournaments',
                                        style: globalTextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w800,
                                            color: AppColors.white)),
                                    verticalSpace(5),
                                    Text(
                                        'Explore  Premier League, La Liga,Serie A (Italy), Bundesliga and Ligue 1 (France)',
                                        style: globalTextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.white)),
                                    verticalSpace(10),
                                    GetBuilder<HomeController>(
                                        builder: (controller) {
                                      return AppDropdown(
                                        items: controller.teamNames,
                                        hint: 'Select',
                                        dropdownColor: Colors.transparent,
                                        titleColor: AppColors.white,
                                        onChanged: (p0) {},
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              verticalSpace(20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/new_images/create team.svg',
                                        color: AppColors.secondary,
                                        height: 25),
                                    verticalSpace(10),
                                    Text('My Teams',
                                        style: globalTextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w800,
                                            color: AppColors.white)),
                                    Text('Join a Tournament to Create a Team',
                                        style: globalTextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.white)),
                                    verticalSpace(10),
                                    ...List.generate(
                                        4,
                                        (index) => Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 10),
                                              width: AppSizing.width(context) *
                                                  0.6,
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                color:
                                                    AppColors.primaryVeryDark,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Team Name Here',
                                                      style: globalTextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              AppColors.white)),
                                                  Container(
                                                    height: 22,
                                                    width: 22,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color:
                                                          AppColors.lightGreen,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                    verticalSpace(10),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      width: AppSizing.width(context) * 0.6,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: AppColors.secondary,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Team Name Here',
                                              style: globalTextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w800,
                                                  color: AppColors
                                                      .primaryVeryDark)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      verticalSpace(20),
                      Obx(() => Column(
                            children: [
                              ...controller.tournaments
                                  .map((tournament) => TournamentCardSlider(
                                        tournament: tournament,
                                      ))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
