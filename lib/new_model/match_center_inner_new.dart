class MatchCenterInnerNew {
  final String matchKey;
  final String matchTitle;
  final String result;
  final String resultType;
  final String resultMsg;
  final String teamWon;
  final String winnerTeamKey;
  final String poM1;
  final String poM2;
  final String poM3;
  final String status;
  final String homeTeamKey;
  final String homeTeamName;
  final String homeTeamImageUrl;
  final String awayTeamKey;
  final String awayTeamName;
  final String awayTeamImageUrl;
  final DateTime? matchStartDate;
  final DateTime? expiryTime;
  final String tournamentName;
  final String competitionName;
  final int homeScore;
  final int awayScore;
  final String city;
  final String country;
  final String stadiumName;
  final String playingSurface;
  final List<String> homeTeamScores;
  final List<String> awayTeamScores;
  final List<PlayerOfTheMatch> playersOfTheMatch;
  final List<PlayerMatchStatistic> playerMatchStatistics;

  MatchCenterInnerNew({
    this.matchKey = '',
    this.matchTitle = '',
    this.result = '',
    this.resultType = '',
    this.resultMsg = '',
    this.teamWon = '',
    this.winnerTeamKey = '',
    this.poM1 = '',
    this.poM2 = '',
    this.poM3 = '',
    this.status = '',
    this.homeTeamKey = '',
    this.homeTeamName = '',
    this.homeTeamImageUrl = '',
    this.awayTeamKey = '',
    this.awayTeamName = '',
    this.awayTeamImageUrl = '',
    this.matchStartDate,
    this.expiryTime,
    this.tournamentName = '',
    this.competitionName = '',
    this.homeScore = 0,
    this.awayScore = 0,
    this.city = '',
    this.country = '',
    this.stadiumName = '',
    this.playingSurface = '',
    this.homeTeamScores = const [],
    this.awayTeamScores = const [],
    this.playersOfTheMatch = const [],
    this.playerMatchStatistics = const [],
  });

  factory MatchCenterInnerNew.fromJson(Map<String, dynamic> json) {
    return MatchCenterInnerNew(
      matchKey: json['matchKey']?.toString() ?? '',
      matchTitle: json['matchTitle']?.toString() ?? '',
      result: json['result']?.toString() ?? '',
      resultType: json['resultType']?.toString() ?? '',
      resultMsg: json['resultMsg']?.toString() ?? '',
      teamWon: json['teamWon']?.toString() ?? '',
      winnerTeamKey: json['winnerTeamKey']?.toString() ?? '',
      poM1: json['poM1']?.toString() ?? '',
      poM2: json['poM2']?.toString() ?? '',
      poM3: json['poM3']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
      homeTeamKey: json['homeTeamKey']?.toString() ?? '',
      homeTeamName: json['homeTeamName']?.toString() ?? '',
      homeTeamImageUrl: json['homeTeamImageUrl']?.toString() ?? '',
      awayTeamKey: json['awayTeamKey']?.toString() ?? '',
      awayTeamName: json['awayTeamName']?.toString() ?? '',
      awayTeamImageUrl: json['awayTeamImageUrl']?.toString() ?? '',
      matchStartDate: _tryParseDate(json['matchStartDate']),
      expiryTime: _tryParseDate(json['expiryTime']),
      tournamentName: json['tournamentName']?.toString() ?? '',
      competitionName: json['competitionName']?.toString() ?? '',
      homeScore: json['homeScore'] is int ? json['homeScore'] : 0,
      awayScore: json['awayScore'] is int ? json['awayScore'] : 0,
      city: json['city']?.toString() ?? '',
      country: json['country']?.toString() ?? '',
      stadiumName: json['stadiumName']?.toString() ?? '',
      playingSurface: json['playingSurface']?.toString() ?? '',
      homeTeamScores: (json['homeTeamScores'] as List?)
              ?.map((e) => e?.toString() ?? '')
              .toList() ??
          [],
      awayTeamScores: (json['awayTeamScores'] as List?)
              ?.map((e) => e?.toString() ?? '')
              .toList() ??
          [],
      playersOfTheMatch: (json['playersOfTheMatch'] as List?)
              ?.map((e) => PlayerOfTheMatch.fromJson(e ?? <String, dynamic>{}))
              .toList() ??
          [],
      playerMatchStatistics: (json['playerMatchStatistics'] as List?)
              ?.map((e) =>
                  PlayerMatchStatistic.fromJson(e ?? <String, dynamic>{}))
              .toList() ??
          [],
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
      'poM1': poM1,
      'poM2': poM2,
      'poM3': poM3,
      'status': status,
      'homeTeamKey': homeTeamKey,
      'homeTeamName': homeTeamName,
      'homeTeamImageUrl': homeTeamImageUrl,
      'awayTeamKey': awayTeamKey,
      'awayTeamName': awayTeamName,
      'awayTeamImageUrl': awayTeamImageUrl,
      'matchStartDate': matchStartDate?.toIso8601String(),
      'expiryTime': expiryTime?.toIso8601String(),
      'tournamentName': tournamentName,
      'competitionName': competitionName,
      'homeScore': homeScore,
      'awayScore': awayScore,
      'city': city,
      'country': country,
      'stadiumName': stadiumName,
      'playingSurface': playingSurface,
      'homeTeamScores': homeTeamScores,
      'awayTeamScores': awayTeamScores,
      'playersOfTheMatch': playersOfTheMatch.map((e) => e.toJson()).toList(),
      'playerMatchStatistics':
          playerMatchStatistics.map((e) => e.toJson()).toList(),
    };
  }

  static DateTime? _tryParseDate(dynamic date) {
    if (date == null) return null;
    try {
      return DateTime.parse(date.toString());
    } catch (_) {
      return null;
    }
  }
}

