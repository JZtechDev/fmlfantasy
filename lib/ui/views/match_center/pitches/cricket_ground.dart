import 'package:flutter_svg/svg.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';

class CricketGround extends StatelessWidget {
  final List<PlayersBreakDown> data;
  const CricketGround({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final outerCircleRadius = screenWidth * 0.9;
    final innerCircleRadius = screenWidth * 0.4;

    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      width: Get.width,
      height: Get.height * 0.6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 83, 71, 1),
            ),
          )),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: outerCircleRadius,
                height: outerCircleRadius,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              Container(
                width: innerCircleRadius,
                height: innerCircleRadius,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.7),
                    width: 1.5,
                  ),
                ),
              ),
              Wrap(
                spacing: 20.w,
                runSpacing: 30.h,
                alignment: WrapAlignment.center,
                children: data.map((player) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        selectedSPort.value == 'FB'
                            ? player.imageUrl == null ||
                                    player.imageUrl!.isEmpty
                                ? player.jerseyImage == null ||
                                        player.jerseyImage!.isEmpty
                                    ? Container()
                                    : player.jerseyImage!.endsWith('.svg')
                                        ? SvgPicture.network(
                                            player.jerseyImage!,
                                            height: 25.h,
                                            width: 25.w,
                                          )
                                        : Image.network(
                                            player.jerseyImage!,
                                            height: 25.h,
                                            width: 25.w,
                                          )
                                : player.imageUrl == null ||
                                        player.imageUrl!.isEmpty
                                    ? Container()
                                    : player.imageUrl!.endsWith('.svg')
                                        ? SvgPicture.network(
                                            player.imageUrl!,
                                            height: 25.h,
                                            width: 25.w,
                                          )
                                        : Image.network(
                                            player.imageUrl!,
                                            height: 25.h,
                                            width: 25.w,
                                          )
                            : player.imageUrl == null ||
                                    player.imageUrl!.isEmpty
                                ? Container()
                                : player.imageUrl!.endsWith('.svg')
                                    ? selectedSPort.value == 'CR'
                                        ? Image.network(
                                            replaceSvgWithPng(player.imageUrl!),
                                            height: 25.h,
                                          )
                                        : SvgPicture.network(
                                            player.imageUrl!,
                                            height: 25.h,
                                            width: 25.w,
                                          )
                                    : Image.network(
                                        player.imageUrl!,
                                        height: 25.h,
                                        width: 25.w,
                                      ),
                        verticalSpace(5.h),
                        Text(
                          player.name ?? '-',
                          style: globalTextStyle(
                            fontSize:
                                AppSizing.isMobile(context) ? 10.sp : 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/new_images/cricket_pitch.png',
              height: 80.h,
            ),
          )
        ],
      ),
    );
  }
}
