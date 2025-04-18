import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/views/bull_player/controller/bull_player_controller.dart';
import 'package:fmlfantasy/ui/views/bull_player/widget/bottom_button_bull_player.dart';
import 'package:fmlfantasy/ui/views/bull_player/widget/bull_player_card.dart';
import 'package:fmlfantasy/ui/views/bull_player/widget/players_grid.dart';

class BullPlayerView extends GetView<BullPlayerController> {
  const BullPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BullPlayerController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarInner(
        title: 'Select Bull Player',
        backgroundColor: AppColors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Select Bull Player',
                  style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 27.sp : 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(10.h),
                const BullPlayerCard(),
              ],
            ),
          ),
          verticalSpace(10.h),
          Divider(
            color: AppColors.textGray.withOpacity(0.1),
          ),
          verticalSpace(10.h),
          const Playergrid()
        ],
      ),
      bottomNavigationBar: const BotttomButtonBullPlayer(),
    );
  }
}
