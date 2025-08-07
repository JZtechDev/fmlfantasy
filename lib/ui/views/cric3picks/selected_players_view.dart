import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/cric3picks/controller/cric3_controller.dart';
import 'package:fmlfantasy/ui/views/cric3picks/widgets/custom_player_card.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class SelectedPlayersView extends StatelessWidget {
  const SelectedPlayersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Cric3Controller());
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<Cric3Controller>(builder: (controller) {
          final selectedHomePlayers = [
            controller.selectedHomeBatsman,
            controller.selectedHomeBowler,
            controller.selectedHomeFielder
          ];
          final selectedAwayPlayers = [
            controller.selectedAwayBatsman,
            controller.selectedAwayBowler,
            controller.selectedAwayFielder
          ];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 70,
                ),
                child: Center(
                  child: Text(
                    'PICKED PLAYERS',
                    style: globalTextStyle(
                        fontSize: 16.sp,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Text('Who will score the highest runs? ',
                  style: globalTextStyle(
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600)),
              verticalSpace(10),
              Container(
                alignment: Alignment.center,
                width: Get.width,
                color: AppColors.primaryDark,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    controller.selectedTournament!.matches![0].home!,
                    style: globalTextStyle(
                        fontSize: 14.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: selectedHomePlayers
                    .map((player) => CustomPlayerCard(
                          player: player,
                          widthFactor: 0.4,
                        ))
                    .toList(),
              ),
              verticalSpace(30),
              Container(
                alignment: Alignment.center,
                width: Get.width,
                color: AppColors.primaryDark,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    controller.selectedTournament!.matches![0].away!,
                    style: globalTextStyle(
                        fontSize: 14.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: selectedAwayPlayers
                    .map((player) => CustomPlayerCard(
                          player: player,
                          widthFactor: 0.4,
                        ))
                    .toList(),
              ),
              verticalSpace(30),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                        buttonText: 'Previous'.tr,
                        onPressed: () {
                          Get.back();
                        },
                        isEnabled: true),
                  ),
                  horizontalSpace(5),
                  Expanded(
                    child: PrimaryButton(
                        buttonText: 'Continue'.tr,
                        onPressed: () {},
                        isEnabled: true),
                  ),
                ],
              ),
              verticalSpace(30),
            ],
          );
        }),
      ),
    );
  }
}
