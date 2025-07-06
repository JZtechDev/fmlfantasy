import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
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
      appBar: const HomeAppBar(title: 'Play SportyPick'),
      body: Stack(
        children: [
          CustomScrollView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              slivers: [
                CustomSliver(
                  appBar: Obx(
                    () => Column(
                      children: [
                        SportsTabBar(
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
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child:
                      GetBuilder<PlaySportypickController>(builder: (context) {
                    return controller.quizzes.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
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
