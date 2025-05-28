import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Data class to pass to the isolate
class TimerData {
  final DateTime startTime;
  final SendPort sendPort;

  TimerData(this.startTime, this.sendPort);
}

// Function to run in the isolate
void timerIsolate(TimerData data) {
  Timer.periodic(const Duration(seconds: 1), (timer) {
    final currentTime = DateTime.now();
    final timeDifference = data.startTime.difference(currentTime);

    if (timeDifference.isNegative) {
      data.sendPort.send({'matchEnded': true});
      timer.cancel();
    } else {
      data.sendPort.send({
        'matchEnded': false,
        'timeDifference': timeDifference.inSeconds,
      });
    }
  });
}

class MatchTimer extends StatefulWidget {
  final String startDate;
  const MatchTimer({super.key, required this.startDate});

  @override
  _MatchTimerState createState() => _MatchTimerState();
}

class _MatchTimerState extends State<MatchTimer> {
  ReceivePort? _receivePort;
  Isolate? _isolate;
  Duration? timeDifference;
  bool matchEnded = false;

  @override
  void initState() {
    super.initState();
    startTimerInIsolate();
  }

  @override
  void dispose() {
    _receivePort?.close();
    _isolate?.kill(priority: Isolate.immediate);
    super.dispose();
  }

  Future<void> startTimerInIsolate() async {
    final startTime = DateTime.parse(widget.startDate);
    final currentTime = DateTime.now();
    timeDifference = startTime.difference(currentTime);

    if (timeDifference!.isNegative) {
      setState(() {
        matchEnded = true;
      });
      return;
    }
    _receivePort = ReceivePort();
    _receivePort!.listen((message) {
      if (mounted) {
        setState(() {
          if (message['matchEnded'] == true) {
            matchEnded = true;
            _receivePort?.close();
            _isolate?.kill(priority: Isolate.immediate);
          } else {
            timeDifference = Duration(seconds: message['timeDifference']);
          }
        });
      }
    });

    // Spawn the isolate
    _isolate = await Isolate.spawn(
      timerIsolate,
      TimerData(startTime, _receivePort!.sendPort),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (matchEnded || timeDifference == null) {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        width: AppSizing.width(context),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Text(
          'MATCH ENDED',
          style: globalTextStyle(
              fontSize: 12.sp,
              color: AppColors.secondary,
              fontWeight: FontWeight.w700),
        ),
      );
    }

    int days = timeDifference!.inDays;
    int hours = timeDifference!.inHours.remainder(24);
    int minutes = timeDifference!.inMinutes.remainder(60);
    // int seconds = timeDifference!.inSeconds.remainder(60);

    final textSize = MediaQuery.of(context).size.width > 600 ? 8.sp : 12.sp;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: AppSizing.width(context),
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
              // Text(
              //   '$seconds SEC',
              //   style: globalTextStyle(
              //     fontSize: textSize,
              //     fontWeight: FontWeight.w700,
              //     color: AppColors.secondary,
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

// Usage in your widget tree remains the same
// controller.matchData.isEmpty
//     ? Container()
//     : MatchTimer(
//         key: const ValueKey('MatchTimer'),
//         startDate: controller.matchData['ExpStartDate'],
//       ),
