import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/controller/play_sportypick_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class QuestionsSection extends StatelessWidget {
  const QuestionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlaySportypickController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 15),
                    decoration: const BoxDecoration(
                      color: AppColors.darkGreen,
                    ),
                    child: Text(
                      'Question ${controller.currentQuestionIndex.value + 1} of ${controller.quizzes.length}',
                      style: globalTextStyle2(
                        fontSize: 12,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 15),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                  ),
                  child: Text(
                    '10 pts',
                    style: globalTextStyle(
                        fontSize: 12,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                final isForward = controller.currentQuestionIndex.value >
                    controller.previousIndex;
                final beginOffset = isForward
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0);
                const endOffset = Offset.zero;

                final slideAnimation = Tween<Offset>(
                  begin: beginOffset,
                  end: endOffset,
                ).animate(animation);

                final reverseSlideAnimation = Tween<Offset>(
                  begin: isForward
                      ? const Offset(-1.0, 0.0)
                      : const Offset(1.0, 0.0),
                  end: endOffset,
                ).animate(animation);

                return SlideTransition(
                  position: child.key ==
                          ValueKey(controller.currentQuestionIndex.value)
                      ? slideAnimation
                      : reverseSlideAnimation,
                  child: child,
                );
              },
              child: Column(
                key: ValueKey(controller.currentQuestionIndex.value),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(44, 86, 80, 1),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller
                                  .quizzes[
                                      controller.currentQuestionIndex.value]
                                  .title
                                  .split(' Vs ')
                                  .join('\n'),
                              style: globalTextStyle(
                                  fontSize: 14,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              '7:00Pm',
                              style: globalTextStyle(
                                  fontSize: 12,
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w800),
                            ),
                            // Text(
                            //   'Closes in 2 hrs 32 mins',
                            //   style: globalTextStyle(
                            //       fontSize: 10, color: AppColors.textGray),
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(10),
                  Center(
                    child: Text(
                      controller.quizzes[controller.currentQuestionIndex.value]
                          .question,
                      style: globalTextStyle(
                          fontSize: 18,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  verticalSpace(10),
                  Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 10,
                    children: [
                      ...List.generate(
                        controller
                            .quizzes[controller.currentQuestionIndex.value]
                            .options
                            .length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Obx(
                            () {
                              final quiz = controller.quizzes[
                                  controller.currentQuestionIndex.value];
                              final option = quiz.options[index];

                              return GestureDetector(
                                onTap: () => controller.selectAnswer(
                                  controller.currentQuestionIndex.value,
                                  index,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: Get.width * 0.43,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: AppColors.secondary),
                                    color: quiz.selectedAnswerIndex == index
                                        ? AppColors.secondary
                                        : AppColors.backgroud,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      if (option.image != null &&
                                          option.image!.isNotEmpty)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: SvgPicture.network(
                                            option.image!,
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                      Text(
                                        option.title,
                                        style: globalTextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              quiz.selectedAnswerIndex == index
                                                  ? AppColors.backgroud
                                                  : AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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

// import 'package:fmlfantasy/app/app_colors/app_colors.dart';
// import 'package:fmlfantasy/app/textstyles/textstyle.dart';
// import 'package:fmlfantasy/ui/helpers/commons.dart';
// import 'package:fmlfantasy/ui/views/play_sportypick/controller/play_sportypick_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class QuestionsSection extends StatelessWidget {
//   const QuestionsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PlaySportypickController>(builder: (controller) {
//       return Expanded(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Qustion ${controller.currentQuestionIndex.value + 1} of ${controller.quizzes.length}',
//                         style: globalTextStyle2(
//                           fontSize: 12,
//                           color: AppColors.textGray,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 3),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: AppColors.primary,
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text(
//                           '10 pts',
//                           style: globalTextStyle(
//                               fontSize: 12,
//                               color: AppColors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       )
//                     ],
//                   ),
//                   verticalSpace(10),
//                   Text(
//                     controller
//                         .quizzes[controller.currentQuestionIndex.value].title,
//                     style: globalTextStyle(fontSize: 14, color: AppColors.dark),
//                   ),
//                   const Divider(
//                     color: AppColors.borderColor,
//                     indent: 20,
//                     endIndent: 20,
//                   ),
//                   Text(
//                     controller.quizzes[controller.currentQuestionIndex.value]
//                         .question,
//                     style: globalTextStyle(fontSize: 20),
//                   ),
//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     runAlignment: WrapAlignment.center,
//                     spacing: 10,
//                     children: [
//                       ...List.generate(
//                         controller
//                             .quizzes[controller.currentQuestionIndex.value]
//                             .options
//                             .length,
//                         (index) => Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: Obx(
//                             () {
//                               final quiz = controller.quizzes[
//                                   controller.currentQuestionIndex.value];
//                               final option = quiz.options[index];

//                               return GestureDetector(
//                                 onTap: () => controller.selectAnswer(
//                                   controller.currentQuestionIndex.value,
//                                   index,
//                                 ),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   width: Get.width * 0.43,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16, vertical: 8),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     border: Border.all(
//                                         color: AppColors.borderColor),
//                                     color: quiz.selectedAnswerIndex == index
//                                         ? AppColors.primary
//                                         : Colors.white,
//                                   ),
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         if (option.image != null &&
//                                             option.image!.isNotEmpty)
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 right: 8.0),
//                                             child: SvgPicture.network(
//                                               option.image!,
//                                               width: 100,
//                                               height: 100,
//                                             ),
//                                           ),
//                                         Text(
//                                           option.title,
//                                           style: globalTextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: quiz.selectedAnswerIndex ==
//                                                     index
//                                                 ? AppColors.white
//                                                 : AppColors.textGray,
//                                           ),
//                                         ),
//                                       ]),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
