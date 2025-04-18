class MonthlyLeaderBoardModel {
  String? matchCode;
  String? tournamentId;
  String? tournamentName;
  String? homeScore;
  String? awayScore;
  String? home;
  String? homeShortName;
  String? homeAssetCode;
  String? homeImageUrl;
  String? away;
  String? awayShortName;
  String? awayAssetCode;
  String? awayImageUrl;
  String? matchTime;
  List<Rankings>? rankings;
  List<TopPlayers>? topPlayers;

  MonthlyLeaderBoardModel(
      {this.matchCode,
      this.tournamentId,
      this.tournamentName,
      this.home,
      this.homeShortName,
      this.homeAssetCode,
      this.homeImageUrl,
      this.away,
      this.awayShortName,
      this.awayAssetCode,
      this.awayImageUrl,
      this.matchTime,
      this.rankings,
      this.topPlayers});

  MonthlyLeaderBoardModel.fromJson(Map<String, dynamic> json) {
    matchCode = json['matchCode'];
    tournamentId = json['tournamentId'];
    tournamentName = json['tournamentName'];
    home = json['home'];
    homeShortName = json['homeShortName'];
    homeAssetCode = json['homeAssetCode'];
    homeImageUrl = json['homeImageUrl'];
    away = json['away'];
    awayShortName = json['awayShortName'];
    awayAssetCode = json['awayAssetCode'];
    homeScore = json['homeScore'] ?? '';
    awayScore = json['awayScore'] ?? '';
    awayImageUrl = json['awayImageUrl'];
    matchTime = json['matchTime'];
    if (json['rankings'] != null) {
      rankings = <Rankings>[];
      json['rankings'].forEach((v) {
        rankings!.add(Rankings.fromJson(v));
      });
    }
    if (json['topPlayers'] != null) {
      topPlayers = <TopPlayers>[];
      json['topPlayers'].forEach((v) {
        topPlayers!.add(TopPlayers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchCode'] = matchCode;
    data['tournamentId'] = tournamentId;
    data['tournamentName'] = tournamentName;
    data['home'] = home;
    data['homeShortName'] = homeShortName;
    data['homeAssetCode'] = homeAssetCode;
    data['homeImageUrl'] = homeImageUrl;
    data['away'] = away;
    data['awayShortName'] = awayShortName;
    data['awayAssetCode'] = awayAssetCode;
    data['awayImageUrl'] = awayImageUrl;
    data['homeScore'] = homeScore;
    data['awayScore'] = awayScore;
    data['matchTime'] = matchTime;
    if (rankings != null) {
      data['rankings'] = rankings!.map((v) => v.toJson()).toList();
    }
    if (topPlayers != null) {
      data['topPlayers'] = topPlayers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rankings {
  String? matchId;
  String? matchDate;
  String? userId;
  String? name;
  String? email;
  String? teamId;
  String? teamName;
  double? fantasyPointsWeighted;
  double? fantasyPointsRaw;
  double? prizeMoney;
  int? rank;
  double? winnings;
  String? userImageUrl;

  Rankings(
      {this.matchId,
      this.matchDate,
      this.userId,
      this.name,
      this.email,
      this.teamId,
      this.teamName,
      this.fantasyPointsWeighted,
      this.fantasyPointsRaw,
      this.prizeMoney,
      this.rank,
      this.winnings,
      this.userImageUrl});

  Rankings.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
    matchDate = json['matchDate'];
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    teamId = json['teamId'];
    teamName = json['teamName'];
    fantasyPointsWeighted = json['fantasyPointsWeighted'];
    fantasyPointsRaw = json['fantasyPointsRaw'];
    prizeMoney = json['prizeMoney'];
    rank = json['rank'];
    winnings = json['winnings'];
    userImageUrl = json['userImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchId'] = matchId;
    data['matchDate'] = matchDate;
    data['userId'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['teamId'] = teamId;
    data['teamName'] = teamName;
    data['fantasyPointsWeighted'] = fantasyPointsWeighted;
    data['fantasyPointsRaw'] = fantasyPointsRaw;
    data['prizeMoney'] = prizeMoney;
    data['rank'] = rank;
    data['winnings'] = winnings;
    data['userImageUrl'] = userImageUrl;
    return data;
  }
}

class TopPlayers {
  String? assetCode;
  String? name;
  String? picture;
  int? rank;
  int? jerseyNumber;
  String? jerseyName;
  String? jerseyImage;
  double? fantasyPoint;

  TopPlayers(
      {this.assetCode,
      this.name,
      this.picture,
      this.rank,
      this.jerseyNumber,
      this.jerseyName,
      this.jerseyImage,
      this.fantasyPoint});

  TopPlayers.fromJson(Map<String, dynamic> json) {
    assetCode = json['assetCode'];
    name = json['name'];
    picture = json['picture'];
    rank = json['rank'];
    jerseyNumber = json['jerseyNumber'];
    jerseyName = json['jerseyName'];
    jerseyImage = json['jerseyImage'];
    fantasyPoint = json['fantasyPoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetCode'] = assetCode;
    data['name'] = name;
    data['picture'] = picture;
    data['rank'] = rank;
    data['jerseyNumber'] = jerseyNumber;
    data['jerseyName'] = jerseyName;
    data['jerseyImage'] = jerseyImage;
    data['fantasyPoint'] = fantasyPoint;
    return data;
  }
}
