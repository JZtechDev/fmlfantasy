class MyTeamsModel {
  String? id;
  String? name;
  String? tournamentId;
  String? type;
  double? cost;
  int? rank;
  MatchData? matchData;
  String? userId;

  MyTeamsModel(
      {this.id,
      this.name,
      this.tournamentId,
      this.type,
      this.cost,
      this.rank,
      this.matchData,
      this.userId});

  MyTeamsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tournamentId = json['tournamentId'];
    type = json['type'];
    cost = json['cost'];
    rank = json['rank'];
    matchData = json['matchData'] != null
        ? MatchData.fromJson(json['matchData'])
        : null;
    userId = json['userId'];
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
    return data;
  }
}

class MatchData {
  String? tournamentId;
  String? competition;
  String? sportCode;
  String? matchCode;
  String? home;
  String? homeAssetCode;
  String? homeShortName;
  String? homeImageUrl;
  String? homeScore;
  String? away;
  String? awayAssetCode;
  String? awayShortName;
  String? awayImageUrl;
  String? awayScore;
  String? status;

  MatchData(
      {this.tournamentId,
      this.sportCode,
      this.competition,
      this.matchCode,
      this.home,
      this.homeAssetCode,
      this.homeShortName,
      this.homeImageUrl,
      this.homeScore,
      this.away,
      this.awayAssetCode,
      this.awayShortName,
      this.awayImageUrl,
      this.awayScore,
      this.status});

  MatchData.fromJson(Map<String, dynamic> json) {
    tournamentId = json['tournamentId'];
    competition = json['competition'];
    sportCode = json['sportCode'];
    matchCode = json['matchCode'];
    home = json['home'];
    homeAssetCode = json['homeAssetCode'];
    homeShortName = json['homeShortName'];
    homeImageUrl = json['homeImageUrl'];
    homeScore = json['homeScore'];
    away = json['away'];
    awayAssetCode = json['awayAssetCode'];
    awayShortName = json['awayShortName'];
    awayImageUrl = json['awayImageUrl'];
    awayScore = json['awayScore'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tournamentId'] = tournamentId;
    data['competition'] = competition;
    data['sportCode'] = sportCode;
    data['matchCode'] = matchCode;
    data['home'] = home;
    data['homeAssetCode'] = homeAssetCode;
    data['homeShortName'] = homeShortName;
    data['homeImageUrl'] = homeImageUrl;
    data['homeScore'] = homeScore;
    data['away'] = away;
    data['awayAssetCode'] = awayAssetCode;
    data['awayShortName'] = awayShortName;
    data['awayImageUrl'] = awayImageUrl;
    data['awayScore'] = awayScore;
    data['status'] = status;
    return data;
  }
}
