import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/friends/controller/friends_controller.dart';

class AddRemoveMembersModal extends GetView<FriendsController> {
  final String groupIds;
  const AddRemoveMembersModal({super.key, required this.groupIds});

  @override
  Widget build(BuildContext context) {
    Get.put(FriendsController());
    return GetBuilder<FriendsController>(
      builder: (controller) => Dialog(
        insetAnimationCurve: Curves.easeInOutCubicEmphasized,
        insetAnimationDuration: const Duration(seconds: 3),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            bottom: 15.h,
            top: 15.h,
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Get.close(1);
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                          color: AppColors.borderColor,
                        ),
                        color: AppColors.grey,
                      ),
                      child: const Icon(FlutterRemix.close_line)),
                ),
              ),
              Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Add New Members".tr,
                      style: globalTextStyle2(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    verticalSpace(20.h),
                    ...controller.groupMembers.map((e) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                e.imageUrl == null || e.imageUrl!.isEmpty
                                    ? Container()
                                    : CircleAvatar(
                                        radius: 15.r,
                                        backgroundColor: AppColors.white,
                                        backgroundImage:
                                            NetworkImage(e.imageUrl!),
                                        child: Image.network(e.imageUrl!),
                                      ),
                                horizontalSpace(10.w),
                                Text(
                                  e.fullName ?? '',
                                  style: globalTextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.deleteGroupMember(
                                    groupIds, e.contactUserId!);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.grey,
                                ),
                                child: Icon(FlutterRemix.close_line,
                                    color: AppColors.errorRed, size: 20.sp),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r)),
                            ),
                            isDismissible: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r),
                                        topRight: Radius.circular(10.r)),
                                  ),
                                  width: Get.width,
                                  padding: const EdgeInsets.all(10),
                                  child: SingleChildScrollView(
                                    child: GetBuilder<FriendsController>(
                                      builder: (controller) =>
                                          Column(children: [
                                        Text('Add Contacts'.tr,
                                            style: globalTextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500)),
                                        verticalSpace(20.h),
                                        ...controller.filteredData.map((e) {
                                          bool isSelected = controller
                                              .selectContactsId
                                              .contains(e.userId);
                                          return GestureDetector(
                                            onTap: () {
                                              controller.addNewMember(groupIds,
                                                  e.userId ?? '', e.contactId!);
                                            },
                                            child: Container(
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                                border: Border.all(
                                                  color: AppColors.borderColor,
                                                  width: 1,
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              margin: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(e.fullName!,
                                                      style: globalTextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  Icon(
                                                    Icons.check,
                                                    color: isSelected
                                                        ? AppColors.primary
                                                        : Colors.transparent,
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                      ]),
                                    ),
                                  ));
                            });
                      },
                      child: Container(
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.primary,
                            border: Border.all(
                                color: AppColors.borderColor, width: 1),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15),
                          child: Row(
                            children: [
                              Icon(FlutterRemix.add_line,
                                  color: AppColors.white, size: 15.sp),
                              verticalSpace(5.h),
                              Text(
                                'Add More'.tr,
                                style: globalTextStyle2(
                                    fontSize: 12.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
