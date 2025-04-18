import 'package:get/get.dart';

class PositionModel {
  String? positionName;
  String? positionImage;
  RxInt? players;

  PositionModel({this.positionName, this.positionImage, this.players});
}

class SelectTeam {
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;

  SelectTeam({this.homeTeam, this.awayTeam});

  SelectTeam.fromJson(Map<String, dynamic> json) {
    homeTeam =
        json['homeTeam'] != null ? HomeTeam.fromJson(json['homeTeam']) : null;
    awayTeam =
        json['awayTeam'] != null ? HomeTeam.fromJson(json['awayTeam']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (homeTeam != null) {
      data['homeTeam'] = homeTeam!.toJson();
    }
    if (awayTeam != null) {
      data['awayTeam'] = awayTeam!.toJson();
    }
    return data;
  }
}

class HomeTeam {
  String? assetCode;
  String? name;
  String? shortName;
  String? imageUrl;
  List<Players>? players;

  HomeTeam(
      {this.name, this.shortName, this.imageUrl, this.players, this.assetCode});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortName = json['shortName'];
    imageUrl = json['imageUrl'];
    assetCode = json['assetCode'];
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['shortName'] = shortName;
    data['imageUrl'] = imageUrl;
    data['assetCode'] = assetCode;
    if (players != null) {
      data['players'] = players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Players {
  String? assetCode;
  String? fullName;
  String? imageUrl;
  String? jerseyImageUrl;
  String? jerseyNumber;
  String? jerseyName;
  double? matchPoints;
  double? indexPoints;
  double? assetIndexPrice;
  bool? involved;
  int? rank;
  int? formationPosition;
  String? statistics;
  String? pointBreakDown;
  String? position;
  String? settings;
  bool? isTradable;
  String? teamName;
  String? teamKey;
  RxBool isBull = false.obs;
  RxBool isSelected = false.obs;

  Players({
    this.assetCode,
    this.fullName,
    this.imageUrl,
    this.jerseyImageUrl,
    this.jerseyNumber,
    this.jerseyName,
    this.matchPoints,
    this.indexPoints,
    this.assetIndexPrice,
    this.involved,
    this.rank,
    this.formationPosition,
    this.statistics,
    this.pointBreakDown,
    this.position,
    this.settings,
    this.isTradable,
    this.teamName,
    bool? isBull,
    bool? isSelected,
  })  : isBull = (isBull ?? false).obs,
        isSelected = (isSelected ?? false).obs;

  Players.fromJson(Map<String, dynamic> json) {
    assetCode = json['assetCode'];
    fullName = json['fullName'];
    imageUrl = json['imageUrl'];
    jerseyImageUrl = json['jerseyImageUrl'];
    jerseyNumber = json['jerseyNumber'];
    jerseyName = json['jerseyName'];
    matchPoints = json['matchPoints'];
    indexPoints = json['indexPoints'];
    assetIndexPrice = json['assetIndexPrice'];
    involved = json['involved'];
    rank = json['rank'];
    formationPosition = json['formationPosition'];
    statistics = json['statistics'];
    pointBreakDown = json['pointBreakDown'];
    position = json['position'];
    settings = json['settings'];
    isTradable = json['isTradable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetCode'] = assetCode;
    data['fullName'] = fullName;
    data['imageUrl'] = imageUrl;
    data['jerseyImageUrl'] = jerseyImageUrl;
    data['jerseyNumber'] = jerseyNumber;
    data['jerseyName'] = jerseyName;
    data['matchPoints'] = matchPoints;
    data['indexPoints'] = indexPoints;
    data['assetIndexPrice'] = assetIndexPrice;
    data['involved'] = involved;
    data['rank'] = rank;
    data['formationPosition'] = formationPosition;
    data['statistics'] = statistics;
    data['pointBreakDown'] = pointBreakDown;
    data['position'] = position;
    data['settings'] = settings;
    data['isTradable'] = isTradable;
    return data;
  }
}
