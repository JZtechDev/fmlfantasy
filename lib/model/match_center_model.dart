class MatchCenterModel {
  int? id;
  String? matchKey;
  String? externalMatchKey;
  int? seqId;
  String? validAt;
  String? competitionId;
  String? competitionAssetCode;
  String? competitionName;
  String? seasonYear;
  String? start;
  String? status;
  bool? close;
  List<Teams>? teams;
  String? lineUp;
  int? homeScore;
  int? awayScore;
  List<PeriodScores>? periodScores;
  int? periodOrder;
  String? periodType;
  int? periodLengthMinutes;
  int? periodLengthSeconds;
  int? periodMinutesRemaining;
  int? periodSecondsRemaining;
  int? periodMinutesPlayed;
  int? periodSecondsPlayed;
  String? matchVenue;
  String? matchCity;
  String? matchCountry;
  String? winnerId;
  String? winnerAssetCode;
  String? winnerName;
  String? playerOfTheMatchId;
  String? playerOfTheMatchAssetCode;
  String? playerOfTheMatchName;
  String? matchResultDescription;

  MatchCenterModel(
      {this.id,
      this.matchKey,
      this.externalMatchKey,
      this.seqId,
      this.validAt,
      this.competitionId,
      this.competitionAssetCode,
      this.competitionName,
      this.seasonYear,
      this.start,
      this.status,
      this.close,
      this.teams,
      this.lineUp,
      this.homeScore,
      this.awayScore,
      this.periodScores,
      this.periodOrder,
      this.periodType,
      this.periodLengthMinutes,
      this.periodLengthSeconds,
      this.periodMinutesRemaining,
      this.periodSecondsRemaining,
      this.periodMinutesPlayed,
      this.periodSecondsPlayed,
      this.matchVenue,
      this.matchCity,
      this.matchCountry,
      this.winnerId,
      this.winnerAssetCode,
      this.winnerName,
      this.playerOfTheMatchId,
      this.playerOfTheMatchAssetCode,
      this.playerOfTheMatchName,
      this.matchResultDescription});

  MatchCenterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matchKey = json['matchKey'];
    externalMatchKey = json['externalMatchKey'];
    seqId = json['seqId'];
    validAt = json['validAt'];
    competitionId = json['competitionId'];
    competitionAssetCode = json['competitionAssetCode'];
    competitionName = json['competitionName'];
    seasonYear = json['seasonYear'];
    start = json['start'];
    status = json['status'];
    close = json['close'];
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(Teams.fromJson(v));
      });
    }
    lineUp = json['lineUp'];
    homeScore = json['homeScore'];
    awayScore = json['awayScore'];

    if (json['periodScores'] != null) {
      periodScores = <PeriodScores>[];
      json['periodScores'].forEach((v) {
        periodScores!.add(PeriodScores.fromJson(v));
      });
    }
    periodOrder = json['periodOrder'];
    periodType = json['periodType'];
    periodLengthMinutes = json['periodLengthMinutes'];
    periodLengthSeconds = json['periodLengthSeconds'];
    periodMinutesRemaining = json['periodMinutesRemaining'];
    periodSecondsRemaining = json['periodSecondsRemaining'];
    periodMinutesPlayed = json['periodMinutesPlayed'];
    periodSecondsPlayed = json['periodSecondsPlayed'];
    matchVenue = json['matchVenue'];
    matchCity = json['matchCity'];
    matchCountry = json['matchCountry'];
    winnerId = json['winnerId'];
    winnerAssetCode = json['winnerAssetCode'];
    winnerName = json['winnerName'];
    playerOfTheMatchId = json['playerOfTheMatchId'];
    playerOfTheMatchAssetCode = json['playerOfTheMatchAssetCode'];
    playerOfTheMatchName = json['playerOfTheMatchName'];
    matchResultDescription = json['matchResultDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['matchKey'] = matchKey;
    data['externalMatchKey'] = externalMatchKey;
    data['seqId'] = seqId;
    data['validAt'] = validAt;
    data['competitionId'] = competitionId;
    data['competitionAssetCode'] = competitionAssetCode;
    data['competitionName'] = competitionName;
    data['seasonYear'] = seasonYear;
    data['start'] = start;
    data['status'] = status;
    data['close'] = close;
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    data['lineUp'] = lineUp;
    data['homeScore'] = homeScore;
    data['awayScore'] = awayScore;

    if (periodScores != null) {
      data['periodScores'] = periodScores!.map((v) => v.toJson()).toList();
    }
    data['periodOrder'] = periodOrder;
    data['periodType'] = periodType;
    data['periodLengthMinutes'] = periodLengthMinutes;
    data['periodLengthSeconds'] = periodLengthSeconds;
    data['periodMinutesRemaining'] = periodMinutesRemaining;
    data['periodSecondsRemaining'] = periodSecondsRemaining;
    data['periodMinutesPlayed'] = periodMinutesPlayed;
    data['periodSecondsPlayed'] = periodSecondsPlayed;
    data['matchVenue'] = matchVenue;
    data['matchCity'] = matchCity;
    data['matchCountry'] = matchCountry;
    data['winnerId'] = winnerId;
    data['winnerAssetCode'] = winnerAssetCode;
    data['winnerName'] = winnerName;
    data['playerOfTheMatchId'] = playerOfTheMatchId;
    data['playerOfTheMatchAssetCode'] = playerOfTheMatchAssetCode;
    data['playerOfTheMatchName'] = playerOfTheMatchName;
    data['matchResultDescription'] = matchResultDescription;
    return data;
  }
}

