class DrawsLeaderboard {
  int? matchKey;
  int? sportID;
  String? playerRank1;
  String? player1Name;
  String? playerRank2;
  String? player2Name;
  String? playerRank3;
  String? player3Name;
  String? playerRank4;
  String? player4Name;
  String? playerRank5;
  String? player5Name;
  String? matchOutcome;
  int? winnerTeamKey;
  String? winnerTeamName;
  String? winnerTeamImageUrl;
  int? prizePot;
  String? homeTeamName;
  String? homeTeamImageUrl;
  String? awayTeamName;
  String? awayTeamImageUrl;
  List<Details>? details;

  DrawsLeaderboard(
      {this.matchKey,
      this.sportID,
      this.playerRank1,
      this.player1Name,
      this.playerRank2,
      this.player2Name,
      this.playerRank3,
      this.player3Name,
      this.playerRank4,
      this.player4Name,
      this.playerRank5,
      this.player5Name,
      this.matchOutcome,
      this.winnerTeamKey,
      this.winnerTeamName,
      this.winnerTeamImageUrl,
      this.prizePot,
      this.homeTeamName,
      this.homeTeamImageUrl,
      this.awayTeamName,
      this.awayTeamImageUrl,
      this.details});

  DrawsLeaderboard.fromJson(Map<String, dynamic> json) {
    matchKey = json['matchKey'];
    sportID = json['sportID'];
    playerRank1 = json['playerRank1'];
    player1Name = json['player1Name'];
    playerRank2 = json['playerRank2'];
    player2Name = json['player2Name'];
    playerRank3 = json['playerRank3'];
    player3Name = json['player3Name'];
    playerRank4 = json['playerRank4'];
    player4Name = json['player4Name'];
    playerRank5 = json['playerRank5'];
    player5Name = json['player5Name'];
    matchOutcome = json['matchOutcome'];
    winnerTeamKey = json['winnerTeamKey'];
    winnerTeamName = json['winnerTeamName'];
    winnerTeamImageUrl = json['winnerTeamImageUrl'];
    prizePot = json['prizePot'];
    homeTeamName = json['homeTeamName'];
    homeTeamImageUrl = json['homeTeamImageUrl'];
    awayTeamName = json['awayTeamName'];
    awayTeamImageUrl = json['awayTeamImageUrl'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchKey'] = matchKey;
    data['sportID'] = sportID;
    data['playerRank1'] = playerRank1;
    data['player1Name'] = player1Name;
    data['playerRank2'] = playerRank2;
    data['player2Name'] = player2Name;
    data['playerRank3'] = playerRank3;
    data['player3Name'] = player3Name;
    data['playerRank4'] = playerRank4;
    data['player4Name'] = player4Name;
    data['playerRank5'] = playerRank5;
    data['player5Name'] = player5Name;
    data['matchOutcome'] = matchOutcome;
    data['winnerTeamKey'] = winnerTeamKey;
    data['winnerTeamName'] = winnerTeamName;
    data['winnerTeamImageUrl'] = winnerTeamImageUrl;
    data['prizePot'] = prizePot;
    data['homeTeamName'] = homeTeamName;
    data['homeTeamImageUrl'] = homeTeamImageUrl;
    data['awayTeamName'] = awayTeamName;
    data['awayTeamImageUrl'] = awayTeamImageUrl;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? drawUserEntryID;
  int? drawID;
  String? created;
  String? homeTeamName;
  String? awayTeamName;
  String? rank;
  String? winLevel;
  int? dmpPoints;
  int? winning;
  String? userId;

  Details(
      {this.drawUserEntryID,
      this.drawID,
      this.created,
      this.homeTeamName,
      this.awayTeamName,
      this.rank,
      this.winLevel,
      this.dmpPoints,
      this.winning,
      this.userId});

  Details.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
