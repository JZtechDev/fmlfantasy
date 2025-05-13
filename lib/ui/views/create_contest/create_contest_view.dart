import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/create_contest/controller/create_contests_controller.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class CreateContestView extends GetView<CreateContestsController> {
  const CreateContestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateContestsController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarGeneral(
        title: 'Create Contest',
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Row(children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.tournament.matches![0].home!
                            .split(' ')
                            .join('\n'),
                        style: globalTextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 40.h,
                          minHeight: 40.h,
                          maxWidth: 45.w,
                          minWidth: 45.w,
                        ),
                        child: controller.tournament.matches![0].homeImageUrl ==
                                null
                            ? Container()
                            : controller.tournament.matches![0].homeImageUrl!
                                    .endsWith('.svg.png')
                                ? Container()
                                : controller
                                        .tournament.matches![0].homeImageUrl!
                                        .endsWith('svg')
                                    ? controller.sportCode == 'CR' ||
                                            controller.sportCode == 'FB'
                                        ? Image.network(
                                            replaceSvgWithPng(controller
                                                .tournament
                                                .matches![0]
                                                .homeImageUrl
                                                .toString()),
                                            fit: BoxFit.fill,
                                          )
                                        : SvgPicture.network(
                                            controller.tournament.matches![0]
                                                .homeImageUrl
                                                .toString(),
                                            fit: BoxFit.fill,
                                          )
                                    : Image.network(
                                        controller
                                            .tournament.matches![0].homeImageUrl
                                            .toString(),
                                        fit: BoxFit.fill,
                                      ),
                      ),
                    ],
                  ),
                ),
                horizontalSpace(20.w),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 40.h,
                          minHeight: 40.h,
                          maxWidth: 45.w,
                          minWidth: 45.w,
                        ),
                        child: controller.tournament.matches![0].awayImageUrl ==
                                null
                            ? Container()
                            : controller.tournament.matches![0].awayImageUrl!
                                    .endsWith('.svg.png')
                                ? Container()
                                : controller
                                        .tournament.matches![0].awayImageUrl!
                                        .endsWith('svg')
                                    ? controller.sportCode == 'CR' ||
                                            controller.sportCode == 'FB'
                                        ? Image.network(
                                            replaceSvgWithPng(controller
                                                .tournament
                                                .matches![0]
                                                .awayImageUrl
                                                .toString()),
                                            fit: BoxFit.fill,
                                          )
                                        : SvgPicture.network(
                                            controller.tournament.matches![0]
                                                .awayImageUrl
                                                .toString(),
                                            fit: BoxFit.fill,
                                          )
                                    : Image.network(
                                        controller
                                            .tournament.matches![0].awayImageUrl
                                            .toString(),
                                        fit: BoxFit.fill,
                                      ),
                      ),
                      Text(
                        controller.tournament.matches![0].away!
                            .split(' ')
                            .join('\n'),
                        style: globalTextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            //  const CreateContestStepper(),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Obx(() {
                switch (controller.activeStep.value) {
                  case 0:
                    return PrimaryButton(
                      padding: 20.w,
                      buttonText: 'addMembers'.tr,
                      onPressed: () => controller.completeStep(0),
                      isEnabled: true,
                      iconPath: AppImages.nextIconSvg,
                    );
                  case 1:
                    return Obx(() => GestureDetector(
                        onTap: controller.selectedMembers.isEmpty
                            ? null
                            : () => controller.completeStep(1),
                        child: Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          width: Get.width,
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: controller.selectedMembers.isEmpty
                                ? AppColors.primary.withValues(alpha: 0.3)
                                : AppColors.primary,
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'add'.tr,
                                    style: globalTextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white),
                                  ),
                                  Text(
                                    ' ${controller.selectedMembers.length} ',
                                    style: globalTextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white),
                                  ),
                                  Text(
                                    'member'.tr,
                                    style: globalTextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white),
                                  ),
                                  Text(
                                    ' ${controller.selectedGroups.length} ',
                                    style: globalTextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white),
                                  ),
                                  Text(
                                    'Groups'.tr,
                                    style: globalTextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                              horizontalSpace(10.w),
                              Expanded(child: Container()),
                              Container(
                                height: 24.h,
                                width: 24.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white.withValues(alpha: 0.2),
                                ),
                                child: Image.asset(
                                  AppImages.nextIcon,
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              )
                            ],
                          ),
                        )));
                  case 2:
                    return Obx(
                      () => PrimaryButton(
                        buttonText: 'confirm&Share'.tr,
                        isLoading: controller.isloading.value,
                        onPressed: () {
                          controller.confirmContestSubmit();
                        },
                        isEnabled: true,
                      ),
                    );
                  default:
                    return Container();
                }
              }),
            ),
            // PrimaryButton(buttonText: '', onPressed: () {}, isEnabled: true)
          ],
        ),
      ),
    );
  }
}
