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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Create Group".tr,
                    style: globalTextStyle2(
                        fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  verticalSpace(20.h),
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
                                    builder: (controller) => Column(children: [
                                      Text('Add Contacts'.tr,
                                          style: globalTextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500)),
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
                                                Icon(FlutterRemix.check_line,
                                                    color: isSelected
                                                        ? AppColors.primary
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
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.primary)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.clearAll();
                                            },
                                            child: Text('Remove All'.tr,
                                                style: globalTextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
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
                  // Obx(
                  //   () => MultiDropdown<GetContacts>(
                  //     items: controller.items
                  //         .toList(), // Bind to the reactive list
                  //     controller: controller.controller,
                  //     enabled: true,
                  //     searchEnabled: true,
                  //     chipDecoration: ChipDecoration(
                  //       deleteIcon: Icon(
                  //         size: 15.sp,
                  //         FlutterRemix.close_line,
                  //         color: AppColors.white,
                  //       ),
                  //       labelStyle: globalTextStyle2(
                  //           fontSize: 10.sp, color: AppColors.white),
                  //       borderRadius:
                  //           const BorderRadius.all(Radius.circular(5)),
                  //       backgroundColor: AppColors.primary,
                  //       wrap: true,
                  //       runSpacing: 2,
                  //       spacing: 10,
                  //     ),
                  //     fieldDecoration: FieldDecoration(
                  //         backgroundColor: AppColors.grey,
                  //         borderRadius: 5,
                  //         hintText: 'Friends'.tr,
                  //         hintStyle: globalTextStyle2(
                  //           fontSize: 12.sp,
                  //           color: AppColors.textGray,
                  //         ),
                  //         showClearIcon: false,
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //           borderSide:
                  //               const BorderSide(color: AppColors.borderColor),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //           borderSide: const BorderSide(
                  //             color: AppColors.borderColor,
                  //           ),
                  //         ),
                  //         disabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //           borderSide: const BorderSide(
                  //             color: AppColors.borderColor,
                  //           ),
                  //         )),
                  //     dropdownDecoration: DropdownDecoration(
                  //       borderRadius: const BorderRadius.all(
                  //         Radius.circular(5),
                  //       ),
                  //       marginTop: 2,
                  //       maxHeight: 400,
                  //       header: Padding(
                  //         padding: const EdgeInsets.all(8),
                  //         child: Text('Select Friends'.tr,
                  //             textAlign: TextAlign.start,
                  //             style: globalTextStyle2(
                  //               fontSize: 12.sp,
                  //               color: AppColors.textGray,
                  //             )),
                  //       ),
                  //     ),
                  //     dropdownItemDecoration: DropdownItemDecoration(
                  //       selectedBackgroundColor: AppColors.white,
                  //       selectedIcon:
                  //           Icon(Icons.check, color: Colors.green.shade300),
                  //       disabledIcon:
                  //           Icon(Icons.lock, color: Colors.grey.shade300),
                  //     ),
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'Please select friends'.tr;
                  //       }
                  //       return null;
                  //     },
                  //     onSelectionChange: (selectedItems) {
                  //       controller.selectContacts = selectedItems;
                  //     },
                  //   ),
                  // ),

                  // const SizedBox(height: 12),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         controller.controller.selectAll();
                  //       },
                  //       child: Text(
                  //         'Select all'.tr,
                  //         style: globalTextStyle2(
                  //             fontSize: 12.sp, color: AppColors.primary),
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         controller.controller.clearAll();
                  //       },
                  //       child: Text(
                  //         'Clear all'.tr,
                  //         style: globalTextStyle2(
                  //             fontSize: 12.sp, color: AppColors.errorRed),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // Wrap(
                  //   children: [
                  //     ...controller.items.map((item) {
                  //       return Padding(
                  //         padding: const EdgeInsets.all(5.0),
                  //         child: Chip(
                  //           backgroundColor: AppColors.primary,
                  //           label: Text(
                  //             item.label,
                  //             style: globalTextStyle2(
                  //                 fontSize: 10.sp, color: AppColors.white),
                  //           ),
                  //         ),
                  //       );
                  //     })
                  //   ],
                  // ),
                  verticalSpace(20.h),
                  GetBuilder<FriendsController>(
                    builder: (controller) => PrimaryButton(
                        isLoading: controller.isLoading,
                        buttonText: 'Create group'.tr,
                        onPressed: () {
                          controller.creatGroup();
                        },
                        isEnabled: true),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
