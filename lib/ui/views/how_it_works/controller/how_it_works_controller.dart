import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/how_it_works_model.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/ui/views/how_it_works/models/intro_cards_model.dart';

class HowItWorksController extends GetxController {
  RxInt selectedIndex = 0.obs;
  double scrollOffset = 0.0;
  RxString selectedSport = 'BB'.obs;
  RxString selectedTitle = ''.obs;
  RxList<String> allTitles = <String>[].obs;
  TextEditingController dropdown = TextEditingController();
  late AnimationController animationController;
  late AnimationController secondaryAnimationController;

  final CarouselSliderController carouselController =
      CarouselSliderController();

  List<IntroCardsModel> introCards = [
    IntroCardsModel(
      title: 'Choose Your Sport',
      number: '01',
      description:
          'Select from a variety of sports including American football, basketball, soccer, cricket, and more.',
    ),
    IntroCardsModel(
      title: 'Draft your Team',
      number: '02',
      description:
          'Use your knowledge and expertise to draft the best team possible within the salary cap.',
    ),
    IntroCardsModel(
      title: 'Play, Score, Win!',
      number: '03',
      description:
          'Watch as your players compete and earn points based on their performance. The better they play, the more points you score!',
    ),
    IntroCardsModel(
      title: 'Cash in Your Prize',
      number: '04',
      description:
          'Win cash prizes based on your teams performance and climb the leaderboard to claim your spot among the fantasy elite.',
    ),
  ];
  RxInt publicTournamentCrouselIndex = 0.obs;
  RxInt privateTournamentCrouselIndex = 0.obs;
  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;
  RxList<InnerTitle> innerTitlesList = <InnerTitle>[].obs;
  final FocusNode focusNode = FocusNode();
  RxBool isDropDownOpened = false.obs;
  void combineTitles() {
    allTitles.clear();
    if (selectedSport.value == 'BB') {
      allTitles.addAll(basketBall.map((item) => item.title));
    } else if (selectedSport.value == 'FB') {
      allTitles.addAll(footballHowItWork.map((item) => item.title));
    } else if (selectedSport.value == 'CR') {
      allTitles.addAll(cricketHowItWorkT20.map((item) => item.title));
    } else if (selectedSport.value == 'AF') {
      allTitles.addAll(nfl.map((item) => item.title));
    } else if (selectedSport.value == 'BL') {
      allTitles.addAll(baseballHowItWorkOdi.map((item) => item.title));
    } else if (selectedSport.value == 'HK') {
      allTitles.addAll(hockeyHowItWorkOdi.map((item) => item.title));
    }
    // Add conditions for other sports...
    selectedTitle.value = allTitles.isNotEmpty ? allTitles.first : '';
    updateInnerTitlesList();
  }

  void updateInnerTitlesList() {
    innerTitlesList.clear();
    if (selectedSport.value == 'BB') {
      innerTitlesList.addAll(basketBall
          .where((item) => item.title == selectedTitle.value)
          .expand((item) => item.innerTitle));
    } else if (selectedSport.value == 'FB') {
      innerTitlesList.addAll(footballHowItWork
          .where((item) => item.title == selectedTitle.value)
          .expand((item) => item.innerTitle));
    } else if (selectedSport.value == 'CR') {
      innerTitlesList.addAll(cricketHowItWorkT20
          .where((item) => item.title == selectedTitle.value)
          .expand((item) => item.innerTitle));
    } else if (selectedSport.value == 'AF') {
      innerTitlesList.addAll(nfl
          .where((item) => item.title == selectedTitle.value)
          .expand((item) => item.innerTitle));
    } else if (selectedSport.value == 'BL') {
      innerTitlesList.addAll(baseballHowItWorkOdi
          .where((item) => item.title == selectedTitle.value)
          .expand((item) => item.innerTitle));
    } else if (selectedSport.value == 'HK') {
      innerTitlesList.addAll(hockeyHowItWorkOdi
          .where((item) => item.title == selectedTitle.value)
          .expand((item) => item.innerTitle));
    }
  }

