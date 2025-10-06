class MyTeamsModel {
  String? id;
  String? name;
  String? tournamentId;
  String? type;
  double? cost;
  int? rank;
  MatchData? matchData;
  String? userId;
  DateTime? createdAt;
  bool? isPrivate;

  MyTeamsModel({
    this.id,
    this.name,
    this.tournamentId,
    this.type,
    this.cost,
    this.rank,
    this.matchData,
    this.userId,
    this.createdAt,
    this.isPrivate,
  });

  MyTeamsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tournamentId = json['tournamentId'];
    type = json['type'];
    cost = (json['cost'] is int)
        ? (json['cost'] as int).toDouble()
        : json['cost']?.toDouble();
    rank = json['rank'];
    matchData = json['matchData'] != null
        ? MatchData.fromJson(json['matchData'])
        : null;
    userId = json['userId'];
    createdAt =
        json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null;
    isPrivate = json['isPrivate'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tournamentId'] = tournamentId;
    data['type'] = type;
    data['cost'] = cost;
    data['rank'] = rank;
    if (matchData != null) {
      data['matchData'] = matchData!.toJson();
    }
    data['userId'] = userId;
    data['createdAt'] = createdAt?.toIso8601String();
    data['isPrivate'] = isPrivate;
    return data;
  }
}

class MatchData {
  String? matchId;
  int? seqId;
  String? validAt;
  String? home;
  String? away;
  String? competitionId;
  String? competitionName;
  int? seasonYear;
  String? expStartDate;
  String? expEndDate;
  String? status;
  bool? isLive;
  bool? close;
  dynamic homeScore;
  dynamic homeHalfTimeScore;
  String? homeImageUrl;
  String? homeAssetCode;
  String? homeShortName;
  dynamic awayTeam;
  dynamic awayScore;
  dynamic awayHalfTimeScore;
  String? awayImageUrl;
  String? awayAssetCode;
  String? awayShortName;
  dynamic minutesPlayed;
  String? matchVenue;
  String? matchCity;
  String? matchCountry;
  String? playerOfTheMatchId;
  String? playerOfTheMatchAssetCode;
  String? playerOfTheMatchName;

  MatchData({
    this.matchId,
    this.seqId,
    this.validAt,
    this.home,
    this.away,
    this.competitionId,
    this.competitionName,
    this.seasonYear,
    this.expStartDate,
    this.expEndDate,
    this.status,
    this.isLive,
    this.close,
    this.homeScore,
    this.homeHalfTimeScore,
    this.homeImageUrl,
    this.homeAssetCode,
    this.homeShortName,
    this.awayTeam,
    this.awayScore,
    this.awayHalfTimeScore,
    this.awayImageUrl,
    this.awayAssetCode,
    this.awayShortName,
    this.minutesPlayed,
    this.matchVenue,
    this.matchCity,
    this.matchCountry,
    this.playerOfTheMatchId,
    this.playerOfTheMatchAssetCode,
    this.playerOfTheMatchName,
  });

  MatchData.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
    seqId = json['seqId'];
    validAt = json['validAt'];
    home = json['home'];
    away = json['away'];
    competitionId = json['competitionId'];
    competitionName = json['competitionName'];
    seasonYear = json['seasonYear'];
    expStartDate = json['expStartDate'];
    expEndDate = json['expEndDate'];
    status = json['status'];
    isLive = json['isLive'] ?? false;
    close = json['close'] ?? false;
    homeScore = json['homeScore'];
    homeHalfTimeScore = json['homeHalfTimeScore'];
    homeImageUrl = json['homeImageUrl'];
    homeAssetCode = json['homeAssetCode'];
    homeShortName = json['homeShortName'];
    awayTeam = json['awayTeam'];
    awayScore = json['awayScore'];
    awayHalfTimeScore = json['awayHalfTimeScore'];
    awayImageUrl = json['awayImageUrl'];
    awayAssetCode = json['awayAssetCode'];
    awayShortName = json['awayShortName'];
    minutesPlayed = json['minutesPlayed'];
    matchVenue = json['matchVenue'];
    matchCity = json['matchCity'];
    matchCountry = json['matchCountry'];
    playerOfTheMatchId = json['playerOfTheMatchId'];
    playerOfTheMatchAssetCode = json['playerOfTheMatchAssetCode'];
    playerOfTheMatchName = json['playerOfTheMatchName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchId'] = matchId;
    data['seqId'] = seqId;
    data['validAt'] = validAt;
    data['home'] = home;
    data['away'] = away;
    data['competitionId'] = competitionId;
    data['competitionName'] = competitionName;
    data['seasonYear'] = seasonYear;
    data['expStartDate'] = expStartDate;
    data['expEndDate'] = expEndDate;
    data['status'] = status;
    data['isLive'] = isLive;
    data['close'] = close;
    data['homeScore'] = homeScore;
    data['homeHalfTimeScore'] = homeHalfTimeScore;
    data['homeImageUrl'] = homeImageUrl;
    data['homeAssetCode'] = homeAssetCode;
    data['homeShortName'] = homeShortName;
    data['awayTeam'] = awayTeam;
    data['awayScore'] = awayScore;
    data['awayHalfTimeScore'] = awayHalfTimeScore;
    data['awayImageUrl'] = awayImageUrl;
    data['awayAssetCode'] = awayAssetCode;
    data['awayShortName'] = awayShortName;
    data['minutesPlayed'] = minutesPlayed;
    data['matchVenue'] = matchVenue;
    data['matchCity'] = matchCity;
    data['matchCountry'] = matchCountry;
    data['playerOfTheMatchId'] = playerOfTheMatchId;
    data['playerOfTheMatchAssetCode'] = playerOfTheMatchAssetCode;
    data['playerOfTheMatchName'] = playerOfTheMatchName;
    return data;
  }
}
