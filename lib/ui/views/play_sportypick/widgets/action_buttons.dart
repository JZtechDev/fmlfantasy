import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/controller/play_sportypick_controller.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlaySportypickController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                      buttonText: 'Previous',
                      onPressed: () {
                        controller.previousQuestion();
                      },
                      isEnabled: true),
                ),
                Expanded(
                  child: PrimaryButton(
                      buttonText: 'Next',
                      onPressed: controller.nextQuestion,
                      isEnabled: true),
                )
              ],
            ),
            verticalSpace(10.h),
            PrimaryButton(
              buttonText: 'Reset',
              onPressed: controller.resetQuiz,
              isEnabled: true,
              backgroundColor: AppColors.errorRed,
            ),
            verticalSpace(10.h)
          ],
        ),
      );
    });
  }
}
