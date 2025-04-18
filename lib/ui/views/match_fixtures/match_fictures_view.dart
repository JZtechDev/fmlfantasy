import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/views/match_fixtures/controller/match_fixtures_controller.dart';
import 'package:fmlfantasy/ui/views/match_fixtures/widgets/fictures_card.dart';
import 'package:fmlfantasy/ui/views/match_fixtures/widgets/label.dart';
import 'package:fmlfantasy/ui/views/match_fixtures/widgets/skeleton.dart';

class MatchFixturesView extends GetView<MatchFixturesController> {
  const MatchFixturesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchFixturesController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarGeneral(title: 'Match Fixtures'),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          CustomSliver(
            appBar: Obx(() => SportsTabBar(
                  sportsList: controller.sportsList,
                  selectedIndex: controller.sportsList.indexWhere(
                      (sport) => sport.title == selectedSPort.value),
                  onTap: (index) {
                    selectedSPort.value = controller.sportsList[index].title;
                    controller.selectedIndex.value = index;
                    controller.selectedSport.value =
                        controller.sportsList[index].title;
                    controller.fetchedTournaments();
                  },
                )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(5),
                Column(
                  children: [
                    const LabelAndFilter(),
                    Obx(() => controller.isLoading.value
                        ? const MatchFixturesSkeleton()
                        : Column(
                            children: [
                              ...controller.fixtures
                                  .map((fixture) => GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                            AppRoutes.lotoView,
                                            arguments: {
                                              'matchID':
                                                  fixture.matches![0].matchCode,
                                              'sport': controller
                                                  .selectedSport.value,
                                              'tournamentId': fixture.id,
                                              'joinCode': fixture.joinCode,
                                            },
                                          );
                                        },
                                        child:
                                            FixturesCard(tournament: fixture),
                                      ))
                            ],
                          )),
                    verticalSpace(10.h),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
