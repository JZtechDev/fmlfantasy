import 'dart:developer';

import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/services/friends_services.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/views/friends/controller/friends_controller.dart';
import 'package:fmlfantasy/ui/views/friends/widget/tab.dart';
import 'package:flutter_svg/svg.dart';

class FriendsView extends GetView<FriendsController> {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FriendsController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarInner(title: 'Friends'),
      floatingActionButton: GetBuilder(
        init: FriendsController(),
        builder: (_) => FloatingActionButton.extended(
          extendedPadding: EdgeInsets.all(10.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          icon: SvgPicture.asset(AppImages.addIcon),
          label: controller.isContact
              ? Text('Add Contact'.tr,
                  style: globalTextStyle2(
                      fontSize: AppSizing.isMobile(context) ? 14.sp : 10.sp,
                      color: AppColors.white))
              : Text('Create Group'.tr,
                  style: globalTextStyle2(
                      fontSize: AppSizing.isMobile(context) ? 14.sp : 10.sp,
                      color: AppColors.white)),
          isExtended: true,
          backgroundColor: AppColors.primary,
          onPressed: () {
            controller.isContact
                ? controller.showContactsModal()
                : controller.showGroupModal();
          },
        ),
      ),
      body: CustomScrollView(shrinkWrap: true, slivers: [
        SliverAppBar(
          collapsedHeight: 50.h,
          automaticallyImplyLeading: false,
          pinned: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: const FriendsTab(),
        ),
        SliverToBoxAdapter(
            child: GetBuilder<FriendsController>(builder: (friends) {
          return friends.isContact
              ? Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(20.h),
                      ...controller.filteredData.map((e) {
                        return Container(
                            margin: EdgeInsets.only(
                                bottom: 10.w, left: 10.w, right: 10.w),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.borderColor),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(5.r)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.fullName!,
                                      style: globalTextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.navyBlue,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(e.email!,
                                        style: globalTextStyle2(
                                            fontSize: 10.sp,
                                            color: AppColors.textGray))
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.showEditContactModal(e);
                                      },
                                      child: const Icon(
                                        size: 20,
                                        FlutterRemix.edit_2_line,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    horizontalSpace(10.w),
                                    GestureDetector(
                                      onTap: () =>
                                          controller.showDeleteModal(() {
                                        Get.back();
                                      }, () {
                                        log('Testing');
                                      }, e.contactId!),
                                      child: const Icon(
                                        size: 20,
                                        FlutterRemix.delete_bin_3_line,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ));
                      })
                    ],
                  ),
                )
              : Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(20.h),
                      ...friends.groups.map((e) {
                        return GestureDetector(
                          onTap: () {
                            FriendsServices.getGroupMembers(
                                controller.token, e.userGroupId!);
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 10.w, left: 10.w, right: 10.w),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(5.r)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.userGroupName!,
                                        style: globalTextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.navyBlue,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.showAddRemoveModal(
                                              e.userGroupName!, e.userGroupId!);
                                        },
                                        child: const Icon(
                                          size: 20,
                                          FlutterRemix.add_circle_line,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      horizontalSpace(10.w),
                                      GestureDetector(
                                        onTap: () {
                                          controller.showEditModel(
                                              e.userGroupName!, e.userGroupId!);
                                        },
                                        child: const Icon(
                                          size: 20,
                                          FlutterRemix.edit_2_line,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      horizontalSpace(10.w),
                                      GestureDetector(
                                        onTap: () =>
                                            controller.showGroupDeleteModal(() {
                                          Get.back();
                                        }, () {
                                          log('Testing');
                                        }, e.userGroupId!),
                                        child: const Icon(
                                          size: 20,
                                          FlutterRemix.delete_bin_3_line,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        );
                      })
                    ],
                  ),
                );
        }))
      ]),
    );
  }
}
