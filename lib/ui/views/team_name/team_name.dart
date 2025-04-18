import 'package:fmlfantasy/ui/views/team_name/controller/team_name_controller.dart';
import 'package:fmlfantasy/ui/views/team_name/widgets/team_name_appbar.dart';
import 'package:fmlfantasy/ui/views/team_name/widgets/team_name_form.dart';
import 'package:fmlfantasy/ui/views/team_name/widgets/team_name_lines.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamNameView extends GetView<TeamNameController> {
  const TeamNameView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TeamNameController());
    return Scaffold(
      body: Stack(
        children: [
          const TeamNameAppBar(),
          const LineContainer(),
          const TeamNameForm(),
          Positioned(
            bottom: 45.h,
            left: 15.w,
            right: 15,
            child: Obx(() => PrimaryButton(
                  buttonText: 'saveAndContinue'.tr,
                  isLoading: controller.isLoading.value,
                  isEnabled: true,
                  onPressed: () {
                    controller.validate();
                  },
                  height: 37.h,
                )),
          )
        ],
      ),
    );
  }
}
