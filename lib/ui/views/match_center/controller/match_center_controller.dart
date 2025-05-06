import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/match_center_model.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/services/match_center_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchCenterController extends GetxController {
  MatchCenterServices matchCenterServices = MatchCenterServices();
  RxList<MatchCenterModel> matchData = <MatchCenterModel>[].obs;
  RxList<PastMatches> tournaments = <PastMatches>[].obs;
  RxBool isSearch = false.obs;
  var isloading = false.obs;
  RxInt selectedIndex = 0.obs;
  double scrollOffset = 0.0;
  RxString selectedSport = 'BB'.obs;
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;
  // Future<void> fetchMatchData() async {
  //   try {
  //     isloading(true);
  //     List<MatchCenterModel> data =
  //         await matchCenterServices.fetchMatchCenterData(
  //             selectedSport.value, formattedPastDate, formattedDate);
  //     matchData.assignAll(data);
  //     isloading(false);
  //   } catch (e) {
  //     throw Exception('Failed to fetch data and matches: $e');
  //   } finally {
  //     isloading(false);
  //   }
  // }

  String day = DateTime.now().day.toString().padLeft(2, '0');
  String month = DateTime.now().month.toString().padLeft(2, '0');
  String year = DateTime.now().year.toString();
  String formattedDate = '';
  DateTime pastDate = DateTime.now().subtract(const Duration(days: 15));
  String formattedPastDate = '';

  // useIsolate() async {
  //   ReceivePort receivePort = ReceivePort();
  //   final sendPort = receivePort.sendPort;
  //   final isolate = await Isolate.spawn(fetchMatchCenterData, sendPort);
  //   receivePort.listen((message) {
  //     tournaments.value = message;
  //     receivePort.close();
  //     isolate.kill();
  //   });
  // }

  // Future<void> fetchMatchCenterDataInIsolate(SendPort sendPort) async {
  //   try {
  //     // Simulate fetching data (you can replace this with your actual API call)
  //     List<MatchCenterModel> fetchedTournaments =
  //         await matchCenterServices.fetchMatchCenterData(
  //             selectedSport.value, formattedPastDate, formattedDate);

  //     // Send the result back to the main isolate
  //     sendPort.send(fetchedTournaments);
  //   } catch (error) {
  //     sendPort.send('Error: $error');
  //   }
  // }

  // Future<List<MatchCenterModel>> fetchMatchCenterData() async {
  //   try {
  //     // Create a ReceivePort to receive data from the isolate
  //     final receivePort = ReceivePort();

  //     // Pass the ReceivePort to the isolate

  //     // Spawn an isolate to run the fetchMatchCenterDataInIsolate function
  //     await Isolate.spawn(fetchMatchCenterDataInIsolate, receivePort.sendPort);

  //     // Wait for the result from the isolate
  //     final result = await receivePort.first;

  //     if (result is List<MatchCenterModel>) {
  //       tournaments.value = result;
  //       return result;
  //     } else {
  //       throw Exception('Failed to fetch tournaments: $result');
  //     }
  //   } catch (error) {
  //     rethrow; // Rethrow the error to handle it in the FutureBuilder
  //   }
  // }

  Future<List<PastMatches>> fetchMatchCenterData() async {
    try {
      EasyLoading.show(status: 'Loading...');
      List<PastMatches> fetchedTournaments =
          await matchCenterServices.pastMatches(selectedSport.value);
      tournaments.value = fetchedTournaments;
      EasyLoading.dismiss();
      return tournaments;
    } catch (error) {
      EasyLoading.dismiss();
      rethrow; // Rethrow the error to handle it in the FutureBuilder
    }
  }

  @override
  void onInit() {
    selectedSport.value = selectedSPort.value;
    formattedPastDate =
        '${pastDate.year}${pastDate.month.toString().padLeft(2, '0')}${pastDate.day.toString().padLeft(2, '0')}';
    formattedDate = '$year$month$day';
    super.onInit();
  }
}