class PlayerOfTheMatch {
  final String name;
  final String imageUrl;
  final String role;
  final List<String> scores;

  PlayerOfTheMatch({
    this.name = '',
    this.imageUrl = '',
    this.role = '',
    this.scores = const [],
  });

  factory PlayerOfTheMatch.fromJson(Map<String, dynamic> json) {
    return PlayerOfTheMatch(
      name: json['name']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      scores:
          (json['scores'] as List?)?.map((e) => e?.toString() ?? '').toList() ??
              [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'role': role,
      'scores': scores,
    };
  }
}

class PlayerMatchStatistic {
  final String playerKey;
  final String name;
  final String position;
  final String role;
  final String headshotImageUrl;
  final int jerseyNumber;
  final String jerseyImageUrl;
  final String jerseyName;
  final int teamKey;
  final String teamName;
  final String teamShortName;
  final bool isTeamAway;
  final double fantasyPoints;
  final double fantasyPointsRaw;
  final int rank;
  final bool isStarter;
  final bool hasPlayed;
  final bool isAway;
  final List<FantasyPointsBreakdown> fantasyPointsBreakdowns;
  final List<StatsBreakdown> statsBreakdowns;

  PlayerMatchStatistic({
    this.playerKey = '',
    this.name = '',
    this.position = '',
    this.role = '',
    this.headshotImageUrl = '',
    this.jerseyNumber = 0,
    this.jerseyImageUrl = '',
    this.jerseyName = '',
    this.teamKey = 0,
    this.teamName = '',
    this.teamShortName = '',
    this.isTeamAway = false,
    this.fantasyPoints = 0.0,
    this.fantasyPointsRaw = 0.0,
    this.rank = 0,
    this.isStarter = false,
    this.hasPlayed = false,
    this.isAway = false,
    this.fantasyPointsBreakdowns = const [],
    this.statsBreakdowns = const [],
  });

