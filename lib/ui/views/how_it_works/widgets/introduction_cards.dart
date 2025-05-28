import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmlfantasy/ui/views/how_it_works/controller/how_it_works_controller.dart';
import 'package:get/get.dart';

class IntroductionCards extends StatelessWidget {
  const IntroductionCards({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HowItWorksController>(builder: (controller) {
      return CarouselSlider.builder(
        controller: controller.carouselController,
        itemCount: controller.introCards.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: Get.width,
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.only(right: 60.w, left: 60.w),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(77, 134, 126, 1),
                borderRadius: BorderRadius.circular(5.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
                    decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Text(
                      controller.introCards[index].number,
                      style: globalTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 26.sp,
                        color: AppColors.backgroud,
                      ),
                    )),
                verticalSpace(15.h),
                Text(controller.introCards[index].title,
                    style: globalTextStyle(
                        fontSize: 20.sp,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700)),
                verticalSpace(10.h),
                Text(controller.introCards[index].description,
                    style: globalTextStyle(
                        fontSize: 16.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500))
              ],
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 16 / 11,
          viewportFraction: 1.15,
          initialPage: 0,
          enableInfiniteScroll: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ),
      );
    });
  }
}
