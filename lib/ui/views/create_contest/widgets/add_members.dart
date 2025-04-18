import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/create_contest/controller/create_contests_controller.dart';
import 'package:fmlfantasy/ui/views/create_contest/widgets/friends_tab.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:flutter_svg/svg.dart';

class AddMembers extends GetView<CreateContestsController> {
  final VoidCallback onComplete;
  const AddMembers({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateContestsController());
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r), color: AppColors.white),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r), color: AppColors.grey),
        child: Column(
          children: [
            const FriendsTab(),
            verticalSpace(5.h),
            Container(
                height: Get.height * 0.33,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: GetBuilder<CreateContestsController>(builder: (friends) {
                  return Stack(children: [
                    Obx(() => SingleChildScrollView(
                          child: friends.isContact
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpace(50.h),
                                    ...contacts.map((e) {
                                      bool isSelected = controller
                                          .selectedMembers
                                          .contains(e);
                                      return GestureDetector(
                                        onTap: () {
                                          controller.addMember(e);
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                              bottom: 10.w,
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.borderColor),
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 5.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e.fullName!,
                                                      style: globalTextStyle(
                                                          fontSize: 12.sp,
                                                          color: AppColors
                                                              .navyBlue,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(e.email!,
                                                        style: globalTextStyle2(
                                                            fontSize: 10.sp,
                                                            color: AppColors
                                                                .textGray))
                                                  ],
                                                ),
                                                isSelected
                                                    ? Image.asset(
                                                        AppImages.tick,
                                                        height: 20.h,
                                                        width: 10.w,
                                                        color: isSelected
                                                            ? AppColors.primary
                                                            : AppColors
                                                                .textGray)
                                                    : Container()
                                              ],
                                            )),
                                      );
                                    })
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpace(50.h),
                                    ...friends.groupsFilterData.map((e) {
                                      bool isSelected =
                                          controller.selectedGroups.contains(e);
                                      return GestureDetector(
                                        onTap: () {
                                          controller.addGroup(e);
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(
                                              bottom: 10.w,
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.borderColor),
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 5.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e.userGroupName!,
                                                      style: globalTextStyle(
                                                          fontSize: 12.sp,
                                                          color: AppColors
                                                              .navyBlue,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                                isSelected
                                                    ? Image.asset(
                                                        AppImages.tick,
                                                        height: 20.h,
                                                        width: 10.w,
                                                        color: isSelected
                                                            ? AppColors.primary
                                                            : AppColors
                                                                .textGray)
                                                    : Container()
                                              ],
                                            )),
                                      );
                                    }),
                                  ],
                                ),
                        )),
                    AppTextField(
                      labelText: 'Search'.tr,
                      controller: controller.searchController,
                      onChanged: (value) {
                        friends.isContact
                            ? controller.searchQuery.value = value
                            : controller.groupSearchQuery.value = value;
                      },
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10,
                      child: GestureDetector(
                        onTap: () {
                          controller.handleRefresh();
                        },
                        child: Row(children: [
                          const Icon(
                            FlutterRemix.refresh_line,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          horizontalSpace(5.w),
                          Text(
                            'Refresh'.tr,
                            style: globalTextStyle(
                                fontSize: 12.sp, color: AppColors.primary),
                          )
                        ]),
                      ),
                    )
                  ]);
                })),
            verticalSpace(5.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.friendsView);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.addIcon,
                      // ignore: deprecated_member_use
                      color: AppColors.primary,
                    ),
                    horizontalSpace(10.w),
                    Text(
                      'Add New Contacts or group'.tr,
                      style: globalTextStyle2(fontSize: 12.sp),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