class Teams {
  String? id;
  String? assetCode;
  String? name;
  String? imageUrl;
  String? abbreviation;
  String? countryCode;
  bool? isAway;
  int? matchWeight;
  int? quartile;
  List<MatchCenterPlayers>? players;

  Teams(
      {this.id,
      this.assetCode,
      this.name,
      this.imageUrl,
      this.abbreviation,
      this.countryCode,
      this.isAway,
      this.matchWeight,
      this.quartile,
      this.players});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assetCode = json['assetCode'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    abbreviation = json['abbreviation'];
    countryCode = json['countryCode'];
    isAway = json['isAway'];
    matchWeight = json['matchWeight'];
    quartile = json['quartile'];
    if (json['players'] != null) {
      players = <MatchCenterPlayers>[];
      json['players'].forEach((v) {
        players!.add(MatchCenterPlayers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['assetCode'] = assetCode;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['abbreviation'] = abbreviation;
    data['countryCode'] = countryCode;
    data['isAway'] = isAway;
    data['matchWeight'] = matchWeight;
    data['quartile'] = quartile;
    if (players != null) {
      data['players'] = players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MatchCenterPlayers {
  String? id;
  bool? involved;
  String? assetCode;
  String? name;
  String? position;
  num? matchPoints;
  Null breakdown;

  MatchCenterPlayers(
      {this.id,
      this.involved,
      this.assetCode,
      this.name,
      this.position,
      this.matchPoints,
      this.breakdown});

  MatchCenterPlayers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    involved = json['involved'];
    assetCode = json['assetCode'];
    name = json['name'];
    position = json['position'];
    matchPoints = json['matchPoints'];
    breakdown = json['breakdown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['involved'] = involved;
    data['assetCode'] = assetCode;
    data['name'] = name;
    data['position'] = position;
    data['matchPoints'] = matchPoints;
    data['breakdown'] = breakdown;
    return data;
  }
}

class PeriodScores {
  String? periodType;
  int? periodOrder;
  String? periodStatus;
  int? homeScore;
  int? awayScore;
  bool? isExtraTime;
  int? extraTimeMinutes;
  int? extraTimeSeconds;

  PeriodScores(
      {this.periodType,
      this.periodOrder,
      this.periodStatus,
      this.homeScore,
      this.awayScore,
      this.isExtraTime,
      this.extraTimeMinutes,
      this.extraTimeSeconds});

  PeriodScores.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
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

class PastMatches {
  String? matchKey;
  String? competitionId;
  String? competitionName;
  String? seasonYear;
  String? start;
  String? status;
  String? home;
  int? homeScore;
  String? homeImageUrl;
  String? homeAssetCode;
  String? homeShortName;
  String? away;
  int? awayScore;
  String? awayImageUrl;
  String? awayAssetCode;
  String? awayShortName;

  PastMatches(
      {this.matchKey,
      this.competitionId,
      this.competitionName,
      this.seasonYear,
      this.start,
      this.status,
      this.home,
      this.homeScore,
      this.homeImageUrl,
      this.homeAssetCode,
      this.homeShortName,
      this.away,
      this.awayScore,
      this.awayImageUrl,
      this.awayAssetCode,
      this.awayShortName});

  PastMatches.fromJson(Map<String, dynamic> json) {
    matchKey = json['matchKey'];
    competitionId = json['competitionId'];
    competitionName = json['competitionName'];
    seasonYear = json['seasonYear'];
    start = json['start'];
    status = json['status'];
    home = json['home'];
    homeScore = json['homeScore'];
    homeImageUrl = json['homeImageUrl'];
    homeAssetCode = json['homeAssetCode'];
    homeShortName = json['homeShortName'];
    away = json['away'];
    awayScore = json['awayScore'];
    awayImageUrl = json['awayImageUrl'];
    awayAssetCode = json['awayAssetCode'];
    awayShortName = json['awayShortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchKey'] = matchKey;
    data['competitionId'] = competitionId;
    data['competitionName'] = competitionName;
    data['seasonYear'] = seasonYear;
    data['start'] = start;
    data['status'] = status;
    data['home'] = home;
    data['homeScore'] = homeScore;
    data['homeImageUrl'] = homeImageUrl;
    data['homeAssetCode'] = homeAssetCode;
    data['homeShortName'] = homeShortName;
    data['away'] = away;
    data['awayScore'] = awayScore;
    data['awayImageUrl'] = awayImageUrl;
    data['awayAssetCode'] = awayAssetCode;
    data['awayShortName'] = awayShortName;
    return data;
  }
}
