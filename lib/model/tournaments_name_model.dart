class TournamentsName {
  String? assetCode;
  String? aquaTicker;
  String? competitionName;
  String? competitionType;
  String? categoryName;
  String? gender;
  String? countryCode;
  String? lastUpdatedAt;
  Season? season;

  TournamentsName(
      {this.assetCode,
      this.aquaTicker,
      this.competitionName,
      this.competitionType,
      this.categoryName,
      this.gender,
      this.countryCode,
      this.lastUpdatedAt,
      this.season});

  TournamentsName.fromJson(Map<String, dynamic> json) {
    assetCode = json['assetCode'];
    aquaTicker = json['aquaTicker'];
    competitionName = json['competitionName'];
    competitionType = json['competitionType'];
    categoryName = json['categoryName'];
    gender = json['gender'];
    countryCode = json['countryCode'];
    lastUpdatedAt = json['lastUpdatedAt'];
    season =
        json['season'] != null ? Season.fromJson(json['season']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetCode'] = assetCode;
    data['aquaTicker'] = aquaTicker;
    data['competitionName'] = competitionName;
    data['competitionType'] = competitionType;
    data['categoryName'] = categoryName;
    data['gender'] = gender;
    data['countryCode'] = countryCode;
    data['lastUpdatedAt'] = lastUpdatedAt;
    if (season != null) {
      data['season'] = season!.toJson();
    }
    return data;
  }
}

class Season {
  String? id;
  String? name;
  String? startDate;
  String? endDate;
  String? year;

  Season({this.id, this.name, this.startDate, this.endDate, this.year});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['year'] = year;
    return data;
  }
}

//Dropdown Matches Model


class Matches {
  String? matchKey;
  String? name;
  String? start;
  String? end;

  Matches({this.matchKey, this.name, this.start, this.end});

  Matches.fromJson(Map<String, dynamic> json) {
    matchKey = json['matchKey'];
    name = json['name'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchKey'] = matchKey;
    data['name'] = name;
    data['start'] = start;
    data['end'] = end;
    return data;
  }
}