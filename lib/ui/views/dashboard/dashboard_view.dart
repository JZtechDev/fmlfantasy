import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/layout.dart';
import 'package:fmlfantasy/ui/views/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_svg/svg.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return CustomLayout(
      appBar: Obx(
        () => SportsTabBar(
          sportsList: controller.sportsList,
          selectedIndex: controller.sportsList
              .indexWhere((sport) => sport.title == selectedSPort.value),
          onTap: (index) {
            selectedSPort.value = controller.sportsList[index].title;
            controller.selectedIndex.value = index;
          },
        ),
      ),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: controller.cardsList.length,
          itemBuilder: (context, index) {
            final e = controller.cardsList[index];
            return GestureDetector(
                onTap: () {
                  Get.toNamed(e.route);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        stops: [0.1, 0.5, 01],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryVeryDark,
                          AppColors.primaryDark,
                          AppColors.primary,
                        ]),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          e.icon,
                          height: 35,
                          width: 35,
                          color: AppColors.secondary,
                        ),
                        verticalSpace(15),
                        Text(
                          textAlign: TextAlign.center,
                          e.title,
                          style: globalTextStyle(
                            color: AppColors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
