class Tournaments {
  String? id;
  String? name;
  List<String>? leagues;
  String? startDate;
  String? endDate;
  num? maxParticipants;
  num? prize;
  num? entryFee;
  double? investment;
  bool? isPublic;
  num? type;
  String? sportCode;
  String? joinCode;
  List<Matches>? matches;
  List<dynamic>? oldTeams;
  List<dynamic>? selectedPlayers;

  Tournaments(
      {this.id,
      this.name,
      this.leagues,
      this.startDate,
      this.endDate,
      this.maxParticipants,
      this.prize,
      this.entryFee,
      this.investment,
      this.isPublic,
      this.type,
      this.sportCode,
      this.matches,
      this.oldTeams,
      this.selectedPlayers});

  Tournaments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    leagues = json['leagues'].cast<String>() ?? [];
    startDate = json['startDate'];
    endDate = json['endDate'];
    maxParticipants = json['maxParticipants'];
    prize = json['prize'];
    entryFee = json['entryFee'];
    investment = json['investment'];
    isPublic = json['isPublic'];
    type = json['type'];
    sportCode = json['sportCode'];
    joinCode = json['joinCode'] ?? '';
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
    oldTeams = json['oldTeams'];
    selectedPlayers = json['selectedPlayers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['leagues'] = leagues;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['maxParticipants'] = maxParticipants;
    data['prize'] = prize;
    data['entryFee'] = entryFee;
    data['investment'] = investment;
    data['isPublic'] = isPublic;
    data['type'] = type;
    data['sportCode'] = sportCode;
    data['joinCode'] = joinCode ?? '';
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    data['oldTeams'] = oldTeams ?? [];
    data['selectedPlayers'] = selectedPlayers ?? [];
    return data;
  }
}

class Matches {
  String? matchCode;
  String? home;
  String? homeAssetCode;
  String? homeShortName;
  String? homeImageUrl;
  String? away;
  String? awayAssetCode;
  String? awayShortName;
  String? awayImageUrl;
  String? status;

  Matches(
      {this.matchCode,
      this.home,
      this.homeAssetCode,
      this.homeShortName,
      this.homeImageUrl,
      this.away,
      this.awayAssetCode,
      this.awayShortName,
      this.awayImageUrl,
      this.status});

  Matches.fromJson(Map<String, dynamic> json) {
    matchCode = json['matchCode'];
    home = json['home'];
    homeAssetCode = json['homeAssetCode'];
    homeShortName = json['homeShortName'];
    homeImageUrl = json['homeImageUrl'];
    away = json['away'];
    awayAssetCode = json['awayAssetCode'];
    awayShortName = json['awayShortName'];
    awayImageUrl = json['awayImageUrl'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchCode'] = matchCode;
    data['home'] = home;
    data['homeAssetCode'] = homeAssetCode;
    data['homeShortName'] = homeShortName;
    data['homeImageUrl'] = homeImageUrl;
    data['away'] = away;
    data['awayAssetCode'] = awayAssetCode;
    data['awayShortName'] = awayShortName;
    data['awayImageUrl'] = awayImageUrl;
    data['status'] = status;
    return data;
  }
}

//New Tournament model

// Event model representing the top-level JSON structure
class TournamentModel {
  final String id;
  final String name;
  final List<String> leagues;
  final DateTime startDate;
  final String endDate;
  final num maxParticipants;
  final num prize;
  final num entryFee;
  final bool isPublic;
  final num type;
  final String sportCode;
  final String? joinCode;
  final List<Match> matches;
  final List<dynamic> selectedPlayers;

  TournamentModel({
    required this.id,
    required this.name,
    required this.leagues,
    required this.startDate,
    required this.endDate,
    required this.maxParticipants,
    required this.prize,
    required this.entryFee,
    required this.isPublic,
    required this.type,
    required this.sportCode,
    this.joinCode,
    required this.matches,
    required this.selectedPlayers,
  });

  // Factory method to create an Event from JSON
  factory TournamentModel.fromJson(Map<String, dynamic> json) {
    return TournamentModel(
      id: json['id'] as String,
      name: json['name'] as String,
      leagues: List<String>.from(json['leagues'] as List),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] as String,
      maxParticipants: json['maxParticipants'] as num,
      prize: json['prize'] as num,
      entryFee: json['entryFee'] as num,
      isPublic: json['isPublic'] as bool,
      type: json['type'] as num,
      sportCode: json['sportCode'] as String,
      joinCode: json['joinCode'] as String?,
      matches: (json['matches'] as List)
          .map((matchJson) => Match.fromJson(matchJson as Map<String, dynamic>))
          .toList(),
      selectedPlayers: json['selectedPlayers'] as List<dynamic>,
    );
  }

  // Convert Event back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'leagues': leagues,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate,
      'maxParticipants': maxParticipants,
      'prize': prize,
      'entryFee': entryFee,
      'isPublic': isPublic,
      'type': type,
      'sportCode': sportCode,
      'joinCode': joinCode,
      'matches': matches.map((match) => match.toJson()).toList(),
      'selectedPlayers': selectedPlayers,
    };
  }
}

