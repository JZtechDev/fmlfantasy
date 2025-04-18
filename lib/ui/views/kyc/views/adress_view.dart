import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/kyc/controller/kyc_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';

class AdressView extends StatelessWidget {
  const AdressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KycController());
    return GetBuilder<KycController>(builder: (controller) {
      return Scaffold(
          body: Padding(
        padding:
            const EdgeInsets.only(top: 90, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(CupertinoIcons.arrow_left)),
            verticalSpace(10),
            Text('Your Address'.tr, style: globalTextStyle(fontSize: 26.sp)),
            verticalSpace(30),
            Form(
              key: controller.adressFormKey,
              child: Column(
                children: [
                  AppTextField(
                    labelText: 'Street'.tr,
                    controller: controller.streetController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Street is required';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  AppTextField(
                    labelText: 'House Number'.tr,
                    controller: controller.houseNumberController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'House Number is required';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  AppTextField(
                    labelText: 'Address Suplements'.tr,
                    controller: controller.adressSuplementsController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Address Suplements is required';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  AppTextField(
                    labelText: 'City'.tr,
                    controller: controller.cityController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'City is required';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  AppTextField(
                    labelText: 'Postal Code'.tr,
                    controller: controller.postalCodeController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Postal Code is required';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  AppTextField(
                    labelText: 'Country'.tr,
                    controller: controller.countryController,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Country is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
                buttonText: 'Continue With This Address',
                onPressed: () {
                  controller.completeAdress();
                },
                isEnabled: true),
          ],
        ),
      ));
    });
  }
}
