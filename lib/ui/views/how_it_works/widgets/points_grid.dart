import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/how_it_works/controller/how_it_works_controller.dart';
import 'package:flutter_svg/svg.dart';

class GameplayPointsGrid extends GetView<HowItWorksController> {
  const GameplayPointsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HowItWorksController());
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.h),
      child: Obx(() {
        final itemCount = controller.innerTitlesList.length;
        final gridItemCount = itemCount;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 1050),
          curve: Curves.fastOutSlowIn,
          child: Column(
            key: ValueKey<int>(controller.innerTitlesList.length),
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
                  final isWideScreen = maxWidth > 600;
                  final crossAxisCount = isWideScreen ? 3 : 2;
                  final itemWidth =
                      (maxWidth - (crossAxisCount - 1) * 10) / crossAxisCount;
                  return Wrap(
                    spacing: 10, // Horizontal spacing between children
                    runSpacing: 10, // Vertical spacing between runs
                    children: List.generate(gridItemCount, (index) {
                      final item = controller.innerTitlesList[index];
                      final isLastItem = index == gridItemCount - 1;
                      final itemsInLastRow = (gridItemCount % crossAxisCount);
                      final remainingWidth =
                          maxWidth - ((itemsInLastRow - 1) * (itemWidth + 10));

                      return Container(
                        height: Get.height * 0.2,
                        width: isLastItem && itemsInLastRow != 0
                            ? remainingWidth
                            : itemWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: AppColors.borderColor),
                          color: AppColors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5),
                              child: Container(
                                height: Get.height * 0.1,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      double.tryParse(item.score) != null &&
                                              double.tryParse(item.score)! < 0
                                          ? 'assets/images/redBackground.png'
                                          : 'assets/images/blueBackground.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    item.score == ''
                                        ? SvgPicture.asset(
                                            'assets/icons/exclaimationIcon.svg',
                                            height: 25.h,
                                            width: 25.w)
                                        : Text(
                                            item.score,
                                            style: globalTextStyle(
                                                fontSize: isWideScreen
                                                    ? 20.sp
                                                    : 25.sp,
                                                color: AppColors.primary),
                                          ),
                                    item.score == ''
                                        ? verticalSpace(10)
                                        : const SizedBox(),
                                    item.score == ''
                                        ? const SizedBox()
                                        : Text(
                                            'points'.tr,
                                            style: globalTextStyle(
                                                fontSize:
                                                    isWideScreen ? 8.sp : 12.sp,
                                                color: AppColors.dark),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpace(20),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                item.subtitle,
                                style: globalTextStyle(
                                    fontSize: isWideScreen ? 8.sp : 12.sp,
                                    color: AppColors.dark),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
