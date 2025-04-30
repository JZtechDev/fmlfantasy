import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/match_timer.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/selected_players_list.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/team_names.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';

class TopContainer extends GetView<SelectPlayerController> {
  final SelectTeam selectTeam;
  const TopContainer({super.key, required this.selectTeam});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    return SliverAppBar(
        pinned: true,
        expandedHeight: AppSizing.height(context) * 0.35,
        collapsedHeight: AppSizing.height(context) * 0.35,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          centerTitle: true,
          background: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                  color: AppColors.backgroud,
                  child: Obx(
                    () => Column(
                      children: [
                        verticalSpace(10),
                        const DashboardButton(),
                        TeamsContainer(
                          homeTeamNme: selectTeam.homeTeam!.name,
                          awayTeamName: selectTeam.awayTeam!.name,
                          awayTeamImage: selectTeam.awayTeam!.imageUrl,
                          homeTeamImage: selectTeam.homeTeam!.imageUrl,
                          homeTeamCode: selectTeam.homeTeam!.assetCode,
                          awayTeamCode: selectTeam.awayTeam!.assetCode,
                        ),
                        controller.matchData.isEmpty
                            ? Container()
                            : MatchTimer(
                                key: const ValueKey('MatchTimer'),
                                startDate: controller.matchData['ExpStartDate'],
                              ),
                        verticalSpace(10),
                        const SelectedPlayersList()
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
