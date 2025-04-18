
class Tournaments {
  String? id;
  String? name;
  List<String>? leagues;
  String? startDate;
  String? endDate;
  int? maxParticipants;
  double? prize;
  double? entryFee;
  double? investment;
  bool? isPublic;
  int? type;
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
