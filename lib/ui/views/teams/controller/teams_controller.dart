import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/sports_type.dart';

class TeamsController extends GetxController {
  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  bool _isSearch = false;

  TextEditingController searchController = TextEditingController();

  bool get isSearch => _isSearch;

  set isSearch(bool value) {
    _isSearch = value;
    update();
  }

  RxInt selectedIndex = 0.obs;
  double scrollOffset = 0.0;
  List<AllTeams> teams = [
    AllTeams(
      teamRank: '1',
      teamName: 'Team A',
      matchesPlayed: '10',
      matchesWon: '8',
      matchLost: '1',
      matchDraw: '1',
    ),
    AllTeams(
      teamRank: '2',
      teamName: 'Team B',
      matchesPlayed: '10',
      matchesWon: '7',
      matchLost: '2',
      matchDraw: '1',
    ),
    AllTeams(
      teamRank: '3',
      teamName: 'Team C',
      matchesPlayed: '10',
      matchesWon: '6',
      matchLost: '3',
      matchDraw: '1',
    ),
    AllTeams(
      teamRank: '4',
      teamName: 'Team D',
      matchesPlayed: '10',
      matchesWon: '5',
      matchLost: '4',
      matchDraw: '1',
    ),
    AllTeams(
      teamRank: '5',
      teamName: 'Team E',
      matchesPlayed: '10',
      matchesWon: '4',
      matchLost: '5',
      matchDraw: '1',
    ),
    AllTeams(
      teamRank: '6',
      teamName: 'Team F',
      matchesPlayed: '10',
      matchesWon: '3',
      matchLost: '6',
      matchDraw: '1',
    ),
    AllTeams(
      teamRank: '7',
      teamName: 'Team G',
      matchesPlayed: '10',
      matchesWon: '2',
      matchLost: '7',
      matchDraw: '1',
    ),
    AllTeams(
      teamRank: '8',
      teamName: 'Team H',
      matchesPlayed: '10',
      matchesWon: '1',
      matchLost: '8',
      matchDraw: '1',
    ),
    AllTeams(
      teamRank: '9',
      teamName: 'Team I',
      matchesPlayed: '10',
      matchesWon: '0',
      matchLost: '9',
      matchDraw: '1',
    ),
    AllTeams(
      teamRank: '10',
      teamName: 'Team J',
      matchesPlayed: '10',
      matchesWon: '0',
      matchLost: '10',
      matchDraw: '0',
    ),
  ];
}

class AllTeams {
  String? teamRank;
  String? teamName;
  String? matchesPlayed;
  String? matchesWon;
  String? matchLost;
  String? matchDraw;

  AllTeams({
    this.teamRank,
    this.teamName,
    this.matchesPlayed,
    this.matchesWon,
    this.matchLost,
    this.matchDraw,
  });
}
