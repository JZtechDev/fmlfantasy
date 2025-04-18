class LotoLeaderboardMatches {
  String? competition;
  String? matchStartsAt;
  String? matchStatus;
  String? homeTeamName;
  String? homeTeamImageUrl;
  String? awayTeamName;
  String? awayTeamImageUrl;
  String? matchKey;
  int? totalWinning;

  LotoLeaderboardMatches(
      {competition,
      matchStartsAt,
      matchStatus,
      homeTeamName,
      homeTeamImageUrl,
      awayTeamName,
      awayTeamImageUrl,
      matchKey,
      totalWinning});

  LotoLeaderboardMatches.fromJson(Map<String, dynamic> json) {
    competition = json['competition'] ?? '';
    matchStartsAt = json['matchStartsAt'] ?? '';
    matchStatus = json['matchStatus'] ?? '';
    homeTeamName = json['homeTeamName'] ?? '';
    homeTeamImageUrl = json['homeTeamImageUrl'] ?? '';
    awayTeamName = json['awayTeamName'];
    awayTeamImageUrl = json['awayTeamImageUrl'] ?? '';
    matchKey = json['matchkey'] ?? '';
    totalWinning = json['totalWinning'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['competition'] = competition;
    data['matchStartsAt'] = matchStartsAt;
    data['matchStatus'] = matchStatus;
    data['homeTeamName'] = homeTeamName;
    data['homeTeamImageUrl'] = homeTeamImageUrl;
    data['awayTeamName'] = awayTeamName;
    data['awayTeamImageUrl'] = awayTeamImageUrl;
    data['matchey'] = matchKey;
    data['totalWinning'] = totalWinning;
    return data;
  }
}

class LotoInnerLeaderboardModel {
  String? matchKey;
  int? sportID;
  String? playerRank1;
  String? player1Name;
  String? player1Image;
  String? player1Team;
  String? playerRank2;
  String? player2Name;
  String? player2Image;
  String? player2Team;
  String? playerRank3;
  String? player3Name;
  String? player3Image;
  String? player3Team;
  String? playerRank4;
  String? player4Name;
  String? player4Image;
  String? player4Team;
  String? playerRank5;
  String? player5Name;
  String? player5Image;
  String? player5Team;
  String? matchOutcome;
  String? winnerTeamKey;
  String? winnerTeamName;
  String? winnerTeamImageUrl;
  double? prizePot;
  String? homeTeamName;
  String? homeTeamImageUrl;
  String? awayTeamName;
  String? awayTeamImageUrl;
  List<Details>? details;

  LotoInnerLeaderboardModel(
      {matchKey,
      sportID,
      playerRank1,
      player1Name,
      player1Image,
      player1Team,
      playerRank2,
      player2Name,
      player2Image,
      player2Team,
      playerRank3,
      player3Name,
      player3Image,
      player3Team,
      playerRank4,
      player4Name,
      player4Image,
      player4Team,
      playerRank5,
      player5Name,
      player5Image,
      player5Team,
      matchOutcome,
      winnerTeamKey,
      winnerTeamName,
      winnerTeamImageUrl,
      prizePot,
      homeTeamName,
      homeTeamImageUrl,
      awayTeamName,
      awayTeamImageUrl,
      details});

  LotoInnerLeaderboardModel.fromJson(Map<String, dynamic> json) {
    matchKey = json['matchKey'] ?? '';
    sportID = json['sportID'] ?? 0;
    playerRank1 = json['playerRank1'] ?? '';
    player1Name = json['player1Name'] ?? '';
    player1Image = json['player1Image'] ?? '';
    player1Team = json['player1Team'] ?? '';
    playerRank2 = json['playerRank2'] ?? '';
    player2Name = json['player2Name'] ?? '';
    player2Image = json['player2Image'] ?? '';
    player2Team = json['player2Team'] ?? '';
    playerRank3 = json['playerRank3'] ?? '';
    player3Name = json['player3Name'] ?? '';
    player3Image = json['player3Image'] ?? '';
    player3Team = json['player3Team'] ?? '';
    playerRank4 = json['playerRank4'] ?? '';
    player4Name = json['player4Name'] ?? '';
    player4Image = json['player4Image'] ?? '';
    player4Team = json['player4Team'] ?? '';
    playerRank5 = json['playerRank5'] ?? '';
    player5Name = json['player5Name'] ?? '';
    player5Image = json['player5Image'] ?? '';
    player5Team = json['player5Team'] ?? '';
    matchOutcome = json['matchOutcome'] ?? '';
    winnerTeamKey = json['winnerTeamKey'] ?? '';
    winnerTeamName = json['winnerTeamName'] ?? '';
    winnerTeamImageUrl = json['winnerTeamImageUrl'] ?? '';
    prizePot = json['prizePot'] ?? '';
    homeTeamName = json['homeTeamName'] ?? '';
    homeTeamImageUrl = json['homeTeamImageUrl'] ?? '';
    awayTeamName = json['awayTeamName'] ?? '';
    awayTeamImageUrl = json['awayTeamImageUrl'] ?? '';
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
    data['player1Image'] = player1Image;
    data['player1Team'] = player1Team;
    data['playerRank2'] = playerRank2;
    data['player2Name'] = player2Name;
    data['player2Image'] = player2Image;
    data['player2Team'] = player2Team;
    data['playerRank3'] = playerRank3;
    data['player3Name'] = player3Name;
    data['player3Image'] = player3Image;
    data['player3Team'] = player3Team;
    data['playerRank4'] = playerRank4;
    data['player4Name'] = player4Name;
    data['player4Image'] = player4Image;
    data['player4Team'] = player4Team;
    data['playerRank5'] = playerRank5;
    data['player5Name'] = player5Name;
    data['player5Image'] = player5Image;
    data['player5Team'] = player5Team;
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
  double? winning;
  String? userId;

  Details(
      {drawUserEntryID,
      drawID,
      created,
      homeTeamName,
      awayTeamName,
      rank,
      winLevel,
      dmpPoints,
      winning,
      userId});

  Details.fromJson(Map<String, dynamic> json) {
    drawUserEntryID = json['drawUserEntryID'] ?? '';
    drawID = json['drawID'] ?? '';
    created = json['created'] ?? '';
    homeTeamName = json['homeTeamName'] ?? '';
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
