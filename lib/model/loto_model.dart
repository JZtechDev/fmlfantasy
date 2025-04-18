class CreateLoto {
  int? sportId;
  String? tournamentKey;
  String? matchKey;
  String? homeTeamKey;
  String? awayTeamKey;
  String? playerRank1;
  String? player1Team;
  String? playerRank2;
  String? player2Team;
  String? playerRank3;
  String? player3Team;
  String? playerRank4;
  String? player4Team;
  String? playerRank5;
  String? player5Team;
  int? matchOutcome;
  String? winnerTeamKey;

  CreateLoto({
    this.sportId,
    this.tournamentKey,
    this.matchKey,
    this.homeTeamKey,
    this.awayTeamKey,
    this.playerRank1,
    this.player1Team,
    this.playerRank2,
    this.player2Team,
    this.playerRank3,
    this.player3Team,
    this.playerRank4,
    this.player4Team,
    this.playerRank5,
    this.player5Team,
    this.matchOutcome,
    this.winnerTeamKey,
  });

  CreateLoto.fromJson(Map<String, dynamic> json) {
    sportId = json['sportId'];
    tournamentKey = json['tournamentKey'];
    matchKey = json['matchKey'];
    homeTeamKey = json['homeTeamKey'];
    awayTeamKey = json['awayTeamKey'];
    playerRank1 = json['playerRank1'];
    player1Team = json['player1TeamKey'];
    playerRank2 = json['playerRank2'];
    player2Team = json['player2TeamKey'];
    playerRank3 = json['playerRank3'];
    player3Team = json['player3TeamKey'];
    playerRank4 = json['playerRank4'];
    player4Team = json['player4TeamKey'];
    playerRank5 = json['playerRank5'];
    player5Team = json['player5TeamKey'];
    matchOutcome = json['matchOutcome'];
    winnerTeamKey = json['winnerTeamKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sportId'] = sportId;
    data['tournamentKey'] = tournamentKey;
    data['matchKey'] = matchKey;
    data['homeTeamKey'] = homeTeamKey;
    data['awayTeamKey'] = awayTeamKey;
    data['playerRank1'] = playerRank1;
    data['player1TeamKey'] = player1Team;
    data['playerRank2'] = playerRank2;
    data['player2TeamKey'] = player2Team;
    data['playerRank3'] = playerRank3;
    data['player3TeamKey'] = player3Team;
    data['playerRank4'] = playerRank4;
    data['player4TeamKey'] = player4Team;
    data['playerRank5'] = playerRank5;
    data['player5TeamKey'] = player5Team;
    data['matchOutcome'] = matchOutcome;
    data['winnerTeamKey'] = winnerTeamKey;
    return data;
  }
}
