import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/price_formater.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';

class SelectedPlayer extends GetView<SelectPlayerController> {
  const SelectedPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    return LayoutBuilder(builder: (context, constraints) {
      double textSize = AppSizing.isMobile(context) ? 12.sp : 8.sp;
      return Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 30.h,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      border: Border.all(color: AppColors.backgroud),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Obx(() {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 30.h,
                        padding: const EdgeInsets.all(20),
                        clipBehavior: Clip.hardEdge,
                        width:
                            controller.width * controller.getSalaryPercentage(),
                        decoration: BoxDecoration(
                          color: AppColors.darkGreen,
                          // border: Border.all(color: AppColors.primaryLight),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 0.w,
                      right: 10.w,
                      top: 0.h,
                      bottom: 0.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          height: 30.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(18, 96, 85, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.r),
                              bottomLeft: Radius.circular(5.r),
                            ),
                          ),
                          child: Image.asset(
                            'assets/new_images/salary.png',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        horizontalSpace(10.w),
                        Obx(
                          () => Text(
                              textAlign: TextAlign.center,
                              '${formatPrice(controller.totalPoints.value.toStringAsFixed(0))}/100,000',
                              style: globalTextStyle(
                                  fontSize: textSize,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpace(10.w),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 30.h,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Obx(() {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedContainer(
                        height: 30.h,
                        duration: const Duration(microseconds: 1000),
                        padding: const EdgeInsets.all(20),
                        clipBehavior: Clip.hardEdge,
                        width: controller.width *
                            controller.getPlayersPercentage(),
                        decoration: BoxDecoration(
                          color: AppColors.darkGreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 0.w,
                      right: 10.w,
                      top: 0.h,
                      bottom: 0.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            height: 30.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(18, 96, 85, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.r),
                                bottomLeft: Radius.circular(5.r),
                              ),
                            ),
                            child: const Icon(
                              FlutterRemix.user_3_line,
                              size: 20,
                              color: AppColors.white,
                            )),
                        horizontalSpace(10.w),
                        Row(
                          children: [
                            SizedBox(
                              width: 60.w,
                              child: Text(
                                'Selected'.tr,
                                style: globalTextStyle(
                                    fontSize: textSize,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Obx(() => Text(
                                "${controller.selectedPlayers.length.toString()}/11",
                                style: globalTextStyle(
                                    fontSize: textSize,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
