import 'dart:async';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:flutter/material.dart';

// Assuming these are your imports for colors and text styles
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MatchTimer extends StatefulWidget {
  final String startDate;
  const MatchTimer({super.key, required this.startDate});

  @override
  // ignore: library_private_types_in_public_api
  _MatchTimerState createState() => _MatchTimerState();
}

class _MatchTimerState extends State<MatchTimer> {
  Timer? countdownTimer;
  late DateTime startTime;
  late Duration timeDifference;
  bool matchEnded = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  void startTimer() {
    startTime = DateTime.parse(widget.startDate);
    final currentTime = DateTime.now();
    timeDifference = startTime.difference(currentTime);

    if (timeDifference.isNegative) {
      setState(() {
        matchEnded = true;
      });
      return;
    }

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        timeDifference = timeDifference - const Duration(seconds: 1);
      });
      if (timeDifference.isNegative) {
        setState(() {
          matchEnded = true;
        });
        countdownTimer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (matchEnded) {
      return Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: SizedBox(
          height: Get.height * 0.15,
          child: Container(
            padding: const EdgeInsets.all(20),
            color: AppColors.backgroud,
            child: Center(
              child: Text(
                'MATCH ENDED',
                style: globalTextStyle(
                    fontSize: 12.sp,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      );
    }

    int days = timeDifference.inDays;
    int hours = timeDifference.inHours.remainder(24);
    int minutes = timeDifference.inMinutes.remainder(60);
    int seconds = timeDifference.inSeconds.remainder(60);

    final textSize = MediaQuery.of(context).size.width > 600 ? 8.sp : 12.sp;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/new_images/Stopwatch.png', height: 20.h),
              horizontalSpace(15.w),
              Text(
                'MATCH STARTS IN ',
                style: globalTextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              if (days > 0)
                Text(
                  '$days DAY${days > 1 ? 'S' : ''}  ',
                  style: globalTextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                  ),
                ),
              if (hours > 0)
                Text(
                  '$hours HRS  ',
                  style: globalTextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                  ),
                ),
              if (minutes > 0)
                Text(
                  '$minutes MINs  ',
                  style: globalTextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                  ),
                ),
              Text(
                '$seconds SEC',
                style: globalTextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
