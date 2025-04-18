import 'package:fmlfantasy/model/match_center_inner_model.dart';

class InnerMatchCenterModel {
  InnerMatchCenterModel({
    required this.playersBreakDown,
    required this.highlights,
    required this.teamATop1BatsmanName,
    required this.teamATop1BatsmanRuns,
    required this.teamATop2BatsmanName,
    required this.teamATop2BatsmanRuns,
    required this.teamATop1BowlerName,
    required this.teamATop1BowlerWickets,
    required this.teamATop2BowlerName,
    required this.teamATop2BowlerWickets,
    required this.teamBTop1BatsmanName,
    required this.teamBTop1BatsmanRuns,
    required this.teamBTop2BatsmanName,
    required this.teamBTop2BatsmanRuns,
    required this.teamBTop1BowlerName,
    required this.teamBTop1BowlerWickets,
    required this.teamBTop2BowlerName,
    required this.teamBTop2BowlerWickets,
    required this.sportCode,
    required this.competitionId,
    required this.competitionCode,
    required this.competitionName,
    required this.season,
    this.matchId,
    this.externalMatchId,
    required this.expStartDate,
    required this.dayOfWeek,
    required this.expectedStartDate,
    required this.expectedStartDateTime,
    required this.status,
    required this.isLive,
    required this.close,
    required this.isNationalMatch,
    required this.teamACode,
    required this.teamAName,
    required this.teamAShortName,
    required this.teamAImageUrl,
    required this.teamBCode,
    required this.teamBName,
    required this.teamBShortName,
    required this.teamBImageUrl,
    required this.teamAScore,
    required this.teamBScore,
    required this.teamAWickets,
    required this.teamBWickets,
    required this.teamAOvers,
    required this.teamBOvers,
    required this.matchResultDescription,
    required this.matchVenue,
    required this.matchCity,
    required this.matchCountry,
    required this.winnerId,
    required this.winnerName,
    required this.winnerAssetCode,
    this.playerOfTheMatchId,
    this.playerOfTheMatchAssetCode,
    this.playerOfTheMatchName,
    required this.topPlayers,
    this.periodScore,
  });

  late final List<PlayersBreakDown> playersBreakDown;
  late final Highlights highlights;
  late final String? teamATop1BatsmanName;
  late final double? teamATop1BatsmanRuns;
  late final String? teamATop2BatsmanName;
  late final double? teamATop2BatsmanRuns;
  late final String? teamATop1BowlerName;
  late final double? teamATop1BowlerWickets;
  late final String? teamATop2BowlerName;
  late final double? teamATop2BowlerWickets;
  late final String? teamBTop1BatsmanName;
  late final double? teamBTop1BatsmanRuns;
  late final String? teamBTop2BatsmanName;
  late final double? teamBTop2BatsmanRuns;
  late final String? teamBTop1BowlerName;
  late final double? teamBTop1BowlerWickets;
  late final String? teamBTop2BowlerName;
  late final double? teamBTop2BowlerWickets;
  late final String? sportCode;
  late final String? competitionId;
  late final String? competitionCode;
  late final String? competitionName;
  late final String? season;
  late final Null matchId;
  late final Null externalMatchId;
  late final String? expStartDate;
  late final String? dayOfWeek;
  late final String? expectedStartDate;
  late final int? expectedStartDateTime;
  late final String? status;
  late final bool isLive;
  late final bool close;
  late final bool isNationalMatch;
  late final String? teamACode;
  late final String? teamAName;
  late final String? teamAShortName;
  late final String? teamAImageUrl;
  late final String? teamBCode;
  late final String? teamBName;
  late final String? teamBShortName;
  late final String? teamBImageUrl;
  late final dynamic teamAScore;
  late final dynamic teamBScore;
  late final dynamic teamAWickets;
  late final dynamic teamBWickets;
  late final double? teamAOvers;
  late final double? teamBOvers;
  late final String? matchResultDescription;
  late final String? matchVenue;
  late final String? matchCity;
  late final String? matchCountry;
  late final String? winnerId;
  late final String? winnerName;
  late final String? winnerAssetCode;
  late final Null playerOfTheMatchId;
  late final Null playerOfTheMatchAssetCode;
  late final String? playerOfTheMatchName;
  late final List<TopPlayers> topPlayers;
  late final List<PeriodScore>? periodScore;

