class MatchCenterInnerNew {
  final String? matchKey;
  final String? matchTitle;
  final String? result;
  final String? resultType;
  final String? resultMsg;
  final String? teamWon;
  final String? winnerTeamKey;
  final String? playerOfTheMatch;
  final String? matchStatus;
  final String? status;
  final String? playStatus;
  final String? homeTeamKey;
  final String? homeTeamName;
  final String? homeTeamImageUrl;
  final String? awayTeamKey;
  final String? awayTeamName;
  final String? awayTeamImageUrl;
  final List<String>? homeTeamScores;
  final List<String>? awayTeamScores;
  final List<PlayerMatchStatistic>? playerMatchStatistics;
  final List<TopPerformer>? topPerformers;
  final DateTime? matchStartDate;
  final DateTime? expiryDate;
  final String? tournamentName;
  final String? competitionName;

  MatchCenterInnerNew({
    this.matchKey,
    this.matchTitle,
    this.result,
    this.resultType,
    this.resultMsg,
    this.teamWon,
    this.winnerTeamKey,
    this.playerOfTheMatch,
    this.matchStatus,
    this.status,
    this.playStatus,
    this.homeTeamKey,
    this.homeTeamName,
    this.homeTeamImageUrl,
    this.awayTeamKey,
    this.awayTeamName,
    this.awayTeamImageUrl,
    this.homeTeamScores,
    this.awayTeamScores,
    this.playerMatchStatistics,
    this.topPerformers,
    this.matchStartDate,
    this.tournamentName,
    this.competitionName,
    this.expiryDate,
  });

  factory MatchCenterInnerNew.fromJson(Map<String, dynamic> json) {
    return MatchCenterInnerNew(
      matchKey: json['matchKey'] ?? '',
      matchTitle: json['matchTitle'] ?? '',
      result: json['result'] ?? "",
      resultType: json['resultType'] ?? '',
      resultMsg: json['resultMsg'] ?? '',
      teamWon: json['teamWon'] ?? '',
      winnerTeamKey: json['winnerTeamKey'] ?? '',
      playerOfTheMatch: json['playerOfTheMatch'] ?? '',
      matchStatus: json['matchStatus'] ?? '',
      status: json['status'] ?? '',
      playStatus: json['playStatus'] ?? '',
      homeTeamKey: json['homeTeamKey'] ?? '',
      homeTeamName: json['homeTeamName'],
      homeTeamImageUrl: json['homeTeamImageUrl'] ?? '',
      awayTeamKey: json['awayTeamKey'] ?? '',
      awayTeamName: json['awayTeamName'] ?? '',
      awayTeamImageUrl: json['awayTeamImageUrl'] ?? '',
      homeTeamScores: List<String>.from(json['homeTeamScores']),
      awayTeamScores: List<String>.from(json['awayTeamScores']),
      playerMatchStatistics: (json['playerMatchStatistics'] as List)
          .map((item) => PlayerMatchStatistic.fromJson(item))
          .toList(),
      topPerformers: (json['topPerformers'] as List)
          .map((item) => TopPerformer.fromJson(item))
          .toList(),
      matchStartDate: json['matchStartDate'] != null
          ? DateTime.parse(json['matchStartDate'])
          : null,
      expiryDate: json['expiryDate'] != null
          ? DateTime.parse(json['expiryDate'])
          : null,
      tournamentName: json['tournamentName'] ?? '',
      competitionName: json['competitionName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'matchKey': matchKey,
      'matchTitle': matchTitle,
      'result': result,
      'resultType': resultType,
      'resultMsg': resultMsg,
      'teamWon': teamWon,
      'winnerTeamKey': winnerTeamKey,
      'playerOfTheMatch': playerOfTheMatch,
      'matchStatus': matchStatus,
      'status': status,
      'playStatus': playStatus,
      'homeTeamKey': homeTeamKey,
      'homeTeamName': homeTeamName,
      'homeTeamImageUrl': homeTeamImageUrl,
      'awayTeamKey': awayTeamKey,
      'awayTeamName': awayTeamName,
      'awayTeamImageUrl': awayTeamImageUrl,
      'homeTeamScores': homeTeamScores,
      'awayTeamScores': awayTeamScores,
      'playerMatchStatistics':
          playerMatchStatistics?.map((e) => e.toJson()).toList(),
      'topPerformers': topPerformers?.map((e) => e.toJson()).toList(),
    };
  }
}

class PlayerMatchStatistic {
  final int rank;
  final double totalFantasyPoints;
  final String playerName;
  final String role;
  final String headshotImageUrl;
  final List<FantasyPointsBreakdown> fantasyPointsBreakdowns;
  final String playerKey;
  final String? matchKey;
  final String teamKey;
  final String? innings;
  final int runScored;
  final int ballsFaced;
  final int fours;
  final int sixes;
  final double strikeRate;
  final int ballsBowled;
  final int runsGiven;
  final double bowlingEconomy;
  final int extrasGiven;
  final int wicketsTaken;
  final int maidenOvers;
  final int dotBallsBowled;
  final int widesGiven;
  final int noBallsBowled;
  final int foursGiven;
  final int sixesGiven;
  final int wicketsBowled;
  final int wicketsCaught;
  final int wicketsLbw;
  final int wicketsStumping;
  final int catches;
  final int stumpings;
  final int runOuts;
  final int runoutDirectHits;
  final int runoutAssists;
  final String updatedAt;

