import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/bull_player/controller/bull_player_controller.dart';
import 'package:fmlfantasy/ui/views/bull_player/widget/bottom_button_bull_player.dart';
import 'package:fmlfantasy/ui/views/bull_player/widget/bull_player_card.dart';
import 'package:fmlfantasy/ui/views/bull_player/widget/players_grid.dart';
import 'package:fmlfantasy/ui/widgets/navigation_buttons.dart';

class BullPlayerView extends GetView<BullPlayerController> {
  const BullPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BullPlayerController());
    return Scaffold(
      backgroundColor: AppColors.backgroud,
      appBar: const HomeAppBar(
        title: 'Home',
      ),
      body: CustomScrollView(
        slivers: [
          const NavigationButtons(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // verticalSpace(10.h),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [PreviousButton(), DashboardButton()],
                  // ),
                  verticalSpace(10.h),
                  const BullPlayerCard(),
                  verticalSpace(10.h),
                  Divider(
                    color: AppColors.secondary,
                    thickness: 2.0,
                    endIndent: 30.w,
                    indent: 30.w,
                  ),
                  Text(
                    'Tap to Select the star player'.tr,
                    style: globalTextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w700),
                  ),
                  verticalSpace(10.h),
                  const Playergrid(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BotttomButtonBullPlayer(),
    );
  }
}