  String getIconPath(String sportName) {
    switch (sportName) {
      case 'CR':
        return AppImages.cricket;
      case 'AF':
        return AppImages.americanFootballsvg;
      case 'BB':
        return AppImages.baseketball;
      case 'FB':
        return AppImages.footballsvg;
      case 'BL':
        return AppImages.baseballsvg;
      default:
        return AppImages
            .iceHockeysvg; // A default icon in case the sport is not recognized
    }
  }

  List<HowItWorkModel> footballHowItWork = [
    HowItWorkModel(title: 'attacking'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+20', subtitle: 'goalByForward'.tr),
      InnerTitle(score: '+25', subtitle: 'goalByMidfielder'.tr),
      InnerTitle(score: '+30', subtitle: 'goalByDefender'.tr),
      InnerTitle(score: '+50', subtitle: 'goalByGoalkeeper'.tr),
      InnerTitle(score: '+10', subtitle: 'assistByAnyPosition'.tr),
      InnerTitle(score: '+4', subtitle: 'shotTargetByAnyPosition'.tr),
      InnerTitle(score: '+2', subtitle: 'chanceCreatedByAnyPosition'.tr),
      InnerTitle(score: '+4', subtitle: 'passesCompletedByAnyPosition'.tr),
      InnerTitle(score: '-10', subtitle: 'penaltyMissedByAnyPosition'.tr),
    ]),
    HowItWorkModel(title: 'defense'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+2', subtitle: 'tackleWonByAnyPosition'.tr),
      InnerTitle(score: '+2', subtitle: 'interceptionWonByAnyPosition'.tr),
      InnerTitle(score: '+3', subtitle: 'goalSavedByGoalkeeper'.tr),
      InnerTitle(score: '+25', subtitle: 'penaltySavedByGoalkeeper'.tr),
      InnerTitle(score: '+10', subtitle: 'cleanSheet'.tr),
      InnerTitle(score: '-1', subtitle: 'goalConcededByDefenderGoalkeeper'.tr),
    ]),
    HowItWorkModel(title: 'team'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+2', subtitle: 'inStarting11ByAnyPosition'.tr),
      InnerTitle(score: '+1', subtitle: 'subOnByAnyPosition'.tr),
      InnerTitle(score: '+1', subtitle: 'subOFFByGoalkeeper'.tr),
      InnerTitle(score: '-4', subtitle: 'OwnGoalByAnyPosition'.tr),
    ]),
    HowItWorkModel(title: 'discipline'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '-2', subtitle: 'YellowCardByAnyPosition'.tr),
      InnerTitle(score: '-5', subtitle: 'redcardByAnyposition'.tr),
    ]),
  ];

  List<HowItWorkModel> basketBall = [
    HowItWorkModel(title: 'allPlayers'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+3', subtitle: 'threePointsFieldGoal'.tr),
      InnerTitle(score: '+2', subtitle: 'twoPointsFieldGoal'.tr),
      InnerTitle(score: '+1', subtitle: 'threeThrowsMade'.tr),
      InnerTitle(score: '1.2', subtitle: 'Rebounds'.tr),
      InnerTitle(score: '1.5', subtitle: 'Assists'.tr),
      InnerTitle(score: '+2', subtitle: 'BlockedShots'.tr),
      InnerTitle(score: '+2', subtitle: 'Steals'.tr),
      InnerTitle(score: '-1', subtitle: 'Turnovers'.tr),
    ]),
  ];

  List<HowItWorkModel> nfl = [
    HowItWorkModel(title: 'oFFENSIVEPLAYER'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+1', subtitle: 'passingyardsper25Yards'.tr),
      InnerTitle(score: '+4', subtitle: 'passingTouchdowns'.tr),
      InnerTitle(score: '-2', subtitle: 'passingInterpolations'.tr),
      InnerTitle(score: '+1', subtitle: 'rushing10perYards'.tr),
      InnerTitle(score: '+6', subtitle: 'rushingTouchdowns'.tr),
      InnerTitle(score: '+1', subtitle: 'receptionsonlyifusingPPRScoring'.tr),
      InnerTitle(score: '+1', subtitle: 'receivingYardsper10yards'.tr),
      InnerTitle(score: '+6', subtitle: 'receivingTouchdowns'.tr),
      InnerTitle(score: '+2', subtitle: '2PointConversions'.tr),
      InnerTitle(score: '-2', subtitle: 'fumblesLost'.tr),
      InnerTitle(score: '+6', subtitle: 'fumblesRecoveredforaTouchdown'.tr),
    ]),
    HowItWorkModel(title: 'tEAMDEFENSE'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+1', subtitle: 'sacks'.tr),
      InnerTitle(score: '+2', subtitle: 'interceptions'.tr),
      InnerTitle(score: '+2', subtitle: 'fumblesRecoveed'.tr),
      InnerTitle(score: '+2', subtitle: 'safeties'.tr),
      InnerTitle(score: '+6', subtitle: 'defensiveTouchdowns'.tr),
      InnerTitle(score: '+6', subtitle: 'kickandPuntReturnTouchdowns'.tr),
      InnerTitle(score: '+2', subtitle: '2PointConversionsReturns'.tr),
      InnerTitle(score: '+10', subtitle: 'pointsAllowed(0)'.tr),
      InnerTitle(score: '+7', subtitle: 'pointsAllowed(1-6)'.tr),
      InnerTitle(score: '+4', subtitle: 'poinstAllowed(7-13)'.tr),
      InnerTitle(score: '+1', subtitle: 'pointasAllowed(14-20)'.tr),
      InnerTitle(score: '0', subtitle: 'pointsAllowed(21-27)'.tr),
      InnerTitle(score: '-1', subtitle: 'pointsAllowed(28-34)'.tr),
      InnerTitle(score: '-4', subtitle: 'pointsAllowed(35+)'.tr),
    ]),
    HowItWorkModel(
        title: 'iNDIVIDUALDEFENSEPLAYER'.tr,
        imagePath: '',
        innerTitle: [
          InnerTitle(score: '+1', subtitle: 'soloTackles'.tr),
          InnerTitle(score: '+1/2', subtitle: 'assistTackles'.tr),
          InnerTitle(score: '+2', subtitle: 'sacks'.tr),
          InnerTitle(score: '+1', subtitle: 'sacksper10yards'.tr),
          InnerTitle(score: '+1', subtitle: 'tackelsForLoss'.tr),
          InnerTitle(score: '+1', subtitle: 'quarterbacksHits'.tr),
          InnerTitle(score: '+1', subtitle: 'phasesDefended'.tr),
          InnerTitle(score: '+3', subtitle: 'interceptions'.tr),
          InnerTitle(score: '+3', subtitle: 'fumblesForced'.tr),
          InnerTitle(score: '+3', subtitle: 'fumblesRecovered'.tr),
          InnerTitle(score: '+6', subtitle: 'defensiveTouchdowns'.tr),
          InnerTitle(score: '+2', subtitle: '2PointConversionsReturns'.tr),
        ]),
    HowItWorkModel(title: 'kICKING'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '', subtitle: 'weUseFractionalPoints'.tr),
      InnerTitle(score: '', subtitle: 'weUseNegativePoints'.tr),
      InnerTitle(score: '+1', subtitle: 'pATMade'.tr),
      InnerTitle(score: '+3', subtitle: 'fGMade049yardas'.tr),
      InnerTitle(score: '+5', subtitle: 'fGMade50yardas'.tr),
    ]),
  ];

  void functionCheckFocus() {
    isDropDownOpened.value = focusNode.hasFocus;
    return;
  }

  @override
  void onInit() {
    selectedSport.value = selectedSPort.value;
    focusNode.addListener(functionCheckFocus);
    dropdown.text = 'Item 1'.toString();
    combineTitles();
    super.onInit();
  }

  @override
  void dispose() {
    focusNode.removeListener(functionCheckFocus);
    super.dispose();
  }

  List<HowItWorkModel> cricketHowItWorkT20 = [
    HowItWorkModel(title: 'Batting'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+0.5', subtitle: 'Run'.tr),
      InnerTitle(score: '+0.5', subtitle: 'Boundary Bonus'.tr),
      InnerTitle(score: '+1', subtitle: 'Six Bonus'.tr),
      InnerTitle(score: '+2', subtitle: 'Half Century Bonus'.tr),
      InnerTitle(score: '+4', subtitle: 'Century Bonus'.tr),
      InnerTitle(score: '+32', subtitle: 'DoubleCentury'.tr),
      InnerTitle(score: '-3', subtitle: 'Dismissal for duck'.tr),
    ]),
    HowItWorkModel(title: 'Bowling'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+12', subtitle: 'Wicket'.tr),
      InnerTitle(score: '+2', subtitle: '4 Wicket Bonus'.tr),
      InnerTitle(score: '+4', subtitle: '5 Wicket Bonus'.tr),
      InnerTitle(score: '+2', subtitle: 'Maiden Over'.tr),
    ]),
    HowItWorkModel(title: 'Fielding'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+4', subtitle: 'catch'.tr),
      InnerTitle(score: '+6', subtitle: 'stumping'.tr),
      InnerTitle(score: '+4', subtitle: 'runout'.tr),
    ]),
    HowItWorkModel(title: 'Economy Rate'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+3', subtitle: 'Below 2.6 Runs Per Over'.tr),
      InnerTitle(score: '+2', subtitle: 'Between 2.6 and 3.5 Runs Per Over'.tr),
      InnerTitle(score: '+1', subtitle: 'Between 3.6 and 4.5 Runs Per Over'.tr),
      InnerTitle(score: '-1', subtitle: 'Between 7.1 and 8.0 Runs Per Over'.tr),
      InnerTitle(score: '-3', subtitle: 'Between 8 to 9 runs'.tr),
      InnerTitle(score: '-3', subtitle: 'Above 9 Runs'.tr),
    ]),
    HowItWorkModel(title: 'Strike Rate'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '-3', subtitle: 'Below 41 runs per 100 balls'.tr),
      InnerTitle(
          score: '-2',
          subtitle: ' Between 41.2 and 50.9 runs per 100 balls'.tr),
      InnerTitle(
          score: '-1', subtitle: 'Between 51.1 and 60.9 runs per 100 balls'.tr),
    ]),
  ];

  // List<HowItWorkModel> cricketHowItWorkOdi = [
  //   HowItWorkModel(title: 'Batting', imagePath: '', innerTitle: [
  //     InnerTitle(score: '', subtitle: 'We Use Negative Points'),
  //     InnerTitle(score: '+1', subtitle: 'Run'),
  //     InnerTitle(score: '+1', subtitle: 'Boundary Bonus'),
  //     InnerTitle(score: '+2', subtitle: 'Six Bonus'),
  //     InnerTitle(score: '+4', subtitle: '30 Run Bonus'),
  //     InnerTitle(score: '+8', subtitle: 'Half Centuary Bonus'),
  //     InnerTitle(score: '+16', subtitle: 'Centuary Bonus'),
  //     InnerTitle(score: '+32', subtitle: 'Double Centuary Bonus'),
  //     InnerTitle(score: '-4', subtitle: 'Dismissal for a duck'),
  //     InnerTitle(score: '+6', subtitle: 'Above 170 runs per 100 balls'),
  //     InnerTitle(
  //         score: '+4', subtitle: 'S.R Between 150-170 runs per 100 balls'),
  //     InnerTitle(
  //         score: '+2', subtitle: 'S.R Between 130-150 runs per 100 Balls'),
  //     InnerTitle(score: '-2', subtitle: 'S.R Between 90-80 runs per 100 balls'),
  //     InnerTitle(score: '-4', subtitle: 'S.R Between 79-70 runs per 100 balls'),
  //     InnerTitle(score: '-6', subtitle: 'S.R Below 70 runs per 100 balls'),
  //   ]),
  //   HowItWorkModel(title: 'Bowling', imagePath: '', innerTitle: [
  //     InnerTitle(score: '', subtitle: 'We Use Negative Points'),
  //     InnerTitle(score: '+25', subtitle: 'Wicket (Excluding Run Out)'),
  //     InnerTitle(score: '+8', subtitle: 'Bonus (LBW / Bowled)'),
  //     InnerTitle(score: '+12', subtitle: 'Maiden Over'),
  //     InnerTitle(score: '+4', subtitle: '3 Wicket Bonus'),
  //     InnerTitle(score: '+8', subtitle: '4 Wicket Bonus'),
  //     InnerTitle(score: '+16', subtitle: '5 Wicket Bonus'),
  //     InnerTitle(score: '+6', subtitle: 'Below 5 runs per over'),
  //     InnerTitle(score: '+4', subtitle: 'Between 5-5.99 runs per over'),
  //     InnerTitle(score: '+2', subtitle: 'Between 6-6.99 runs per over'),
  //     InnerTitle(score: '-2', subtitle: 'Between 8.0 - 8.99 runs per over'),
  //     InnerTitle(score: '-4', subtitle: 'Between 9.0 - 9.99 runs per over'),
  //     InnerTitle(score: '-6', subtitle: 'Above 10 runs per over'),
  //   ]),
  //   HowItWorkModel(title: 'Fielding', imagePath: '', innerTitle: [
  //     InnerTitle(score: '', subtitle: 'We Use Negative Points'),
  //     InnerTitle(score: '+8', subtitle: 'Catch'),
  //     InnerTitle(score: '+4', subtitle: '3 Catch Bonus'),
  //     InnerTitle(score: '+12', subtitle: 'Stumping'),
  //     InnerTitle(score: '+9', subtitle: 'Run out'),
  //   ]),
  // ];

  List<HowItWorkModel> baseballHowItWorkOdi = [
    HowItWorkModel(title: 'hitting'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+1', subtitle: 'singles'.tr),
      InnerTitle(score: '+2', subtitle: 'doubles'.tr),
      InnerTitle(score: '+3', subtitle: 'triples'.tr),
      InnerTitle(score: '+4', subtitle: 'homeRuns'.tr),
      InnerTitle(score: '+1', subtitle: 'runs'.tr),
      InnerTitle(score: '+1', subtitle: 'runsBattedIn'.tr),
      InnerTitle(score: '+1', subtitle: 'walks'.tr),
      InnerTitle(score: '+1', subtitle: 'hitByPitch'.tr),
      InnerTitle(score: '+2', subtitle: 'stolenBases'.tr),
      InnerTitle(score: '-1', subtitle: 'caughtStealing'.tr),
    ]),
    HowItWorkModel(title: 'pitching'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+4', subtitle: 'wins'.tr),
      InnerTitle(score: '+2', subtitle: 'saves'.tr),
      InnerTitle(score: '+1', subtitle: 'inningsPitched'.tr),
      InnerTitle(score: '-1', subtitle: 'earnedRunsAllowed'.tr),
    ]),
  ].obs;
  List<HowItWorkModel> hockeyHowItWorkOdi = [
    HowItWorkModel(title: 'skaters'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+3', subtitle: 'goals'.tr),
      InnerTitle(score: '+2', subtitle: 'Assists'.tr),
      InnerTitle(score: '0.5', subtitle: 'shotsonGoal'.tr),
      InnerTitle(score: '+1', subtitle: 'plus/Minus'.tr),
      InnerTitle(score: '0.5', subtitle: 'blocks'.tr),
      InnerTitle(score: '0.5', subtitle: 'powerPlayGoals/Assists'.tr),
      InnerTitle(score: '0.5', subtitle: 'shortHandedGoals/Assists'.tr),
      InnerTitle(score: '0.2', subtitle: 'shootoutGoals'.tr),
    ]),
    HowItWorkModel(title: 'goalTenders'.tr, imagePath: '', innerTitle: [
      InnerTitle(score: '+3', subtitle: 'wins'.tr),
      InnerTitle(score: '-1', subtitle: 'goalsAgainst'.tr),
      InnerTitle(score: '0.2', subtitle: 'saves'.tr),
      InnerTitle(score: '+2', subtitle: 'shutouts'.tr),
    ]),
  ].obs;
}
