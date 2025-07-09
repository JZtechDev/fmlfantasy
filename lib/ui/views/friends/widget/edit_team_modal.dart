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
                "Edit Group".tr,
                style: globalTextStyle2(
                    fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
          ),
        ],
      ),
    );
  }
}
