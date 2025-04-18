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
                    color: AppColors.primaryDark,
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
                            fontWeight: FontWeight.w600,
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
    // Scaffold(
    //     drawer: const DrawerView(),
    //     extendBody: false,
    //     resizeToAvoidBottomInset: true,
    //     backgroundColor: AppColors.backgroud,
    //     appBar: const HomeAppBar(title: 'Dashboard'),
    //     body: CustomScrollView(slivers: [
    //       CustomSliver(
    //         appBar:
    // Obx(
    //           () => SportsTabBar(
    //             sportsList: controller.sportsList,
    //             selectedIndex: controller.sportsList
    //                 .indexWhere((sport) => sport.title == selectedSPort.value),
    //             onTap: (index) {
    //               selectedSPort.value = controller.sportsList[index].title;
    //               controller.selectedIndex.value = index;
    //               // controller.selectedSport.value =
    //               //     controller.sportsList[index].title;
    //             },
    //           ),
    //         ),
    //       ),
    //       SliverToBoxAdapter(
    //         child:
    // Column(
    //           children: [
    //             verticalSpace(5.h),
    //             SingleChildScrollView(
    //               padding: const EdgeInsets.only(top: 10, bottom: 10),
    //               child: Column(
    //                 children: [
    //                   ...controller.cardsList.map((e) {
    //                     return GestureDetector(
    //                       onTap: () {
    //                         Get.toNamed(e.route);
    //                       },
    //                       child: Container(
    //                         width: Get.width,
    //                         margin: const EdgeInsets.only(
    //                             bottom: 10, left: 10, right: 10),
    //                         decoration: BoxDecoration(
    //                           color: AppColors.primary.withValues(alpha: 0.6),
    //                           borderRadius: BorderRadius.circular(5),
    //                         ),
    //                         child: Stack(
    //                           children: [
    //                             Padding(
    //                               padding: const EdgeInsets.all(15),
    //                               child: Column(
    //                                 crossAxisAlignment:
    //                                     CrossAxisAlignment.start,
    //                                 children: [
    //                                   Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceBetween,
    //                                     children: [
    //                                       SvgPicture.asset(
    //                                         e.icon,
    //                                         height: 30,
    //                                         width: 30,
    //                                       ),
    //                                       const Icon(
    //                                         size: 30,
    //                                         CupertinoIcons
    //                                             .chevron_right_circle_fill,
    //                                         color: AppColors.white,
    //                                       )
    //                                     ],
    //                                   ),
    //                                   verticalSpace(30),
    //                                   Text(
    //                                     e.title,
    //                                     style: globalTextStyle(
    //                                         color: AppColors.white,
    //                                         fontSize: 22,
    //                                         fontWeight: FontWeight.w600),
    //                                   ),
    //                                   verticalSpace(10),
    //                                   Text(
    //                                     e.subtitle,
    //                                     style: globalTextStyle2(
    //                                         fontSize: 14,
    //                                         fontWeight: FontWeight.w400,
    //                                         color: AppColors.white),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             Positioned(
    //                                 bottom: 0,
    //                                 right: 0,
    //                                 child: Opacity(
    //                                   opacity: 0.6,
    //                                   child: Image.asset(
    //                                     e.image,
    //                                     height: 150,
    //                                   ),
    //                                 ))
    //                           ],
    //                         ),
    //                       ),
    //                     );
    //                   })
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       )
    //     ]));
  }
}
