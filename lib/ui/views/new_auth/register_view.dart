import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/new_auth/controller/register_controller.dart';
import 'package:fmlfantasy/ui/views/new_auth/forms/register_form.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/top_container.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterNewController());
    return Scaffold(
        backgroundColor: Color.fromRGBO(44, 86, 80, 1),
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 120,
              left: 40,
              right: 40,
              child: Image.asset(AppImages.logo),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Fantasy Gaming is  right here.The thrill is at your fingertips! NO  passport required.',
                        style: globalTextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    verticalSpace(50.h),
                    GetBuilder<RegisterNewController>(builder: (controller) {
                      return Text(
                        'Welcome! Captain ${controller.firstNameController.text}'
                            .tr,
                        style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 18.sp : 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                      );
                    }),
                    verticalSpace(10.h),
                    const RegisterForm()
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