  factory PlayerMatchStatistic.fromJson(Map<String, dynamic> json) {
    return PlayerMatchStatistic(
      playerKey: json['playerKey']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      position: json['position']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      headshotImageUrl: json['headshotImageUrl']?.toString() ?? '',
      jerseyNumber: json['jerseyNumber'] is int ? json['jerseyNumber'] : 0,
      jerseyImageUrl: json['jerseyImageUrl']?.toString() ?? '',
      jerseyName: json['jerseyName']?.toString() ?? '',
      teamKey: json['teamKey'] is int ? json['teamKey'] : 0,
      teamName: json['teamName']?.toString() ?? '',
      teamShortName: json['teamShortName']?.toString() ?? '',
      isTeamAway: json['isTeamAway'] ?? false,
      fantasyPoints: (json['fantasyPoints'] as num?)?.toDouble() ?? 0.0,
      fantasyPointsRaw: (json['fantasyPointsRaw'] as num?)?.toDouble() ?? 0.0,
      rank: json['rank'] is int ? json['rank'] : 0,
      isStarter: json['isStarter'] ?? false,
      hasPlayed: json['hasPlayed'] ?? false,
      isAway: json['isAway'] ?? false,
      fantasyPointsBreakdowns: (json['fantasyPointsBreakdowns'] as List?)
              ?.map((e) =>
                  FantasyPointsBreakdown.fromJson(e ?? <String, dynamic>{}))
              .toList() ??
          [],
      statsBreakdowns: (json['statsBreakdowns'] as List?)
              ?.map((e) => StatsBreakdown.fromJson(e ?? <String, dynamic>{}))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerKey': playerKey,
      'name': name,
      'position': position,
      'role': role,
      'headshotImageUrl': headshotImageUrl,
      'jerseyNumber': jerseyNumber,
      'jerseyImageUrl': jerseyImageUrl,
      'jerseyName': jerseyName,
      'teamKey': teamKey,
      'teamName': teamName,
      'teamShortName': teamShortName,
      'isTeamAway': isTeamAway,
      'fantasyPoints': fantasyPoints,
      'fantasyPointsRaw': fantasyPointsRaw,
      'rank': rank,
      'isStarter': isStarter,
      'hasPlayed': hasPlayed,
      'isAway': isAway,
      'fantasyPointsBreakdowns':
          fantasyPointsBreakdowns.map((e) => e.toJson()).toList(),
      'statsBreakdowns': statsBreakdowns.map((e) => e.toJson()).toList(),
    };
  }
}

class FantasyPointsBreakdown {
  final String playerKey;
  final String fantasyPointType;
  final double statValue;
  final double fantasyPoints;
  final String fantasyPointDescription;

  FantasyPointsBreakdown({
    this.playerKey = '',
    this.fantasyPointType = '',
    this.statValue = 0.0,
    this.fantasyPoints = 0.0,
    this.fantasyPointDescription = '',
  });

  factory FantasyPointsBreakdown.fromJson(Map<String, dynamic> json) {
    return FantasyPointsBreakdown(
      playerKey: json['playerKey']?.toString() ?? '',
      fantasyPointType: json['fantasyPointType']?.toString() ?? '',
      statValue: (json['statValue'] as num?)?.toDouble() ?? 0.0,
      fantasyPoints: (json['fantasyPoints'] as num?)?.toDouble() ?? 0.0,
      fantasyPointDescription:
          json['fantasyPointDescription']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerKey': playerKey,
      'fantasyPointType': fantasyPointType,
      'statValue': statValue,
      'fantasyPoints': fantasyPoints,
      'fantasyPointDescription': fantasyPointDescription,
    };
  }
}

class StatsBreakdown {
  final String playerKey;
  final String statName;
  final double statValue;
  final String? statDescription;

  StatsBreakdown({
    required this.playerKey,
    required this.statName,
    required this.statValue,
    this.statDescription,
  });

  factory StatsBreakdown.fromJson(Map<String, dynamic> json) {
    return StatsBreakdown(
      playerKey: json['playerKey'],
      statName: json['statName'],
      statValue: (json['statValue'] ?? 0).toDouble(),
      statDescription: json['statDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerKey': playerKey,
      'statName': statName,
      'statValue': statValue,
      'statDescription': statDescription,
    };
  }
}
