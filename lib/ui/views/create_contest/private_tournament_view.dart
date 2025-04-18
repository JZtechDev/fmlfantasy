import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/ui/views/create_contest/controller/private_tournament_controller.dart';
import 'package:fmlfantasy/ui/views/create_contest/widgets/private_tournament_card.dart';
import 'package:fmlfantasy/ui/views/create_contest/widgets/label_and_search_filter.dart';
import 'package:fmlfantasy/ui/views/create_contest/widgets/skeleton.dart';

class PrivateTournamentView extends GetView<PrivateTournamentController> {
  const PrivateTournamentView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PrivateTournamentController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarGeneral(
        title: 'Private Tournamenet',
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 45.h,
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
                    controller.fetchedTournaments();
                  },
                )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(5.h),
                const LabelAndSearchFilter(),
                Obx(
                  () => controller.tournamentLoading.value
                      ? const PrivateTournamentSkeleton()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.tournamentCardList.length,
                          itemBuilder: (context, index) {
                            Tournaments tournaments =
                                controller.tournamentCardList[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 10.w, right: 10.w, bottom: 10.h),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      AppRoutes.createContest,
                                      arguments: {
                                        'matchID':
                                            tournaments.matches![0].matchCode,
                                        'sport': controller.selectedSport.value,
                                        'tournamentId': tournaments.id,
                                        'joinCode': tournaments.joinCode,
                                        'startDate': tournaments.startDate,
                                        'endDate': tournaments.endDate,
                                        'tournament': tournaments,
                                      },
                                    );
                                  },
                                  child: PrivateTournamentCard(
                                      tournament: tournaments)),
                            );
                          },
                        ),
                ),
                verticalSpace(10.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
