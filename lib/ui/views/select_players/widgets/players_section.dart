import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/fliters_button.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/player_grid.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';

class PlayersSection extends GetView<SelectPlayerController> {
  final SelectTeam selectTeam;
  const PlayersSection({super.key, required this.selectTeam});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    return SliverToBoxAdapter(
      child: ListView(
          dragStartBehavior: DragStartBehavior.down,
          controller: controller.scrollController,
          shrinkWrap: true,
          children: [
            const FilterButton(),
            Obx(
              () => AnimatedContainer(
                  clipBehavior: Clip.hardEdge,
                  height: controller.isSearch.value ? 60 : 0,
                  duration: const Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                      color: AppColors.backgroud,
                      borderRadius: BorderRadius.circular(5)),
                  child: OverflowBox(
                    fit: OverflowBoxFit.deferToChild,
                    minHeight: 0,
                    maxHeight: 60,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: AppTextField(
                        // textColor: AppColors.white,
                        // fillColor: AppColors.backgroud,
                        labelText: 'Search'.tr,
                        controller: controller.searchController,
                        onChanged: (value) {
                          controller.searchQuery.value = value;
                        },
                      ),
                    ),
                  )),
            ),
            verticalSpace(10),
            PlayersGrid(selectTeam.homeTeam!.name!, selectTeam.awayTeam!.name!)
          ]),
    );
  }
}
