import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/doughnut_chart.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/players_card.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/points_grid.dart';
import 'package:fmlfantasy/ui/widgets/navigation_buttons.dart';

class PlayerDetails extends StatelessWidget {
  final PlayersBreakDown playersdata;
  const PlayerDetails({
    super.key,
    required this.playersdata,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroud,
        appBar: HomeAppBar(title: 'Player Details'.tr),
        body: CustomScrollView(
          slivers: [
            const NavigationButtons(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  verticalSpace(20.h),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.secondary,
                    ),
                    child: Column(
                      children: [
                        PlayersCard(topPlayers: playersdata),
                        verticalSpace(2),
                        DoughnutChart(playersdata: playersdata),
                        verticalSpace(2),
                        PointsGrid(playersdata: playersdata),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
