import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/how_it_works/controller/how_it_works_controller.dart';

class GameplayPointsGrid extends GetView<HowItWorksController> {
  const GameplayPointsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HowItWorksController());
    return Obx(
      () => Column(children: [
        ...controller.innerTitlesList.map((e) => Container(
              padding: const EdgeInsets.all(1),
              margin: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Container(
                    height: Get.height * 0.15,
                    width: Get.width * 0.3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(77, 134, 126, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.r),
                        bottomLeft: Radius.circular(5.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: Get.height * 0.07,
                          width: Get.width * 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: e.score.contains('+')
                                ? const Color.fromRGBO(102, 203, 61, 1)
                                : AppColors.errorRed,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            e.score.toString(),
                            style: globalTextStyle(
                                fontSize: 26.sp, color: AppColors.white),
                          ),
                        ),
                        verticalSpace(5.h),
                        Text(
                          'Points',
                          style: globalTextStyle(
                              fontSize: 18.sp, color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(1),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        height: Get.height * 0.15,
                        width: Get.width * 0.3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(77, 134, 126, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.r),
                            bottomRight: Radius.circular(5.r),
                          ),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          e.subtitle,
                          style: globalTextStyle2(
                              fontSize: 16.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
