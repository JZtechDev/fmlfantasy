import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/controller/play_sportypick_controller.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlaySportypickController>(builder: (controller) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                    backgroundColor: AppColors.backgroud,
                    textColor: AppColors.secondary,
                    buttonText: 'Previous',
                    onPressed: () {
                      controller.previousQuestion();
                    },
                    isEnabled: true),
              ),
              Expanded(
                child: PrimaryButton(
                    backgroundColor: AppColors.backgroud,
                    textColor: AppColors.secondary,
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
            textColor: AppColors.white,
            borderColor: AppColors.errorRed,
          ),
          verticalSpace(10.h)
        ],
      );
    });
  }
}
