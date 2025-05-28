import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/previews/basketball_preview.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/previews/cricket_preview.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/previews/football_preview.dart';
import 'package:fmlfantasy/ui/widgets/navigation_buttons.dart';

class TeamPreview extends GetView<MyTeamsController> {
  const TeamPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(title: 'Team Preview'),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const NavigationButtons(),
          SliverToBoxAdapter(child: Obx(() => _buildBody())),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final selectedSport = controller.selectedSport.value;
    final filteredPlayers = controller.myTeamPlayers;

    switch (selectedSport) {
      case 'CR':
        return CricketPreview(data: filteredPlayers);
      case 'FB':
        return FootballPreview(data: filteredPlayers);
      case 'BB':
        return BasketballPreview(data: filteredPlayers);
      default:
        return const Center(
          child: Text(
            'No sport selected',
          ),
        );
    }
  }
}
