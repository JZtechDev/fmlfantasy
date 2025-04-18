import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/ui/views/my_contest/controller/my_contest_controller.dart';
import 'package:fmlfantasy/ui/views/my_contest/widgets/contest_card.dart';
import 'package:fmlfantasy/ui/views/my_contest/widgets/label.dart';

class MyContestView extends GetView<MyContestController> {
  const MyContestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyContestController());
    return Scaffold(
        extendBody: false,
        backgroundColor: AppColors.grey,
        resizeToAvoidBottomInset: true,
        appBar: const AppBarGeneral(
          title: 'Home',
          backgroundColor: AppColors.white,
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
              flexibleSpace: Obx(
                () => SportsTabBar(
                  sportsList: controller.sportsList,
                  selectedIndex: controller.sportsList.indexWhere(
                      (sport) => sport.title == selectedSPort.value),
                  onTap: (index) {
                    selectedSPort.value = controller.sportsList[index].title;
                    controller.selectedIndex.value = index;
                    controller.selectedSport.value =
                        controller.sportsList[index].title;
                    controller.fetchMyContestTournaments();
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Label(),
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.contests.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              Tournaments contest = controller.contests[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w,
                                    right: 10.w,
                                    top: 5.h,
                                    bottom: 5.h),
                                child: ContestCard(tournament: contest),
                              );
                            },
                          ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
