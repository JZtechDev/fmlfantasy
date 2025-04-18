// ignore_for_file: file_names
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/create_contest/controller/create_contests_controller.dart';
import 'package:fmlfantasy/ui/views/create_contest/widgets/add_members.dart';
import 'package:fmlfantasy/ui/views/create_contest/widgets/confirem_details.dart';
import 'package:fmlfantasy/ui/views/create_contest/widgets/contest_settings.dart';
import 'package:easy_stepper/easy_stepper.dart';

class CreateContestStepper extends GetView<CreateContestsController> {
  const CreateContestStepper({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateContestsController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(children: [
        Obx(
          () => EasyStepper(
            titlesAreLargerThanSteps: false,
            stepRadius: 20.r,
            lineStyle: LineStyle(
              lineLength: Get.width * 0.2,
              lineType: LineType.normal,
              lineThickness: 3,
              activeLineColor: AppColors.borderColor,
              unreachedLineColor: AppColors.borderColor,
              finishedLineColor: AppColors.primary,
            ),
            textDirection: TextDirection.rtl,
            enableStepTapping:
                controller.canTapStep(controller.activeStep.value),
            showLoadingAnimation: false,
            stepAnimationDuration: const Duration(milliseconds: 1000),
            activeStepBackgroundColor: AppColors.primary,
            unreachedStepBackgroundColor: AppColors.borderColor,
            finishedStepBackgroundColor: AppColors.primary,
            activeStepBorderColor: AppColors.primary,
            unreachedStepBorderColor: AppColors.borderColor,
            activeStepBorderType: BorderType.normal,
            borderThickness: 2,
            stepAnimationCurve: Curves.easeIn,
            unreachedStepTextColor: AppColors.textGray,
            finishedStepTextColor: AppColors.primary,
            activeStepTextColor: AppColors.primary,
            activeStep: controller.activeStep.value,
            onStepReached: (index) {
              if (controller.canTapStep(index)) {
                controller.activeStep.value = index;
              } else if (index < controller.activeStep.value &&
                  controller.stepCompleted[index]) {
                controller.activeStep.value = index;
              }
            },
            steps: List.generate(3, (index) {
              String title;
              switch (index) {
                case 0:
                  title = 'contestSettings'.tr;
                  break;
                case 1:
                  title = 'inviteFriends'.tr;
                  break;
                case 2:
                  title = 'confirmDetails'.tr;
                  break;
                default:
                  title = '';
              }
              return EasyStep(
                customTitle: Text(
                  title,
                  style: globalTextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: controller.activeStep.value == index ||
                            controller.activeStep.value > index
                        ? AppColors.primary
                        : AppColors.textGray,
                  ),
                  textAlign: TextAlign.center,
                ),
                customStep: Text(
                  '${index + 1}',
                  style: globalTextStyle2(
                    color: controller.activeStep.value == index ||
                            controller.activeStep.value > index
                        ? AppColors.white
                        : AppColors.dark,
                    fontSize: 16.sp,
                  ),
                ),
                title: title,
              );
            }),
          ),
        ),
        Obx(() {
          switch (controller.activeStep.value) {
            case 0:
              return const ContestSettings();
            case 1:
              return AddMembers(
                onComplete: () {
                  controller.completeStep(1);
                },
              );
            case 2:
              return ConfirmDetails(
                onComplete: () {
                  controller.confirmContestSubmit();
                },
              );
            default:
              return Container();
          }
        }),
      ]),
    );
  }
}