// Match model representing the nested matches array
class Match {
  final String matchId;
  final num seqId;
  final DateTime validAt;
  final String home;
  final String away;
  final String competitionId;
  final String competitionName;
  final num seasonYear;
  final DateTime expStartDate;
  final DateTime? expEndDate;
  final String status;
  final bool isLive;
  final bool close;
  final num? homeScore;
  final num? homeHalfTimeScore;
  final String homeImageUrl;
  final String homeAssetCode;
  final String homeShortName;
  final String? awayTeam;
  final num? awayScore;
  final num? awayHalfTimeScore;
  final String awayImageUrl;
  final String awayAssetCode;
  final String awayShortName;
  final num? minutesPlayed;
  final String matchVenue;
  final String matchCity;
  final String matchCountry;
  final String? playerOfTheMatchId;
  final String? playerOfTheMatchAssetCode;
  final String? playerOfTheMatchName;

  Match({
    required this.matchId,
    required this.seqId,
    required this.validAt,
    required this.home,
    required this.away,
    required this.competitionId,
    required this.competitionName,
    required this.seasonYear,
    required this.expStartDate,
    this.expEndDate,
    required this.status,
    required this.isLive,
    required this.close,
    this.homeScore,
    this.homeHalfTimeScore,
    required this.homeImageUrl,
    required this.homeAssetCode,
    required this.homeShortName,
    this.awayTeam,
    this.awayScore,
    this.awayHalfTimeScore,
    required this.awayImageUrl,
    required this.awayAssetCode,
    required this.awayShortName,
    this.minutesPlayed,
    required this.matchVenue,
    required this.matchCity,
    required this.matchCountry,
    this.playerOfTheMatchId,
    this.playerOfTheMatchAssetCode,
    this.playerOfTheMatchName,
  });

  // Factory method to create a Match from JSON
  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      matchId: json['matchId'] as String,
      seqId: json['seqId'] as num,
      validAt: DateTime.parse(json['validAt'] as String),
      home: json['home'] as String,
      away: json['away'] as String,
      competitionId: json['competitionId'] as String,
      competitionName: json['competitionName'] as String,
      seasonYear: json['seasonYear'] as num,
      expStartDate: DateTime.parse(json['expStartDate'] as String),
      expEndDate: json['expEndDate'] != null
          ? DateTime.parse(json['expEndDate'] as String)
          : null,
      status: json['status'] as String,
      isLive: json['isLive'] as bool,
      close: json['close'] as bool,
      homeScore: json['homeScore'] as num?,
      homeHalfTimeScore: json['homeHalfTimeScore'] as num?,
      homeImageUrl: json['homeImageUrl'] as String,
      homeAssetCode: json['homeAssetCode'] as String,
      homeShortName: json['homeShortName'] as String,
      awayTeam: json['awayTeam'] as String?,
      awayScore: json['awayScore'] as num?,
      awayHalfTimeScore: json['awayHalfTimeScore'] as num?,
      awayImageUrl: json['awayImageUrl'] as String,
      awayAssetCode: json['awayAssetCode'] as String,
      awayShortName: json['awayShortName'] as String,
      minutesPlayed: json['minutesPlayed'] as num?,
      matchVenue: json['matchVenue'] as String,
      matchCity: json['matchCity'] as String,
      matchCountry: json['matchCountry'] as String,
      playerOfTheMatchId: json['playerOfTheMatchId'] as String?,
      playerOfTheMatchAssetCode: json['playerOfTheMatchAssetCode'] as String?,
      playerOfTheMatchName: json['playerOfTheMatchName'] as String?,
    );
  }

  // Convert Match back to JSON
  Map<String, dynamic> toJson() {
    return {
      'matchId': matchId,
      'seqId': seqId,
      'validAt': validAt.toIso8601String(),
      'home': home,
      'away': away,
      'competitionId': competitionId,
      'competitionName': competitionName,
      'seasonYear': seasonYear,
      'expStartDate': expStartDate.toIso8601String(),
      'expEndDate': expEndDate?.toIso8601String(),
      'status': status,
      'isLive': isLive,
      'close': close,
      'homeScore': homeScore,
      'homeHalfTimeScore': homeHalfTimeScore,
      'homeImageUrl': homeImageUrl,
      'homeAssetCode': homeAssetCode,
      'homeShortName': homeShortName,
      'awayTeam': awayTeam,
      'awayScore': awayScore,
      'awayHalfTimeScore': awayHalfTimeScore,
      'awayImageUrl': awayImageUrl,
      'awayAssetCode': awayAssetCode,
      'awayShortName': awayShortName,
      'minutesPlayed': minutesPlayed,
      'matchVenue': matchVenue,
      'matchCity': matchCity,
      'matchCountry': matchCountry,
      'playerOfTheMatchId': playerOfTheMatchId,
      'playerOfTheMatchAssetCode': playerOfTheMatchAssetCode,
      'playerOfTheMatchName': playerOfTheMatchName,
    };
  }
}
