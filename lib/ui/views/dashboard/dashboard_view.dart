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
        child: Column(
          children: [
            // ClipPath(
            //   clipper: TrapezoidClipper(),
            //   child: Container(
            //     width: Get.width * 0.6,
            //     height: 20.h,
            //     color: AppColors.secondary,
            //     child: const Center(
            //       child: Text(
            //         'Trapezoid',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Wrap(
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: List.generate(controller.cardsList.length, (index) {
                final e = controller.cardsList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5), // Adjust spacing between items
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(e.route);
                    },
                    child: Container(
                      width: Get.width * 0.3,
                      height: Get.height * 0.15,
                      padding: const EdgeInsets.only(top: 10, bottom: 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          stops: [0.1, 0.5, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primaryVeryDark,
                            AppColors.primaryDark,
                            AppColors.primary,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ),
                );
              }),
            ),
          ],
        ));
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Top-left: Start at (20, 0) to make top edge wider
    path.moveTo(20, 0);
    // Top-right: End at (width - 20, 0)
    path.lineTo(size.width - 20, 0);
    // Bottom-right: Slant to (width - 40, height) for narrower bottom
    path.lineTo(size.width - 40, size.height);
    // Bottom-left: Slant to (40, height)
    path.lineTo(40, size.height);
    // Close the path back to top-left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
