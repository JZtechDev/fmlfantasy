import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/authentication_controller.dart';
import 'package:fmlfantasy/ui/views/authentication/widgtes/form_container.dart';
import 'package:fmlfantasy/ui/views/authentication/widgtes/top_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthenticationController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: false,
      backgroundColor: AppColors.grey,
      body: Stack(children: [
        TopContainer(),
        FormsContainer(),
      ]),
    );
  }
}
