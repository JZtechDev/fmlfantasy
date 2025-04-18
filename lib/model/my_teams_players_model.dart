class MyTeamPlayersModel {
  String? assetCode;
  String? name;
  String? team;
  String? teamShortName;
  String? imageUrl;
  String? jerseyImageUrl;
  String? jerseyNumber;
  String? position;
  bool? isCaptain;
  double? weight;
  double? investment;

  MyTeamPlayersModel(
      {this.assetCode,
      this.name,
      this.team,
      this.teamShortName,
      this.imageUrl,
      this.jerseyImageUrl,
      this.jerseyNumber,
      this.weight,
      this.position,
      this.investment,
      this.isCaptain});

  MyTeamPlayersModel.fromJson(Map<String, dynamic> json) {
    assetCode = json['assetCode'];
    name = json['name'];
    team = json['team'];
    teamShortName = json['teamShortName'];
    imageUrl = json['imageUrl'];
    jerseyImageUrl = json['jerseyImageUrl'];
    jerseyNumber = json['jerseyNumber'];
    weight = json['weight'];
    position = json['position'];
    investment = json['investment'];
    isCaptain = json['isCaptain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetCode'] = assetCode;
    data['name'] = name;
    data['team'] = team;
    data['teamShortName'] = teamShortName;
    data['jerseyImageUrl'] = jerseyImageUrl;
    data['jerseyNumber'] = jerseyNumber;
    data['imageUrl'] = imageUrl;
    data['weight'] = weight;
    data['position'] = position;
    data['investment'] = investment;
    data['isCaptain'] = isCaptain;
    return data;
  }

  static void clear() {}
}
