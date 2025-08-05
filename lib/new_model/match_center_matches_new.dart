class MatchCenterMatches {
  final String? matchKey;
  final String? matchShortName;
  final String? matchSubTitle;
  final DateTime? matchStartDate;
  final String? matchStatus;
  final String? matchFormat;
  final String? homeTeamName;
  final String? homeTeamImageUrl;
  final String? awayTeamName;
  final String? awayTeamImageUrl;

  MatchCenterMatches({
    this.matchKey,
    this.matchShortName,
    this.matchSubTitle,
    this.matchStartDate,
    this.matchStatus,
    this.matchFormat,
    this.homeTeamName,
    this.homeTeamImageUrl,
    this.awayTeamName,
    this.awayTeamImageUrl,
  });

  factory MatchCenterMatches.fromJson(Map<String, dynamic> json) {
    return MatchCenterMatches(
      matchKey: json['matchKey'] ?? '',
      matchShortName: json['matchShortName'] ?? '',
      matchSubTitle: json['matchSubTitle'] ?? '',
      matchStartDate: DateTime.parse(json['matchStartDate'] ?? ''),
      matchStatus: json['matchStatus'] ?? '',
      matchFormat: json['matchFormat'] ?? '',
      homeTeamName: json['homeTeamName'] ?? '',
      homeTeamImageUrl: json['homeTeamImageUrl'] ?? '',
      awayTeamName: json['awayTeamName'] ?? '',
      awayTeamImageUrl: json['awayTeamImageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'matchKey': matchKey,
      'matchShortName': matchShortName,
      'matchSubTitle': matchSubTitle,
      'matchStartDate': matchStartDate?.toIso8601String(),
      'matchStatus': matchStatus,
      'matchFormat': matchFormat,
      'homeTeamName': homeTeamName,
      'homeTeamImageUrl': homeTeamImageUrl,
      'awayTeamName': awayTeamName,
      'awayTeamImageUrl': awayTeamImageUrl,
    };
  }
}
