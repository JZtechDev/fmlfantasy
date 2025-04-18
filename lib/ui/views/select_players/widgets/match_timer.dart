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
            color: AppColors.white,
            child: Center(
              child: Text(
                'MATCH ENDED',
                style: globalTextStyle(
                    fontSize: 21.sp,
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

    return LayoutBuilder(builder: (context, constraints) {
      final textSize = constraints.maxWidth > 600 ? 8.sp : 12.sp;
      return Container(
          padding: const EdgeInsets.all(20),
          color: AppColors.white,
          child: Column(
            children: [
              Text(
                'matchCenterIn'.tr,
                style: globalTextStyle(
                    fontSize: 16.sp,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w700),
              ),
              verticalSpace(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (days > 0)
                        Text(
                          '$days',
                          style: globalTextStyle(
                              fontSize: textSize,
                              color: AppColors.dark,
                              fontWeight: FontWeight.w700),
                        ),
                      horizontalSpace(3),
                      Text('DAYS',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: globalTextStyle(
                              fontSize: textSize,
                              color: AppColors.dark,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '$hours',
                        style: globalTextStyle(
                            fontSize: textSize,
                            color: AppColors.dark,
                            fontWeight: FontWeight.w700),
                      ),
                      horizontalSpace(3),
                      Text('HOURS',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: globalTextStyle(
                              fontSize: textSize,
                              color: AppColors.dark,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('$minutes',
                          style: globalTextStyle(
                              fontSize: textSize,
                              color: AppColors.dark,
                              fontWeight: FontWeight.w700)),
                      horizontalSpace(3),
                      Text('MINUTES',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: globalTextStyle(
                              fontSize: textSize,
                              color: AppColors.dark,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('$seconds',
                          style: globalTextStyle(
                              fontSize: textSize,
                              color: AppColors.dark,
                              fontWeight: FontWeight.w700)),
                      horizontalSpace(3),
                      Text('SECONDS',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: globalTextStyle(
                              fontSize: textSize,
                              color: AppColors.dark,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
              // Text(
              //   '$days Days $hours Hours $minutes Minutes $seconds Seconds',
              //   style: globalTextStyle(fontSize: 21, color: AppColors.dark, fontWeight: FontWeight.w700),
              // ),
            ],
          ));
    });
  }
}
