import 'package:fmlfantasy/model/match_center_inner_model.dart';

class PlayersInfoModel {
  num? assetIndexPoint;
  String? assetCode;
  String? aquaTicker;
  String? assetName;
  String? position;
  String? teamAssetCode;
  String? club;
  String? peerGroup;
  String? picture;
  String? jerseyNumber;
  String? dOB;
  int? age;
  double? heightInCm;
  String? birthPlace;
  String? nationality;
  String? nationalAssetCode;
  String? nationalTeam;
  String? nationalTeamFlag;
  dynamic indexPrice;
  String? assetSearchText;
  Map<String, dynamic>? marketMakerPrice;
  Map<String, dynamic>? priceChange;

  PlayersInfoModel(
      {this.assetCode,
      this.aquaTicker,
      this.assetName,
      this.position,
      this.teamAssetCode,
      this.club,
      this.peerGroup,
      this.picture,
      this.jerseyNumber,
      this.dOB,
      this.age,
      this.heightInCm,
      this.birthPlace,
      this.nationality,
      this.nationalAssetCode,
      this.nationalTeam,
      this.nationalTeamFlag,
      this.indexPrice,
      this.assetSearchText,
      this.assetIndexPoint,
      this.marketMakerPrice = const {},
      this.priceChange = const {}});

  PlayersInfoModel.fromJson(Map<String, dynamic> json) {
    assetCode = json['AssetCode'] ?? '';
    aquaTicker = json['AquaTicker'] ?? '';
    assetName = json['AssetName'] ?? '';
    position = json['Position'] ?? '';
    teamAssetCode = json['TeamAssetCode'] ?? '';
    club = json['Club'] ?? '';
    peerGroup = json['PeerGroup'] ?? '';
    picture = json['Picture'] ?? '';
    jerseyNumber = json['JerseyNumber'] ?? '';
    dOB = json['DOB'] ?? '';
    age = json['Age'] ?? '';
    heightInCm = json['HeightInCm'] ?? 0.0;
    birthPlace = json['BirthPlace'] ?? '';
    nationality = json['Nationality'] ?? '';
    nationalAssetCode = json['NationalAssetCode'] ?? '';
    nationalTeam = json['NationalTeam'] ?? '';
    nationalTeamFlag = json['NationalTeamFlag'] ?? '';
    indexPrice = json['IndexPrice'] ?? 0.0;
    assetSearchText = json['AssetSearchText'] ?? '';
    marketMakerPrice = json['MarketMakerPrice'] ?? const {};
    priceChange = json['PriceChange'] ?? const {};
    assetIndexPoint = json['AssetIndexPrice'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AssetCode'] = assetCode;
    data['AquaTicker'] = aquaTicker;
    data['AssetName'] = assetName;
    data['Position'] = position;
    data['TeamAssetCode'] = teamAssetCode;
    data['Club'] = club;
    data['PeerGroup'] = peerGroup;
    data['Picture'] = picture;
    data['JerseyNumber'] = jerseyNumber;
    data['DOB'] = dOB;
    data['Age'] = age;
    data['HeightInCm'] = heightInCm;
    data['BirthPlace'] = birthPlace;
    data['Nationality'] = nationality;
    data['NationalAssetCode'] = nationalAssetCode;
    data['NationalTeam'] = nationalTeam;
    data['NationalTeamFlag'] = nationalTeamFlag;
    data['IndexPrice'] = indexPrice;
    data['AssetSearchText'] = assetSearchText;
    data['MarketMakerPrice'] = marketMakerPrice;
    data['PriceChange'] = priceChange;
    data['AssetIndexPrice'] = assetIndexPoint;
    return data;
  }
}

class PlayersRecentStats {
  String? matchId;
  String? validAt;
  String? sportCode;
  String? competitionCode;
  String? competitionName;
  String? season;
  String? expStartDate;
  String? status;
  bool? isLive;
  bool? close;
  String? teamACode;
  String? teamAName;
  String? teamAShortName;
  String? teamAImageUrl;
  String? teamBCode;
  String? teamBName;
  String? teamBShortName;
  String? teamBImageUrl;
  String? dayOfWeek;
  String? expectedStartDate;
  int? expectedStartDateTime;
  bool? isNationalMatch;
  int? teamAScore;
  int? teamBScore;
  String? matchVenue;
  String? matchCity;
  String? matchCountry;
  String? matchResultDescription;
  List<PlayersBreakDown>? playersBreakDown;

  PlayersRecentStats(
      {this.matchId,
      this.validAt,
      this.sportCode,
      this.competitionCode,
      this.competitionName,
      this.season,
      this.expStartDate,
      this.status,
      this.isLive,
      this.close,
      this.teamACode,
      this.teamAName,
      this.teamAShortName,
      this.teamAImageUrl,
      this.teamBCode,
      this.teamBName,
      this.teamBShortName,
      this.teamBImageUrl,
      this.dayOfWeek,
      this.expectedStartDate,
      this.expectedStartDateTime,
      this.isNationalMatch,
      this.teamAScore,
      this.teamBScore,
      this.matchVenue,
      this.matchCity,
      this.matchCountry,
      this.matchResultDescription,
      this.playersBreakDown});

