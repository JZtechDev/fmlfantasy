import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/how_it_works/controller/how_it_works_controller.dart';
import 'package:fmlfantasy/ui/views/how_it_works/widgets/gameplay_rules.dart';
import 'package:fmlfantasy/ui/views/how_it_works/widgets/introduction_cards.dart';

class HowItWorksView extends GetView<HowItWorksController> {
  const HowItWorksView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HowItWorksController());
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: const AppBarGeneral(
          title: 'Monthly leaderboard',
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 45.h,
              expandedHeight: 45.h,
              collapsedHeight: 45.h,
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Obx(() => SportsTabBar(
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
                  })),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const IntroductionCards(),
                  verticalSpace(20),
                  const GamePlayRulesContainer(),
                  verticalSpace(20.h)
                ],
              ),
            ),
          ],
        ));
  }
}
