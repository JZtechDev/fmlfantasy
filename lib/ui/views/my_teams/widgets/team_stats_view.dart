import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/my_teams_model.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/team_stats.dart';
import 'package:fmlfantasy/ui/widgets/navigation_buttons.dart';

class TeamStatsView extends GetView<MyTeamsController> {
  final MyTeamsModel myTeams;
  const TeamStatsView({super.key, required this.myTeams});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTeamsController());
    return Scaffold(
        appBar: HomeAppBar(title: 'matchcenter'.tr),
        body: CustomScrollView(slivers: [
          const NavigationButtons(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
                  child: TeamStatistics(
                    myTeams: myTeams,
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
