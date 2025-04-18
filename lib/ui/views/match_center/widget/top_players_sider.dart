import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/top_players_card.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

class TopPlayersSider extends GetView<MatchCenterInner> {
  final InnerMatchCenterModel data;
  const TopPlayersSider({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return Column(
      children: [
        data.playersBreakDown.isEmpty
            ? Text('notAvailable'.tr)
            : Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: CarouselSlider.builder(
                  //carouselController:
                  // controller.carouselController,
                  controller: controller.carouselController,
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    PlayersBreakDown topPlayers = data.playersBreakDown[index];
                    return TopPlayersCard(
                      topPlayers: topPlayers,
                      indexs: index,
                    );
                  },
                  options: CarouselOptions(
                    aspectRatio: AppSizing.isTablet(context) ? 1.3 : 0.9,
                    viewportFraction: AppSizing.isTablet(context) ? 0.5 : 0.62,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: false,
                    padEnds: false,
                    onPageChanged: (index, reason) {
                      controller.topPlayerCrouselIndex.value = index;
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
