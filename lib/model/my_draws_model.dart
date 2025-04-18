// class MyDrawsModel {
//   String nba;
//   String date;
//   String homImageUrl;
//   String awayImageUrl;
//   String homeName;
//   String awayName;

//   MyDrawsModel(
//       {required this.nba,
//       required this.date,
//       required this.homImageUrl,
//       required this.awayImageUrl,
//       required this.homeName,
//       required this.awayName});
// }

class MyDrawsLeaderBordModel {
  String homeName;
  String awayName;
  String rank;
  String imageUrl;
  String gold;
  String goldsub;
  String ponint;
  String pointSub;

  MyDrawsLeaderBordModel(
      {required this.homeName,
      required this.awayName,
      required this.rank,
      required this.imageUrl,
      required this.gold,
      required this.goldsub,
      required this.ponint,
      required this.pointSub});
}

class DrawTeamsModel {
  int? drawID;
  String? competition;
  String? matchStartsAt;
  String? matchStatus;
  String? homeTeamName;
  String? homeTeamImageUrl;
  String? awayTeamName;
  String? awayTeamImageUrl;

  DrawTeamsModel(
      {this.drawID,
      this.competition,
      this.matchStartsAt,
      this.matchStatus,
      this.homeTeamName,
      this.homeTeamImageUrl,
      this.awayTeamName,
      this.awayTeamImageUrl});

  DrawTeamsModel.fromJson(Map<String, dynamic> json) {
    drawID = json['drawID'];
    competition = json['competition'];
    matchStartsAt = json['matchStartsAt'];
    matchStatus = json['matchStatus'];
    homeTeamName = json['homeTeamName'];
    homeTeamImageUrl = json['homeTeamImageUrl'];
    awayTeamName = json['awayTeamName'];
    awayTeamImageUrl = json['awayTeamImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['drawID'] = drawID;
    data['competition'] = competition;
    data['matchStartsAt'] = matchStartsAt;
    data['matchStatus'] = matchStatus;
    data['homeTeamName'] = homeTeamName;
    data['homeTeamImageUrl'] = homeTeamImageUrl;
    data['awayTeamName'] = awayTeamName;
    data['awayTeamImageUrl'] = awayTeamImageUrl;
    return data;
  }
}

class MyDrawsModels {
  int? drawUserEntryID;
  int? drawID;
  String? created;
  String? homeTeamName;
  String? awayTeamName;
  String? rank;
  String? winLevel;
  int? dmpPoints;
  double? winning;
  String? userId;
  String? playersRank1;
  String? player1Name;
  String? player1ImageUrl;
  String? player1Team;
  String? playersRank2;
  String? player2Team;
  String? player2ImageUrl;
  String? player2Name;
  String? playersRank3;
  String? player3Name;
  String? player3ImageUrl;
  String? player3Team;
  String? playersRank4;
  String? player4Name;
  String? player4ImageUrl;
  String? player4Team;
  String? playersRank5;
  String? player5Name;
  String? player5ImageUrl;
  String? player5Team;
  String? winnerTeamKey;
  String? winnnerTeamName;
  String? winnerTeamImageUrl;
  double? totalwinnings;

  MyDrawsModels(
      {this.drawUserEntryID,
      this.drawID,
      this.created,
      this.homeTeamName,
      this.awayTeamName,
      this.rank,
      this.winLevel,
      this.dmpPoints,
      this.winning,
      this.userId,
      this.playersRank1,
      this.player1Name,
      this.player1ImageUrl,
      this.player1Team,
      this.playersRank2,
      this.player2Name,
      this.player2ImageUrl,
      this.player2Team,
      this.playersRank3,
      this.player3Name,
      this.player3ImageUrl,
      this.player3Team,
      this.playersRank4,
      this.player4Name,
      this.player4ImageUrl,
      this.player4Team,
      this.playersRank5,
      this.player5Name,
      this.player5ImageUrl,
      this.player5Team,
      this.winnerTeamKey,
      this.winnnerTeamName,
      this.winnerTeamImageUrl,
      this.totalwinnings});

  MyDrawsModels.fromJson(Map<String, dynamic> json) {
    drawUserEntryID = json['drawUserEntryID'];
    drawID = json['drawID'];
    created = json['created'];
    homeTeamName = json['homeTeamName'];
    awayTeamName = json['awayTeamName'];
    rank = json['rank'];
    winLevel = json['winLevel'];
    dmpPoints = json['dmpPoints'];
    winning = json['winning'];
    userId = json['userId'];
    playersRank1 = json['playersRank1'] ?? '';
    player1Name = json['player1Name'] ?? '';
    player1ImageUrl = json['player1Image'] ?? '';
    player1Team = json['player1Team'] ?? '';
    playersRank2 = json['playersRank2'] ?? '';
    player2Name = json['player2Name'] ?? '';
    player2ImageUrl = json['player2Image'] ?? '';
    player2Team = json['player2Team'] ?? '';
    playersRank3 = json['playersRank3'] ?? '';
    player3Name = json['player3Name'] ?? '';
    player3ImageUrl = json['player3Image'] ?? '';
    player3Team = json['player3Team'] ?? '';
    playersRank4 = json['playersRank4'] ?? '';
    player4Name = json['player4Name'] ?? '';
    player4ImageUrl = json['player4Image'] ?? '';
    player4Team = json['player4Team'] ?? '';
    playersRank5 = json['playersRank5'] ?? '';
    player5Name = json['player5Name'] ?? '';
    player5ImageUrl = json['player5Image'] ?? '';
    player5Team = json['player5Team'] ?? '';
    winnerTeamKey = json['winnerTeamKey'] ?? '';
    winnnerTeamName = json['winnerTeamName'] ?? '';
    winnerTeamImageUrl = json['winnerTeamImageUrl'] ?? '';
    totalwinnings = json['totalwinnings'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['drawUserEntryID'] = drawUserEntryID;
    data['drawID'] = drawID;
    data['created'] = created;
    data['homeTeamName'] = homeTeamName;
    data['awayTeamName'] = awayTeamName;
    data['rank'] = rank;
    data['winLevel'] = winLevel;
    data['dmpPoints'] = dmpPoints;
    data['winning'] = winning;
    data['userId'] = userId;
    data['playersRank1'] = playersRank1;
    data['player1Name'] = player1Name;
    data['player1Team'] = player1Team;
    data['player1Image'] = player1ImageUrl;
    data['playersRank2'] = playersRank2;
    data['player2Name'] = player2Name;
    data['player2Team'] = player2Team;
    data['player2Image'] = player2ImageUrl;
    data['playersRank3'] = playersRank3;
    data['player3Name'] = player3Name;
    data['player3Team'] = player3Team;
    data['player3Image'] = player3ImageUrl;
    data['playersRank4'] = playersRank4;
    data['player4Name'] = player4Name;
    data['player4Team'] = player4Team;
    data['player4Image'] = player4ImageUrl;
    data['playersRank5'] = playersRank5;
    data['player5Name'] = player5Name;
    data['player5Team'] = player5Team;
    data['player5Image'] = player5ImageUrl;
    data['winnerTeamKey'] = winnerTeamKey;
    data['winnnerTeamName'] = winnnerTeamName;
    data['winnerTeamImageUrl'] = winnerTeamImageUrl;
    data['totalwinnings'] = totalwinnings;
    return data;
  }
}
