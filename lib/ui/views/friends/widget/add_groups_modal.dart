import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/friends/controller/friends_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class MakeGroupModal extends GetView<FriendsController> {
  const MakeGroupModal({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FriendsController());
    return GetBuilder<FriendsController>(
      builder: (controller) => Dialog(
        insetAnimationCurve: Curves.easeInOutCubicEmphasized,
        insetAnimationDuration: const Duration(seconds: 3),
        backgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  controller.nameController.clear();
                  controller.emailController.clear();
                  controller.phoneController.clear();
                  Get.back();
                },
                child: Container(
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.secondary,
                    ),
                    child: const Icon(FlutterRemix.close_line)),
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.backgroud,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Create Group".tr,
                  style: globalTextStyle2(
                      fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpace(40.h),
                  Form(
                    key: controller.formKeyGroup,
                    child: AppTextField(
                      controller: controller.groupNameController,
                      labelText: 'Group Name'.tr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter group name'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  verticalSpace(10.h),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: AppColors.primaryLight,
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
                                    builder: (controller) => Column(children: [
                                      Text('Add Contacts'.tr,
                                          style: globalTextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700)),
                                      verticalSpace(20.h),
                                      ...controller.filteredData.map((e) {
                                        bool isSelected = controller
                                            .selectContacts
                                            .contains(e);
                                        return GestureDetector(
                                          onTap: () {
                                            controller.selectedContacts(e);
                                          },
                                          child: Container(
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryDark,
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
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
                                                Icon(FlutterRemix.check_line,
                                                    color: isSelected
                                                        ? AppColors.secondary
                                                        : AppColors.borderColor)
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                      verticalSpace(10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.selectAllContacts();
                                            },
                                            child: Text('Select All'.tr,
                                                style: globalTextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w800,
                                                    color:
                                                        AppColors.secondary)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.clearAll();
                                            },
                                            child: Text('Remove All'.tr,
                                                style: globalTextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w800,
                                                    color: AppColors.errorRed)),
                                          ),
                                        ],
                                      ),
                                      verticalSpace(10.h),
                                      PrimaryButton(
                                          buttonText: 'Add',
                                          onPressed: () {
                                            Get.back();
                                          },
                                          isEnabled: true)
                                    ]),
                                  ),
                                ));
                          });
                    },
                    child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.grey,
                          border: Border.all(
                              color: AppColors.borderColor, width: 1),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15),
                        child: Text(
                          'Friends'.tr,
                          style: globalTextStyle2(
                              fontSize: 12.sp,
                              color: AppColors.textGray,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  verticalSpace(20.h),
                  GetBuilder<FriendsController>(
                    builder: (controller) => PrimaryButton(
                        isLoading: controller.isLoading,
                        buttonText: 'Create group'.tr,
                        onPressed: () {
                          controller.creatGroup();
                        },
                        isEnabled: true),
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
