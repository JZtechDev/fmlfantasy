import 'dart:developer';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/bottom_button.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/players_section.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/top_container.dart';

class SelectPlayerView extends GetView<SelectPlayerController> {
  const SelectPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    log('Match');
    final controller = Get.put(SelectPlayerController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroud,
        appBar: const HomeAppBar(
          title: 'Home',
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              FutureBuilder(
                  future: controller.selectTeam,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Server Error'));
                    } else if (!snapshot.hasData) {
                      return const Center(child: Text('No data available.'));
                    } else {
                      final selectTeam = snapshot.data!;
                      return Obx(() {
                        controller.filterPlayers(selectTeam);
                        return CustomScrollView(slivers: [
                          TopContainer(selectTeam: selectTeam),
                          PlayersSection(selectTeam: selectTeam)
                        ]);
                      });
                    }
                  }),
            ],
          );
        }),
        bottomNavigationBar: const BottomButtonSelectPlayer());
  }
}
