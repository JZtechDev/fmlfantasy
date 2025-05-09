import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/team_name/controller/team_name_controller.dart';
import 'package:fmlfantasy/ui/views/team_name/widgets/team_name_form.dart';
import 'package:fmlfantasy/ui/widgets/button_with_arrow.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';
import 'package:fmlfantasy/ui/widgets/privious_button.dart';

class TeamNameView extends GetView<TeamNameController> {
  const TeamNameView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TeamNameController());
    return Scaffold(
      backgroundColor: AppColors.backgroud,
      appBar: const HomeAppBar(
        title: 'Home',
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 15.w,
            right: 15.w,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [PreviousButton(), DashboardButton()],
            ),
          ),
          const TeamNameForm(),
          Positioned(
            bottom: 45.h,
            left: 15.w,
            right: 15,
            child: Obx(() => ButtonWithArrow(
                  buttonText: 'SAVE AND CONTINUE'.tr,
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
