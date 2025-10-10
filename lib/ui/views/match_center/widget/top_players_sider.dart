import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/new_model/match_center_inner_new.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/top_players_card.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

class TopPlayersSider extends GetView<MatchCenterInner> {
  final MatchCenterInnerNew data;
  const TopPlayersSider({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return Column(
      children: [
        data.playerMatchStatistics == null
            ? Text('notAvailable'.tr)
            : Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: CarouselSlider.builder(
                  controller: controller.carouselController,
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    PlayerMatchStatistic topPlayers =
                        data.playerMatchStatistics[index];
                    return TopPlayersCard(
                        topPlayers: topPlayers, indexs: index);
                  },
                  options: CarouselOptions(
                    clipBehavior: Clip.hardEdge,
                    aspectRatio: AppSizing.isTablet(context) ? 1.3 : 0.85,
                    viewportFraction: AppSizing.isTablet(context) ? 0.5 : 0.9,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: false,
                    padEnds: true,
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