  PlayerMatchStatistic({
    required this.rank,
    required this.totalFantasyPoints,
    required this.playerName,
    required this.role,
    required this.headshotImageUrl,
    required this.fantasyPointsBreakdowns,
    required this.playerKey,
    this.matchKey,
    required this.teamKey,
    this.innings,
    required this.runScored,
    required this.ballsFaced,
    required this.fours,
    required this.sixes,
    required this.strikeRate,
    required this.ballsBowled,
    required this.runsGiven,
    required this.bowlingEconomy,
    required this.extrasGiven,
    required this.wicketsTaken,
    required this.maidenOvers,
    required this.dotBallsBowled,
    required this.widesGiven,
    required this.noBallsBowled,
    required this.foursGiven,
    required this.sixesGiven,
    required this.wicketsBowled,
    required this.wicketsCaught,
    required this.wicketsLbw,
    required this.wicketsStumping,
    required this.catches,
    required this.stumpings,
    required this.runOuts,
    required this.runoutDirectHits,
    required this.runoutAssists,
    required this.updatedAt,
  });

  factory PlayerMatchStatistic.fromJson(Map<String, dynamic> json) {
    return PlayerMatchStatistic(
      rank: json['rank'],
      totalFantasyPoints: (json['totalFantasyPoints'] as num).toDouble(),
      playerName: json['playerName'],
      role: json['role'],
      headshotImageUrl: json['headshotImageUrl'],
      fantasyPointsBreakdowns: (json['fantasyPointsBreakdowns'] as List)
          .map((item) => FantasyPointsBreakdown.fromJson(item))
          .toList(),
      playerKey: json['playerKey'],
      matchKey: json['matchKey'],
      teamKey: json['teamKey'],
      innings: json['innings'],
      runScored: json['runScored'],
      ballsFaced: json['ballsFaced'],
      fours: json['fours'],
      sixes: json['sixes'],
      strikeRate: (json['strikeRate'] as num).toDouble(),
      ballsBowled: json['ballsBowled'],
      runsGiven: json['runsGiven'],
      bowlingEconomy: (json['bowlingEconomy'] as num).toDouble(),
      extrasGiven: json['extrasGiven'],
      wicketsTaken: json['wicketsTaken'],
      maidenOvers: json['maidenOvers'],
      dotBallsBowled: json['dotBallsBowled'],
      widesGiven: json['widesGiven'],
      noBallsBowled: json['noBallsBowled'],
      foursGiven: json['foursGiven'],
      sixesGiven: json['sixesGiven'],
      wicketsBowled: json['wicketsBowled'],
      wicketsCaught: json['wicketsCaught'],
      wicketsLbw: json['wicketsLbw'],
      wicketsStumping: json['wicketsStumping'],
      catches: json['catches'],
      stumpings: json['stumpings'],
      runOuts: json['runOuts'],
      runoutDirectHits: json['runoutDirectHits'],
      runoutAssists: json['runoutAssists'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'totalFantasyPoints': totalFantasyPoints,
      'playerName': playerName,
      'role': role,
      'headshotImageUrl': headshotImageUrl,
      'fantasyPointsBreakdowns':
          fantasyPointsBreakdowns.map((e) => e.toJson()).toList(),
      'playerKey': playerKey,
      'matchKey': matchKey,
      'teamKey': teamKey,
      'innings': innings,
      'runScored': runScored,
      'ballsFaced': ballsFaced,
      'fours': fours,
      'sixes': sixes,
      'strikeRate': strikeRate,
      'ballsBowled': ballsBowled,
      'runsGiven': runsGiven,
      'bowlingEconomy': bowlingEconomy,
      'extrasGiven': extrasGiven,
      'wicketsTaken': wicketsTaken,
      'maidenOvers': maidenOvers,
      'dotBallsBowled': dotBallsBowled,
      'widesGiven': widesGiven,
      'noBallsBowled': noBallsBowled,
      'foursGiven': foursGiven,
      'sixesGiven': sixesGiven,
      'wicketsBowled': wicketsBowled,
      'wicketsCaught': wicketsCaught,
      'wicketsLbw': wicketsLbw,
      'wicketsStumping': wicketsStumping,
      'catches': catches,
      'stumpings': stumpings,
      'runOuts': runOuts,
      'runoutDirectHits': runoutDirectHits,
      'runoutAssists': runoutAssists,
      'updatedAt': updatedAt,
    };
  }
}

class FantasyPointsBreakdown {
  final String? matchKey;
  final String playerKey;
  final String fantasyPointType;
  final double fantasyPoints;
  final String fantasyPointDescription;

