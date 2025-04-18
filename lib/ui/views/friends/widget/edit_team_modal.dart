import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/friends/controller/friends_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class EditGroupModal extends GetView<FriendsController> {
  final String teamName;
  final String groupId;
  const EditGroupModal({
    super.key,
    required this.teamName,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(FriendsController());

    controller.editGroupNameController.text = teamName;
    return Dialog(
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
                  Get.back();
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
                  "Edit Group".tr,
                  style: globalTextStyle2(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                verticalSpace(20.h),
                AppTextField(
                    labelText: 'Group Name'.tr,
                    controller: controller.editGroupNameController),
                verticalSpace(20.w),
                GetBuilder<FriendsController>(
                  builder: (_) => PrimaryButton(
                      isLoading: controller.isLoading,
                      buttonText: 'Yes'.tr,
                      onPressed: () {
                        controller.editGroupName(groupId);
                      },
                      isEnabled: true),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
