import 'dart:developer';

import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/services/tournament_services.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  RxInt selectedIndex = 0.obs;
  double scrollOffset = 0.0;
  bool showCarousel = false;
  RxBool isPrivateTOurnamentLoading = false.obs;
  RxBool isPublicTournamentsLoading = false.obs;
  RxString selectedSport = 'BB'.obs;
  String token = '';
  RxInt publicTournamentCrouselIndex = 0.obs;
  RxInt privateTournamentCrouselIndex = 0.obs;
  late AnimationController animationController;
  late AnimationController privateAnimationController;
  RxList<Tournaments> tournaments = <Tournaments>[].obs;
  RxList<Tournaments> privateTournaments = <Tournaments>[].obs;
  TournamentServices tournamentServices = TournamentServices();
  late Animation<double> fadeAnimation;
  late Animation<double> loginanimation;
  final CarouselSliderController publicTournamentcarouselController =
      CarouselSliderController();
  final CarouselSliderController privateTournamentcarouselController =
      CarouselSliderController();
  RxBool isPublicSelected = true.obs;
  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  Future<List<Tournaments>> fetchData() async {
    try {
      isPublicTournamentsLoading.value = true;
      List<Tournaments> fetchedTournaments = await tournamentServices
          .fetchTournamentsAndMatches(selectedSport.value);
      tournaments.value = fetchedTournaments.where((tournament) {
        DateTime? endDate;
        try {
          endDate = DateTime.parse(tournament.endDate!);
        } catch (e) {
          return false;
        }
        return endDate.isAfter(DateTime.now());
      }).toList();
      animationController.reset();
      animationController.forward();
      isPublicTournamentsLoading.value = false;
      return tournaments;
    } catch (error) {
      rethrow; // Rethrow the error to handle it in the FutureBuilder
    }
  }

  Future<List<Tournaments>> fetchPrivateTournaments() async {
    try {
      isPrivateTOurnamentLoading.value = true;
      List<Tournaments> fetchedTournaments = await tournamentServices
          .fetchPrivateTournaments(selectedSport.value, token);
      privateTournaments.value = fetchedTournaments;
      privateTournaments.value = fetchedTournaments.where((tournament) {
        DateTime? endDate;
        try {
          endDate = DateTime.parse(tournament.endDate!);
        } catch (e) {
          return false;
        }
        return endDate.isAfter(DateTime.now());
      }).toList();
      privateAnimationController.reset();
      privateAnimationController.forward();
      isPrivateTOurnamentLoading.value = false;
      return privateTournaments;
    } catch (error) {
      isPrivateTOurnamentLoading.value = false;
      rethrow; // Rethrow the error to handle it in the FutureBuilder
    }
  }

  void onNextPublicCard() {
    publicTournamentcarouselController.nextPage();
    //print(publicTournamentcarouselController.toString().capitalize);
  }

  void onPreviousPublicCard() {
    publicTournamentcarouselController.previousPage();
  }

  void onNextPrivateCard() {
    privateTournamentcarouselController.nextPage();
  }

  void onPreviousPrivateCard() {
    privateTournamentcarouselController.previousPage();
  }

  @override
  void onInit() async {
    selectedSport.value = selectedSPort.value;
    log(selectedSport.value);
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    privateAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    loginanimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    fadeAnimation = CurvedAnimation(
      parent: privateAnimationController,
      curve: Curves.easeIn,
    );
    loginanimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(
        parent: privateAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    token = await getStringValuesSF();
    fetchData();
    fetchPrivateTournaments();
    animationController.forward();
    privateAnimationController.forward();
    super.onInit();
  }

  void animation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();
  }

  void animationOnPrivate() {
    privateAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    fadeAnimation = CurvedAnimation(
      parent: privateAnimationController,
      curve: Curves.easeIn,
    );
    privateAnimationController.forward();
  }

  // void onTabTap(int index) {
  //   selectedIndex.value = index;
  //   animation();
  //   publicTournamentCrouselIndex.value = 0;
  //   privateTournamentCrouselIndex.value = 0;
  // }

  void toggleTournamentSearch() {
    isPublicSelected.value = !isPublicSelected.value;
  }
}
