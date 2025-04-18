import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/sports_type.dart';

class PlayersController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  RxInt selectedIndex = 0.obs;
  double scrollOffset = 0.0;
  List<Player> _players = <Player>[];
  bool _isSearch = false;

  TextEditingController searchController = TextEditingController();

  bool get isSearch => _isSearch;

  set isSearch(bool value) {
    _isSearch = value;
    update();
  }

  List<Player> get players => _players;

  set players(List<Player> value) {
    _players = value;
    update();
  }

  List<Player> playersList = [
    Player(
        assetCode: 'CRVKHLI8',
        name: 'Lionel Messi',
        rank: '1',
        country: 'Argentina',
        club: 'Barcelona',
        position: 'Fast Farward'),
    Player(
        assetCode: 'CRVKHLI8',
        name: 'Babar Azam',
        rank: '2',
        country: 'Pakistan',
        club: 'Karachi Kings',
        position: 'Fast Farward'),
    Player(
        assetCode: 'CRVKHLI8',
        name: 'Virat Kohli',
        rank: '3',
        country: 'India',
        club: 'Royal Challengers Bangalore',
        position: 'Fast Farward'),
    Player(
        assetCode: 'CRVKHLI8',
        name: 'Dhoni',
        rank: '4',
        country: 'India',
        club: 'Chennai Super Kings',
        position: 'Fast Farward'),
    Player(
        assetCode: 'CRVKHLI8',
        name: 'Rohit Sharma',
        rank: '5',
        country: 'India',
        club: 'Mumbai Indians',
        position: 'Fast Farward'),
  ];
}

class Player {
  String? assetCode;
  String? name;
  String? rank;
  String? country;
  String? club;
  String? position;
  Player(
      {this.assetCode,
      this.name,
      this.rank,
      this.country,
      this.club,
      this.position});
}
