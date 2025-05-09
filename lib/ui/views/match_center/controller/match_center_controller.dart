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

  String day = DateTime.now().day.toString().padLeft(2, '0');
  String month = DateTime.now().month.toString().padLeft(2, '0');
  String year = DateTime.now().year.toString();
  String formattedDate = '';
  DateTime pastDate = DateTime.now().subtract(const Duration(days: 15));
  String formattedPastDate = '';


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
      rethrow;
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
