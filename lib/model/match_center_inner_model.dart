class PlayersBreakDown {
  PlayersBreakDown({
    required this.assetCode,
    required this.name,
    required this.position,
    required this.imageUrl,
    this.jerseyNumber,
    required this.teamAssetCode,
    required this.teamName,
    required this.teamAbbreviation,
    required this.teamIsAway,
    required this.rank,
    required this.fantasyPoints,
    required this.fantasyPointsRaw,
    required this.statsBreakDown,
    required this.fantasyPointsBreakDown,
    required this.jerseyImage,
    required this.jerseyName,
    required this.fantasyNumnber,
    this.isStarter,
  });
  late final String? assetCode;
  late final String? name;
  late final String? position;
  late final String? imageUrl;
  late final Null jerseyNumber;
  late final String? teamAssetCode;
  late final String? teamName;
  late final String? teamAbbreviation;
  late final bool teamIsAway;
  late final dynamic rank;
  late final double? fantasyPoints;
  late final double? fantasyPointsRaw;
  late final List<StatsBreakDown> statsBreakDown;
  late final List<FantasyPointsBreakDown> fantasyPointsBreakDown;
  late final String? jerseyImage;
  late final String? jerseyName;
  late final String? fantasyNumnber;
  late final bool? isStarter;
  //late final List<Players>

  PlayersBreakDown.fromJson(Map<String, dynamic> json) {
    assetCode = json['assetCode'] ?? 'null';
    name = json['name'] ?? 'null';
    position = json['position'];
    imageUrl = json['imageUrl'];
    jerseyNumber = null;
    teamAssetCode = json['teamAssetCode'];
    teamName = json['teamName'];
    teamAbbreviation = json['teamAbbreviation'];
    teamIsAway = json['teamIsAway'];
    jerseyImage = json['jerseyImageUrl'];
    jerseyName = json['jerseyName'];
    fantasyNumnber = json['jerseyNumber'];
    rank = json['rank'];
    fantasyPoints = json['fantasyPoints'];
    fantasyPointsRaw = json['fantasyPointsRaw'];
    isStarter = json['isStarter'];
    statsBreakDown = List.from(json['statsBreakDown'])
        .map((e) => StatsBreakDown.fromJson(e))
        .toList();
    fantasyPointsBreakDown = List.from(json['fantasyPointsBreakDown'])
        .map((e) => FantasyPointsBreakDown.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['assetCode'] = assetCode;
    data['name'] = name;
    data['position'] = position;
    data['imageUrl'] = imageUrl;
    data['jerseyNumber'] = jerseyNumber;
    data['teamAssetCode'] = teamAssetCode;
    data['teamName'] = teamName;
    data['teamAbbreviation'] = teamAbbreviation;
    data['teamIsAway'] = teamIsAway;
    data['rank'] = rank;
    data['jerseyImageUrl'] = jerseyImage;
    data['jerseyName'] = jerseyName;
    data['jerseyNumber'] = fantasyNumnber;
    data['fantasyPoints'] = fantasyPoints;
    data['fantasyPointsRaw'] = fantasyPointsRaw;
    data['isStarter'] = isStarter;
    data['statsBreakDown'] = statsBreakDown.map((e) => e.toJson()).toList();
    data['fantasyPointsBreakDown'] =
        fantasyPointsBreakDown.map((e) => e.toJson()).toList();
    return data;
  }
}

class StatsBreakDown {
  StatsBreakDown({
    required this.name,
    required this.value,
    required this.displayOrder,
  });
  late final String? name;
  late final double? value;
  late final dynamic displayOrder;

  StatsBreakDown.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    displayOrder = json['displayOrder'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    data['displayOrder'] = displayOrder;
    return data;
  }
}

class FantasyPointsBreakDown {
  FantasyPointsBreakDown({
    required this.name,
    required this.value,
    required this.displayOrder,
  });
  late final String? name;
  late final double? value;
  late final dynamic displayOrder;

  FantasyPointsBreakDown.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    displayOrder = json['displayOrder'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    data['displayOrder'] = displayOrder;
    return data;
  }
}

class Highlights {
  Highlights({
    required this.sport,
    required this.data,
  });
  late final String? sport;
  late final Data data;

  Highlights.fromJson(Map<String, dynamic> json) {
    sport = json['sport'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['sport'] = sport;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.teamA,
    required this.teamB,
  });
  late final TeamA teamA;
  late final TeamB teamB;

  Data.fromJson(Map<String, dynamic> json) {
    teamA = TeamA.fromJson(json['teamA']);
    teamB = TeamB.fromJson(json['teamB']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['teamA'] = teamA.toJson();
    data['teamB'] = teamB.toJson();
    return data;
  }
}

class TeamA {
  TeamA({
    required this.teamName,
    required this.tab1,
    required this.tab2,
  });
  late final String? teamName;
  late final Tab1 tab1;
  late final Tab2 tab2;

  TeamA.fromJson(Map<String, dynamic> json) {
    teamName = json['teamName'];
    tab1 = Tab1.fromJson(json['tab1']);
    tab2 = Tab2.fromJson(json['tab2']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['teamName'] = teamName;
    data['tab1'] = tab1.toJson();
    data['tab2'] = tab2.toJson();
    return data;
  }
}

class Tab1 {
  Tab1({
    required this.tabData,
  });
  late final List<TabData> tabData;

  Tab1.fromJson(Map<String, dynamic> json) {
    tabData =
        List.from(json['tabData']).map((e) => TabData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tabData'] = tabData.map((e) => e.toJson()).toList();
    return data;
  }
}

class TabData {
  TabData({
    this.$type,
    this.runs,
    this.ballsFaced,
    this.playerName,
  });
  late final String? $type;
  late final dynamic runs;
  late final dynamic ballsFaced;
  late final String? playerName;
  late final dynamic wickets;
  late final dynamic runsConceded;
  late final dynamic overs;

  TabData.fromJson(Map<String, dynamic> json) {
    $type = json['type'];
    runs = json['runs'];
    ballsFaced = json['ballsFaced'];
    playerName = json['playerName'];
    wickets = json['wickets'];
    runsConceded = json['runsConceded'];
    overs = json['overs'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = $type;
    data['runs'] = runs;
    data['ballsFaced'] = ballsFaced;
    data['playerName'] = playerName;
    return data;
  }
}

class Tab2 {
  Tab2({
    required this.tabData,
  });
  late final List<TabData> tabData;

  Tab2.fromJson(Map<String, dynamic> json) {
    tabData =
        List.from(json['tabData']).map((e) => TabData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tabData'] = tabData.map((e) => e.toJson()).toList();
    return data;
  }
}

class TeamB {
  TeamB({
    required this.teamName,
    required this.tab1,
    required this.tab2,
  });
  late final String? teamName;
  late final Tab1 tab1;
  late final Tab2 tab2;

  TeamB.fromJson(Map<String, dynamic> json) {
    teamName = json['teamName'];
    tab1 = Tab1.fromJson(json['tab1']);
    tab2 = Tab2.fromJson(json['tab2']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['teamName'] = teamName;
    data['tab1'] = tab1.toJson();
    data['tab2'] = tab2.toJson();
    return data;
  }
}

class TopPlayers {
  TopPlayers({
    required this.assetCode,
    required this.name,
    required this.picture,
    required this.rank,
    this.jerseyNumber,
    this.jerseyImage,
    required this.fantasyPoint,
  });
  late final String? assetCode;
  late final String? name;
  late final String? picture;
  late final int? rank;
  late final Null jerseyNumber;
  late final Null jerseyImage;
  late final double? fantasyPoint;

  TopPlayers.fromJson(Map<String, dynamic> json) {
    assetCode = json['assetCode'];
    name = json['name'];
    picture = json['picture'];
    rank = json['rank'];
    jerseyNumber = null;
    jerseyImage = null;
    fantasyPoint = json['fantasyPoint'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['assetCode'] = assetCode;
    data['name'] = name;
    data['picture'] = picture;
    data['rank'] = rank;
    data['jerseyNumber'] = jerseyNumber;
    data['jerseyImage'] = jerseyImage;
    data['fantasyPoint'] = fantasyPoint;
    return data;
  }
}

class PeriodScore {
  PeriodScore({
    required this.periodType,
    required this.periodOrder,
    required this.periodStatus,
    required this.homeScore,
    required this.awayScore,
    required this.isExtraTime,
    required this.extraTimeMinutes,
    required this.extraTimeSeconds,
  });

  late final String? periodType;
  late final int? periodOrder;
  late final String? periodStatus;
  late final int? homeScore;
  late final int? awayScore;
  late final bool isExtraTime;
  late final int? extraTimeMinutes;
  late final int? extraTimeSeconds;

  PeriodScore.fromJson(Map<String, dynamic> json) {
    periodType = json['periodType'];
    periodOrder = json['periodOrder'];
    periodStatus = json['periodStatus'];
    homeScore = json['homeScore'];
    awayScore = json['awayScore'];
    isExtraTime = json['isExtraTime'];
    extraTimeMinutes = json['extraTimeMinutes'];
    extraTimeSeconds = json['extraTimeSeconds'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['periodType'] = periodType;
    data['periodOrder'] = periodOrder;
    data['periodStatus'] = periodStatus;
    data['homeScore'] = homeScore;
    data['awayScore'] = awayScore;
    data['isExtraTime'] = isExtraTime;
    data['extraTimeMinutes'] = extraTimeMinutes;
    data['extraTimeSeconds'] = extraTimeSeconds;
    return data;
  }
}
