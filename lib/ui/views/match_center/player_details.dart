import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/doughnut_chart.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/players_card.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/points_grid.dart';

class PlayerDetails extends StatelessWidget {
  final PlayersBreakDown playersdata;
  const PlayerDetails({
    super.key,
    required this.playersdata,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarGeneral(title: 'Match Center Inner'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(10.h),
            PlayersCard(topPlayers: playersdata),
            verticalSpace(10.h),
            DoughnutChart(playersdata: playersdata),
            verticalSpace(10.h),
            PointsGrid(playersdata: playersdata),
            verticalSpace(20.h)
          ],
        ),
      ),
    );
  }
}
