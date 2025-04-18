import 'package:flutter/cupertino.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';

// ignore: must_be_immutable
class ErrorWidgetPage extends StatelessWidget {
  ErrorWidgetPage(this.details, {super.key});

  FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Icon(
            CupertinoIcons.exclamationmark_bubble,
            size: 50.h,
            color: AppColors.primary,
          ),
          verticalSpace(20.h),
          Text('Somthing Went Wrong! Please Try Again'.tr,
              style: globalTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              )),
        ],
      ),
    );
  }
}
