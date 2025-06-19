import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/loto/loto_controller/loto_controller.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/bottom_container.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/draw_container.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/top_container.dart';
import 'package:fmlfantasy/ui/widgets/navigation_buttons.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class CreateLotoView extends GetView<LotoController> {
  const CreateLotoView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LotoController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const HomeAppBar(
          title: 'Home',
        ),
        body: FutureBuilder(
            future: controller.selectTeam,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              } else if (snapshot.hasError) {
                return const Center(child: Text('Server Error'));
              } else {
                final teams = snapshot.data!;
                controller.homeTeamKey = teams.homeTeam!.assetCode!;
                controller.awayTeamKey = teams.awayTeam!.assetCode!;
                controller.homeTeamName = teams.homeTeam!.name!;
                controller.awayTeamName = teams.awayTeam!.name!;
                return CustomScrollView(
                  slivers: [
                    const NavigationButtons(),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      child: Obx(
                        () => Column(
                          children: [
                            LotoTopContainer(
                              selectTeam: teams,
                            ),
                            verticalSpace(20.h),
                            ...controller.drawsList
                                .asMap()
                                .entries
                                .map((drawEntry) {
                              int drawIndex = drawEntry.key;
                              var draw = drawEntry.value.players;
                              var winner = drawEntry.value.winner;
                              var drawId = drawEntry.value.drawId;
                              controller.drawIndexs.value = drawIndex;
                              return Column(
                                children: [
                                  DrawContainer(
                                      drawIndex: drawIndex,
                                      draw: draw,
                                      winner: winner,
                                      drawId: drawId,
                                      teams: teams),
                                  verticalSpace(10.h),
                                ],
                              );
                            }),
                            PrimaryButton(
                                backgroundColor: AppColors.secondary,
                                textColor: AppColors.backgroud,
                                buttonText: 'addDraw'.tr,
                                onPressed: () {
                                  controller.addDraw();
                                },
                                isEnabled: true)
                          ],
                        ),
                      ),
                    )),
                  ],
                );
              }
            }),
        bottomNavigationBar: const BottomContainer());
  }
}
