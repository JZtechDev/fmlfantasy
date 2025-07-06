import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/controller/play_sportypick_controller.dart';

class QuestionBar extends StatelessWidget {
  const QuestionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlaySportypickController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.darkGreen,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Week 12',
                    style: globalTextStyle(
                        fontSize: 18,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w800)),
                Text('17-23rd March 2025',
                    style: globalTextStyle(
                        fontSize: 12,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          verticalSpace(10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.quizzes.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      controller.jumpToQuestion(index);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: controller.quizzes[index].selectedAnswerIndex !=
                                null
                            ? AppColors.secondary
                            : const Color.fromRGBO(18, 96, 85, 1),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: controller.currentQuestionIndex.value == index
                              ? AppColors.secondary
                              : Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Q${index + 1}',
                          style: globalTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:
                                controller.quizzes[index].selectedAnswerIndex !=
                                        null
                                    ? AppColors.backgroud
                                    : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