  InnerMatchCenterModel.fromJson(Map<String, dynamic> json) {
    playersBreakDown = List.from(json['playersBreakDown'])
        .map((e) => PlayersBreakDown.fromJson(e))
        .toList();
    highlights = Highlights.fromJson(json['highlights']);
    teamATop1BatsmanName = json['teamATop1BatsmanName'];
    teamATop1BatsmanRuns = json['teamATop1BatsmanRuns'];
    teamATop2BatsmanName = json['teamATop2BatsmanName'];
    teamATop2BatsmanRuns = json['teamATop2BatsmanRuns'];
    teamATop1BowlerName = json['teamATop1BowlerName'];
    teamATop1BowlerWickets = json['teamATop1BowlerWickets'];
    teamATop2BowlerName = json['teamATop2BowlerName'];
    teamATop2BowlerWickets = json['teamATop2BowlerWickets'];
    teamBTop1BatsmanName = json['teamBTop1BatsmanName'];
    teamBTop1BatsmanRuns = json['teamBTop1BatsmanRuns'];
    teamBTop2BatsmanName = json['teamBTop2BatsmanName'];
    teamBTop2BatsmanRuns = json['teamBTop2BatsmanRuns'];
    teamBTop1BowlerName = json['teamBTop1BowlerName'];
    teamBTop1BowlerWickets = json['teamBTop1BowlerWickets'];
    teamBTop2BowlerName = json['teamBTop2BowlerName'];
    teamBTop2BowlerWickets = json['teamBTop2BowlerWickets'];
    sportCode = json['sportCode'];
    competitionId = json['competitionId'];
    competitionCode = json['competitionCode'];
    competitionName = json['competitionName'];
    season = json['season'];
    matchId = null;
    externalMatchId = null;
    expStartDate = json['expStartDate'];
    dayOfWeek = json['dayOfWeek'];
    expectedStartDate = json['expectedStartDate'];
    expectedStartDateTime = json['expectedStartDateTime'];
    status = json['status'];
    isLive = json['isLive'];
    close = json['close'];
    isNationalMatch = json['isNationalMatch'];
    teamACode = json['teamACode'];
    teamAName = json['teamAName'];
    teamAShortName = json['teamAShortName'];
    teamAImageUrl = json['teamAImageUrl'];
    teamBCode = json['teamBCode'];
    teamBName = json['teamBName'];
    teamBShortName = json['teamBShortName'];
    teamBImageUrl = json['teamBImageUrl'];
    teamAScore = json['teamAScore'];
    teamBScore = json['teamBScore'];
    teamAWickets = json['teamAWickets'];
    teamBWickets = json['teamBWickets'];
    teamAOvers = json['teamAOvers'];
    teamBOvers = json['teamBOvers'];
    matchResultDescription = json['matchResultDescription'];
    matchVenue = json['matchVenue'];
    matchCity = json['matchCity'];
    matchCountry = json['matchCountry'];
    winnerId = json['winnerId'];
    winnerName = json['winnerName'];
    winnerAssetCode = json['winnerAssetCode'];
    playerOfTheMatchId = null;
    playerOfTheMatchAssetCode = null;
    playerOfTheMatchName = json['playerOfTheMatchName'];
    topPlayers = List.from(json['topPlayers'])
        .map((e) => TopPlayers.fromJson(e))
        .toList();
    periodScore = json['periodScores'] != null
        ? List.from(json['periodScores'])
            .map((e) => PeriodScore.fromJson(e))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['playersBreakDown'] = playersBreakDown.map((e) => e.toJson()).toList();
    data['highlights'] = highlights.toJson();
    data['teamATop1BatsmanName'] = teamATop1BatsmanName;
    data['teamATop1BatsmanRuns'] = teamATop1BatsmanRuns;
    data['teamATop2BatsmanName'] = teamATop2BatsmanName;
    data['teamATop2BatsmanRuns'] = teamATop2BatsmanRuns;
    data['teamATop1BowlerName'] = teamATop1BowlerName;
    data['teamATop1BowlerWickets'] = teamATop1BowlerWickets;
    data['teamATop2BowlerName'] = teamATop2BowlerName;
    data['teamATop2BowlerWickets'] = teamATop2BowlerWickets;
    data['teamBTop1BatsmanName'] = teamBTop1BatsmanName;
    data['teamBTop1BatsmanRuns'] = teamBTop1BatsmanRuns;
    data['teamBTop2BatsmanName'] = teamBTop2BatsmanName;
    data['teamBTop2BatsmanRuns'] = teamBTop2BatsmanRuns;
    data['teamBTop1BowlerName'] = teamBTop1BowlerName;
    data['teamBTop1BowlerWickets'] = teamBTop1BowlerWickets;
    data['teamBTop2BowlerName'] = teamBTop2BowlerName;
    data['teamBTop2BowlerWickets'] = teamBTop2BowlerWickets;
    data['sportCode'] = sportCode;
    data['competitionId'] = competitionId;
    data['competitionCode'] = competitionCode;
    data['competitionName'] = competitionName;
    data['season'] = season;
    data['matchId'] = matchId;
    data['externalMatchId'] = externalMatchId;
    data['expStartDate'] = expStartDate;
    data['dayOfWeek'] = dayOfWeek;
    data['expectedStartDate'] = expectedStartDate;
    data['expectedStartDateTime'] = expectedStartDateTime;
    data['status'] = status;
    data['isLive'] = isLive;
    data['close'] = close;
    data['isNationalMatch'] = isNationalMatch;
    data['teamACode'] = teamACode;
    data['teamAName'] = teamAName;
    data['teamAShortName'] = teamAShortName;
    data['teamAImageUrl'] = teamAImageUrl;
    data['teamBCode'] = teamBCode;
    data['teamBName'] = teamBName;
    data['teamBShortName'] = teamBShortName;
    data['teamBImageUrl'] = teamBImageUrl;
    data['teamAScore'] = teamAScore;
    data['teamBScore'] = teamBScore;
    data['teamAWickets'] = teamAWickets;
    data['teamBWickets'] = teamBWickets;
    data['teamAOvers'] = teamAOvers;
    data['teamBOvers'] = teamBOvers;
    data['matchResultDescription'] = matchResultDescription;
    data['matchVenue'] = matchVenue;
    data['matchCity'] = matchCity;
    data['matchCountry'] = matchCountry;
    data['winnerId'] = winnerId;
    data['winnerName'] = winnerName;
    data['winnerAssetCode'] = winnerAssetCode;
    data['playerOfTheMatchId'] = playerOfTheMatchId;
    data['playerOfTheMatchAssetCode'] = playerOfTheMatchAssetCode;
    data['playerOfTheMatchName'] = playerOfTheMatchName;
    data['topPlayers'] = topPlayers.map((e) => e.toJson()).toList();
    data['periodScores'] = periodScore!.map((e) => e.toJson()).toList();
    return data;
  }
}
