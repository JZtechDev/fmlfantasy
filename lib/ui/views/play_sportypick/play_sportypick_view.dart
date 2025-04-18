import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/controller/play_sportypick_controller.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/widgets/action_buttons.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/widgets/question_bar.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/widgets/questions_section.dart';

class PlaySportypickView extends GetView<PlaySportypickController> {
  const PlaySportypickView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlaySportypickController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarGeneral(title: 'Play Sportypick'),
      body: Stack(
        children: [
          CustomScrollView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                CustomSliver(
                  appBar: Obx(
                    () => SportsTabBar(
                      sportsList: controller.sportsList,
                      selectedIndex: controller.sportsList.indexWhere(
                          (sport) => sport.title == selectedSPort.value),
                      onTap: (index) {
                        selectedSPort.value =
                            controller.sportsList[index].title;
                        controller.selectedIndex.value = index;
                        controller.selectedSport.value =
                            controller.sportsList[index].title;
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child:
                      GetBuilder<PlaySportypickController>(builder: (context) {
                    return controller.quizzes.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              const QuestionBar(),
                              verticalSpace(20),
                              const QuestionsSection(),
                              verticalSpace(20),
                              const ActionButtons()
                            ],
                          );
                  }),
                )
              ]),
        ],
      ),
    );
  }
}
