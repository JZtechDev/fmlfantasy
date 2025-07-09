import 'dart:developer';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/services/friends_services.dart';
import 'package:fmlfantasy/ui/views/friends/controller/friends_controller.dart';
import 'package:fmlfantasy/ui/views/friends/widget/tab.dart';

class FriendsView extends GetView<FriendsController> {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FriendsController());
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromRGBO(44, 86, 80, 1),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: GetBuilder<FriendsController>(builder: (friends) {
          return Column(
            children: [
              verticalSpace(80.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Image.asset(
                  AppImages.logo,
                ),
              ),
              verticalSpace(10.h),
              GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  'assets/logo/back.png',
                  height: AppSizing.isMobile(context) ? 20.h : 80.h,
                ),
              ),
              verticalSpace(20.h),
              const FriendsTab(),
              friends.isContact
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
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(5.r)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 5.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h, horizontal: 10.w),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(217, 217, 217, 1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5.r),
                                              bottomLeft: Radius.circular(5.r)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.fullName!,
                                              style: globalTextStyle(
                                                  fontSize: 12.sp,
                                                  color: AppColors.navyBlue,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(e.email!,
                                                style: globalTextStyle2(
                                                    fontSize: 10.sp,
                                                    color: AppColors.dark,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5.r),
                                            bottomRight: Radius.circular(5.r)),
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller
                                                  .showEditContactModal(e);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: AppColors.secondary,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Icon(
                                                size: 20,
                                                FlutterRemix.edit_2_line,
                                                color: AppColors.dark,
                                              ),
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
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: AppColors.errorRed,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Icon(
                                                size: 20,
                                                FlutterRemix.delete_bin_3_line,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                            return Container(
                              margin: EdgeInsets.only(
                                  bottom: 10.w, left: 10.w, right: 10.w),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            217, 217, 217, 1),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.r),
                                          bottomLeft: Radius.circular(5.r),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            e.userGroupName!,
                                            style: globalTextStyle(
                                              fontSize: 12.sp,
                                              color: AppColors.navyBlue,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 10.w),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5.r),
                                        bottomRight: Radius.circular(5.r),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.showAddRemoveModal(
                                                e.userGroupName!,
                                                e.userGroupId!);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: AppColors.secondary,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Icon(
                                              size: 20,
                                              FlutterRemix.add_circle_line,
                                              color: AppColors.dark,
                                            ),
                                          ),
                                        ),
                                        horizontalSpace(10.w),
                                        GestureDetector(
                                          onTap: () {
                                            controller.showEditModel(
                                                e.userGroupName!,
                                                e.userGroupId!);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: AppColors.secondary,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Icon(
                                              size: 20,
                                              FlutterRemix.edit_2_line,
                                              color: AppColors.dark,
                                            ),
                                          ),
                                        ),
                                        horizontalSpace(10.w),
                                        GestureDetector(
                                          onTap: () => controller
                                              .showGroupDeleteModal(() {
                                            Get.back();
                                          }, () {
                                            log('Testing');
                                          }, e.userGroupId!),
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: AppColors.errorRed,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Icon(
                                              size: 20,
                                              FlutterRemix.delete_bin_3_line,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                    ),
              GestureDetector(
                onTap: () {
                  friends.isContact
                      ? controller.showContactsModal()
                      : controller.showGroupModal();
                },
                child: Container(
                    alignment: Alignment.center,
                    width: Get.width * 0.4,
                    margin: EdgeInsets.only(
                        bottom: AppSizing.isMobile(context) ? 20.h : 10.h,
                        left: 10.w,
                        right: 10.w),
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: AppSizing.isMobile(context) ? 7.h : 5.h),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          friends.isContact
                              ? AppImages.addContact
                              : AppImages.addGroup,
                          height: AppSizing.isMobile(context) ? 12.h : 15.h,
                        ),
                        horizontalSpace(5.w),
                        Text(
                          friends.isContact
                              ? 'Add Contact'.tr
                              : 'Create Group'.tr,
                          style: globalTextStyle(
                              fontSize: 12.sp,
                              color: AppColors.backgroud,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
              )
            ],
          );
        }),
      ),
    );
  }
}
