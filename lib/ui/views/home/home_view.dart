import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/components/drawer.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
import 'package:fmlfantasy/ui/views/home/widgets/tournaments.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      drawer: const DrawerView(),
      extendBody: false,
      backgroundColor: AppColors.grey,
      resizeToAvoidBottomInset: true,
      appBar: const HomeAppBar(
        title: 'Home',
        backgroundColor: AppColors.white,
      ),
      body: CustomScrollView(
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
          const SliverToBoxAdapter(
            child: Column(
              children: [
                TournamentsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
