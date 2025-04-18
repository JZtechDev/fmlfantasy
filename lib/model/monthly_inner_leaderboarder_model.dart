

class MonthlyInnerLeaderboarderModel{
  final String homeTeamName;
  final String homeTeamImageUrl;
  final String awayTeamName;
  final String awayTeamImageUrl;

  /// Top Players
  final String rank;
  final String playerName;
  final String playerImageUrl;
  final String playerPoints;


  MonthlyInnerLeaderboarderModel(this.homeTeamName, this.homeTeamImageUrl, this.awayTeamName, this.awayTeamImageUrl, this.rank, this.playerName, this.playerImageUrl, this.playerPoints);

}