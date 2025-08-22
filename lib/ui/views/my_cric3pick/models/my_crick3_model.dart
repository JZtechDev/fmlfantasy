class MatchResult {
  final String tournamentName;
  final DateTime matchDateTime;
  final double earnings;
  final String teamA;
  final String teamB;
  final String winner;
  final bool isWinner;
  final List<DummyPlayers> winningCombination;
  final List<DummyPlayers> yourCric3Picks;

  MatchResult(
      {required this.tournamentName,
      required this.matchDateTime,
      required this.earnings,
      required this.teamA,
      required this.teamB,
      required this.winner,
      required this.isWinner,
      required this.winningCombination,
      required this.yourCric3Picks});

  // From JSON
  factory MatchResult.fromJson(Map<String, dynamic> json) {
    return MatchResult(
        tournamentName: json['tournamentName'],
        matchDateTime: DateTime.parse(json['matchDateTime']),
        earnings: (json['earnings'] as num).toDouble(),
        teamA: json['teamA'],
        teamB: json['teamB'],
        winner: json['winner'],
        isWinner: json['isWinner'],
        winningCombination: json['winningCombination'],
        yourCric3Picks: json['yourPicks']);
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'tournamentName': tournamentName,
      'matchDateTime': matchDateTime.toIso8601String(),
      'earnings': earnings,
      'teamA': teamA,
      'teamB': teamB,
      'winner': winner,
      'isWinner': isWinner,
    };
  }
}

class DummyPlayers {
  final String name;
  final String position;
  final String rank;
  final String headshot;

  DummyPlayers(this.headshot, this.position, this.rank, this.name);
}