  PlayersRecentStats.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
    validAt = json['validAt'];
    sportCode = json['sportCode'];
    competitionCode = json['competitionCode'];
    competitionName = json['competitionName'];
    season = json['season'];
    expStartDate = json['expStartDate'];
    status = json['status'];
    isLive = json['isLive'];
    close = json['close'];
    teamACode = json['teamACode'];
    teamAName = json['teamAName'];
    teamAShortName = json['teamAShortName'];
    teamAImageUrl = json['teamAImageUrl'];
    teamBCode = json['teamBCode'];
    teamBName = json['teamBName'];
    teamBShortName = json['teamBShortName'];
    teamBImageUrl = json['teamBImageUrl'];
    dayOfWeek = json['dayOfWeek'];
    expectedStartDate = json['expectedStartDate'];
    expectedStartDateTime = json['expectedStartDateTime'];
    isNationalMatch = json['isNationalMatch'];
    teamAScore = json['teamAScore'];
    teamBScore = json['teamBScore'];
    matchVenue = json['matchVenue'];
    matchCity = json['matchCity'];
    matchCountry = json['matchCountry'];
    matchResultDescription = json['matchResultDescription'];
    if (json['playersBreakDown'] != null) {
      playersBreakDown = <PlayersBreakDown>[];
      json['playersBreakDown'].forEach((v) {
        playersBreakDown!.add(PlayersBreakDown.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchId'] = matchId;
    data['validAt'] = validAt;
    data['sportCode'] = sportCode;
    data['competitionCode'] = competitionCode;
    data['competitionName'] = competitionName;
    data['season'] = season;
    data['expStartDate'] = expStartDate;
    data['status'] = status;
    data['isLive'] = isLive;
    data['close'] = close;
    data['teamACode'] = teamACode;
    data['teamAName'] = teamAName;
    data['teamAShortName'] = teamAShortName;
    data['teamAImageUrl'] = teamAImageUrl;
    data['teamBCode'] = teamBCode;
    data['teamBName'] = teamBName;
    data['teamBShortName'] = teamBShortName;
    data['teamBImageUrl'] = teamBImageUrl;
    data['dayOfWeek'] = dayOfWeek;
    data['expectedStartDate'] = expectedStartDate;
    data['expectedStartDateTime'] = expectedStartDateTime;
    data['isNationalMatch'] = isNationalMatch;
    data['teamAScore'] = teamAScore;
    data['teamBScore'] = teamBScore;
    data['matchVenue'] = matchVenue;
    data['matchCity'] = matchCity;
    data['matchCountry'] = matchCountry;
    data['matchResultDescription'] = matchResultDescription;
    if (playersBreakDown != null) {
      data['playersBreakDown'] =
          playersBreakDown!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlayersBreakDown {
  String? assetCode;
  String? name;
  String? position;
  String? imageUrl;
  String? jerseyNumber;
  String? jerseyImageUrl;
  String? jerseyName;
  String? teamAssetCode;
  String? teamName;
  String? teamAbbreviation;
  bool? teamIsAway;
  int? rank;
  double? fantasyPoints;
  double? fantasyPointsRaw;
  List<StatsBreakDown>? statsBreakDown;
  List<FantasyPointsBreakDown>? fantasyPointsBreakDown;

  PlayersBreakDown(
      {this.assetCode,
      this.name,
      this.position,
      this.imageUrl,
      this.jerseyNumber,
      this.jerseyImageUrl,
      this.jerseyName,
      this.teamAssetCode,
      this.teamName,
      this.teamAbbreviation,
      this.teamIsAway,
      this.rank,
      this.fantasyPoints,
      this.fantasyPointsRaw,
      this.statsBreakDown,
      this.fantasyPointsBreakDown});

  PlayersBreakDown.fromJson(Map<String, dynamic> json) {
    assetCode = json['assetCode'];
    name = json['name'];
    position = json['position'];
    imageUrl = json['imageUrl'];
    jerseyNumber = json['jerseyNumber'];
    jerseyImageUrl = json['jerseyImageUrl'];
    jerseyName = json['jerseyName'];
    teamAssetCode = json['teamAssetCode'];
    teamName = json['teamName'];
    teamAbbreviation = json['teamAbbreviation'];
    teamIsAway = json['teamIsAway'];
    rank = json['rank'];
    fantasyPoints = json['fantasyPoints'];
    fantasyPointsRaw = json['fantasyPointsRaw'];
    if (json['statsBreakDown'] != null) {
      statsBreakDown = <StatsBreakDown>[];
      json['statsBreakDown'].forEach((v) {
        statsBreakDown!.add(StatsBreakDown.fromJson(v));
      });
    }
    if (json['fantasyPointsBreakDown'] != null) {
      fantasyPointsBreakDown = <FantasyPointsBreakDown>[];
      json['fantasyPointsBreakDown'].forEach((v) {
        fantasyPointsBreakDown!.add(FantasyPointsBreakDown.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetCode'] = assetCode;
    data['name'] = name;
    data['position'] = position;
    data['imageUrl'] = imageUrl;
    data['jerseyNumber'] = jerseyNumber;
    data['jerseyImageUrl'] = jerseyImageUrl;
    data['jerseyName'] = jerseyName;
    data['teamAssetCode'] = teamAssetCode;
    data['teamName'] = teamName;
    data['teamAbbreviation'] = teamAbbreviation;
    data['teamIsAway'] = teamIsAway;
    data['rank'] = rank;
    data['fantasyPoints'] = fantasyPoints;
    data['fantasyPointsRaw'] = fantasyPointsRaw;
    if (statsBreakDown != null) {
      data['statsBreakDown'] = statsBreakDown!.map((v) => v.toJson()).toList();
    }
    if (fantasyPointsBreakDown != null) {
      data['fantasyPointsBreakDown'] =
          fantasyPointsBreakDown!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatsBreakDown {
  String? name;
  double? value;
  int? displayOrder;

  StatsBreakDown({this.name, this.value, this.displayOrder});

  StatsBreakDown.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    displayOrder = json['displayOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    data['displayOrder'] = displayOrder;
    return data;
  }
}
