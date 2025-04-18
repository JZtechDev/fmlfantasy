import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/controller/players_stats_controller.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/widgets/players_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class PlayersInfoCard extends StatelessWidget {
  const PlayersInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlayersStatsController());
    return GetBuilder<PlayersStatsController>(builder: (controller) {
      return Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.only(
          top: 20,
          // left: 10,
          // right: 10,
        ),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          gradient: LinearGradient(
            colors: [
              AppColors.secondary.withValues(alpha: 0.9),
              AppColors.primary.withValues(alpha: 0.9),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      width: 40.r,
                      height: 40.r,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 20,
                          minWidth: 20,
                          maxHeight: 20,
                          maxWidth: 20,
                        ),
                        child: controller.playersInfo.nationalTeamFlag ==
                                    null ||
                                controller.playersInfo.nationalTeamFlag!.isEmpty
                            ? const Icon(
                                CupertinoIcons.flag,
                                color: AppColors.textGray,
                              )
                            : controller.playersInfo.nationalTeamFlag!
                                    .endsWith('.svg')
                                ? SvgPicture.network(
                                    controller.playersInfo.nationalTeamFlag!,
                                  )
                                : Image.network(
                                    colorBlendMode: BlendMode.colorBurn,
                                    controller.playersInfo.nationalTeamFlag!,
                                  ),
                      ),
                    ),
                  ),
                  ClipOval(
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: 120.r,
                      height: 120.r,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 100,
                          minWidth: 100,
                          maxHeight: 100,
                          maxWidth: 100,
                        ),
                        child: controller.playersInfo.picture == null ||
                                controller.playersInfo.picture!.isEmpty
                            ? Image.asset(
                                AppImages.userPlaceHolder,
                              )
                            : controller.playersInfo.picture!.endsWith('.svg')
                                ? SvgPicture.network(
                                    controller.playersInfo.picture!,
                                  )
                                : Image.network(
                                    colorBlendMode: BlendMode.colorBurn,
                                    controller.playersInfo.picture!,
                                  ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${controller.playersInfo.jerseyNumber}',
                  style: globalTextStyle(
                      fontSize: 18.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400),
                ),
                horizontalSpace(10),
                Text(
                  '${controller.playersInfo.assetName}',
                  style:
                      globalTextStyle(fontSize: 18.sp, color: AppColors.white),
                ),
              ],
            ),
            verticalSpace(10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: AppSizing.width(context),
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.white.withValues(alpha: 0.1),
                    Colors.white.withValues(alpha: 0.2),
                    Colors.white.withValues(alpha: 0.4),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
              child: Text(
                '\$${controller.playersInfo.assetIndexPoint!.toStringAsFixed(0)},000 Salary',
                style: globalTextStyle(fontSize: 14.sp, color: AppColors.white),
              ),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.white.withValues(alpha: 0.1),
                              Colors.white.withValues(alpha: 0.2),
                              Colors.white.withValues(alpha: 0.4),
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              color: AppColors.white.withValues(alpha: 0.4),
                              child: const Icon(CupertinoIcons.flag,
                                  color: AppColors.dark),
                            ),
                            horizontalSpace(5),
                            Text('${controller.playersInfo.nationalTeam}',
                                style: globalTextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )),
                  ),
                  horizontalSpace(5),
                  Expanded(
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.white.withValues(alpha: 0.1),
                              Colors.white.withValues(alpha: 0.2),
                              Colors.white.withValues(alpha: 0.4),
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              color: AppColors.white.withValues(alpha: 0.4),
                              child: const Icon(CupertinoIcons.flag,
                                  color: AppColors.dark),
                            ),
                            horizontalSpace(5),
                            Text(controller.playersInfo.club ?? '-',
                                style: globalTextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.white.withValues(alpha: 0.1),
                              Colors.white.withValues(alpha: 0.2),
                              Colors.white.withValues(alpha: 0.4),
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              color: AppColors.white.withValues(alpha: 0.4),
                              child: const Icon(CupertinoIcons.person,
                                  color: AppColors.dark),
                            ),
                            horizontalSpace(5),
                            Text('${controller.playersInfo.position}',
                                style: globalTextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )),
                  ),
                  horizontalSpace(5),
                  Expanded(
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.white.withValues(alpha: 0.1),
                              Colors.white.withValues(alpha: 0.2),
                              Colors.white.withValues(alpha: 0.4),
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              color: AppColors.white.withValues(alpha: 0.4),
                              child: const Icon(CupertinoIcons.calendar,
                                  color: AppColors.dark),
                            ),
                            horizontalSpace(5),
                            Text(controller.playersInfo.age.toString(),
                                style: globalTextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            verticalSpace(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.white.withValues(alpha: 0.1),
                              Colors.white.withValues(alpha: 0.2),
                              Colors.white.withValues(alpha: 0.4),
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              color: AppColors.white.withValues(alpha: 0.4),
                              child: const Row(
                                children: [
                                  Icon(CupertinoIcons.chevron_right,
                                      color: AppColors.dark, size: 20),
                                  Icon(CupertinoIcons.chevron_right,
                                      color: AppColors.dark, size: 20),
                                ],
                              ),
                            ),
                            horizontalSpace(5),
                            Text('Last Transfer Value',
                                style: globalTextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      width: 2,
                      indent: 10,
                      endIndent: 10,
                      color: AppColors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.white.withValues(alpha: 0.1),
                              Colors.white.withValues(alpha: 0.1),
                              Colors.white.withValues(alpha: 0.1),
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                        child: Text(
                          '\$13.5M',
                          style: globalTextStyle2(
                              fontSize: 12.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ],
              ),
            ),
            verticalSpace(10),
            Text(
              'Career all time',
              style: globalTextStyle2(fontSize: 13.sp, color: AppColors.white),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                showBottomBorder: false,
                horizontalMargin: 0,
                dividerThickness: 0,
                columnSpacing: 0,
                dataRowHeight: 35,
                columns: <DataColumn>[
                  const DataColumn(label: Text('')),
                  DataColumn(
                      headingRowAlignment: MainAxisAlignment.center,
                      label: Text(
                        'Club',
                        style: globalTextStyle2(
                            fontSize: 14.sp, color: AppColors.white),
                      )),
                  DataColumn(
                      headingRowAlignment: MainAxisAlignment.center,
                      label: Text('International',
                          style: globalTextStyle2(
                              fontSize: 14.sp, color: AppColors.white))),
                ],
                rows: controller.career[0].data.map((data) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Container(
                          width: Get.width * 0.45,
                          decoration: BoxDecoration(
                            border: const Border(
                                right: BorderSide(color: AppColors.white)),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white.withValues(alpha: 0.1),
                                Colors.white.withValues(alpha: 0.1),
                                Colors.white.withValues(alpha: 0.1),
                              ],
                              stops: const [0.0, 0.5, 1.0],
                            ),
                          ),
                          child: Center(
                              child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                color: AppColors.white.withValues(alpha: 0.7),
                                child: const Icon(CupertinoIcons.sportscourt),
                              ),
                              horizontalSpace(10),
                              Text(
                                data.name,
                                style: globalTextStyle(
                                    fontSize: 12.sp, color: AppColors.white),
                              ),
                            ],
                          )),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                            border: const Border(
                                right: BorderSide(color: AppColors.white)),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white.withValues(alpha: 0.1),
                                Colors.white.withValues(alpha: 0.1),
                                Colors.white.withValues(alpha: 0.1),
                              ],
                              stops: const [0.0, 0.5, 1.0],
                            ),
                          ),
                          child: Center(
                              child: Text(
                            data.club.toString(),
                            style: globalTextStyle(
                                fontSize: 12.sp, color: AppColors.white),
                          )),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white.withValues(alpha: 0.1),
                                Colors.white.withValues(alpha: 0.1),
                                Colors.white.withValues(alpha: 0.1),
                              ],
                              stops: const [0.0, 0.5, 1.0],
                            ),
                          ),
                          child: Center(
                              child: Text(
                            data.international.toString(),
                            style: globalTextStyle(
                                fontSize: 12.sp, color: AppColors.white),
                          )),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            verticalSpace(10),
            Text(
              'Previous  Teams',
              style: globalTextStyle2(fontSize: 13.sp, color: AppColors.white),
            ),
            verticalSpace(10),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.white.withValues(alpha: 0.1),
                      Colors.white.withValues(alpha: 0.1),
                      Colors.white.withValues(alpha: 0.1),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
                child: Text(
                  'Juventus, Real Madrid, Manchester United, Sporting CP, Sporting U19, Sporting U17, Nacional U15, Sporting Sub-15, Nacional Y, Nacional U15',
                  style: globalTextStyle2(
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400),
                )),
            verticalSpace(10),
            const PlayersTabBar(),
          ],
        ),
      );
    });
  }
}