  FantasyPointsBreakdown({
    this.matchKey,
    required this.playerKey,
    required this.fantasyPointType,
    required this.fantasyPoints,
    required this.fantasyPointDescription,
  });

  factory FantasyPointsBreakdown.fromJson(Map<String, dynamic> json) {
    return FantasyPointsBreakdown(
      matchKey: json['matchKey'],
      playerKey: json['playerKey'],
      fantasyPointType: json['fantasyPointType'],
      fantasyPoints: (json['fantasyPoints'] as num).toDouble(),
      fantasyPointDescription: json['fantasyPointDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'matchKey': matchKey,
      'playerKey': playerKey,
      'fantasyPointType': fantasyPointType,
      'fantasyPoints': fantasyPoints,
      'fantasyPointDescription': fantasyPointDescription,
    };
  }
}

class TopPerformer {
  final String teamKey;
  final String innings;
  final String topBatsman1;
  final String topBatsman1Score;
  final String topBatsman2;
  final String topBatsman2Score;
  final String topBowler1;
  final String topBowler1Score;
  final String topBowler2;
  final String topBowler2Score;

  TopPerformer({
    required this.teamKey,
    required this.innings,
    required this.topBatsman1,
    required this.topBatsman1Score,
    required this.topBatsman2,
    required this.topBatsman2Score,
    required this.topBowler1,
    required this.topBowler1Score,
    required this.topBowler2,
    required this.topBowler2Score,
  });

  factory TopPerformer.fromJson(Map<String, dynamic> json) {
    return TopPerformer(
      teamKey: json['teamKey'],
      innings: json['innings'],
      topBatsman1: json['topBatsman1'],
      topBatsman1Score: json['topBatsman1Score'],
      topBatsman2: json['topBatsman2'],
      topBatsman2Score: json['topBatsman2Score'],
      topBowler1: json['topBowler1'],
      topBowler1Score: json['topBowler1Score'],
      topBowler2: json['topBowler2'],
      topBowler2Score: json['topBowler2Score'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teamKey': teamKey,
      'innings': innings,
      'topBatsman1': topBatsman1,
      'topBatsman1Score': topBatsman1Score,
      'topBatsman2': topBatsman2,
      'topBatsman2Score': topBatsman2Score,
      'topBowler1': topBowler1,
      'topBowler1Score': topBowler1Score,
      'topBowler2': topBowler2,
      'topBowler2Score': topBowler2Score,
    };
  }
}
