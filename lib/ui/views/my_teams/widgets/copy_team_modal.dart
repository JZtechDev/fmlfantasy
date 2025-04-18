import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class CopyTeamDialogue extends GetView<MyTeamsController> {
  const CopyTeamDialogue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: Get.height * 0.25,
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Team Name',
                  style: globalTextStyle(fontSize: 20.sp),
                ),
                verticalSpace(30.h),
                AppTextField(
                  labelText: 'Enter Team Name',
                  controller: controller.teamName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Team Name is Required';
                    }
                    return null;
                  },
                ),
                verticalSpace(30.h),
                Obx(() => PrimaryButton(
                    isLoading: controller.copyLoading.value,
                    buttonText: 'Copy',
                    onPressed: () {
                      controller.copyTeam(
                          controller.selectedSport.value,
                          controller.teamId.value,
                          controller.teamName.text,
                          controller.token,
                          context);
                    },
                    isEnabled: true)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
