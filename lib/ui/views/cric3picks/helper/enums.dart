enum PlayerPosition {
  batsman,
  bowler,
  allRounder,
  wicketKeeper,
}

extension PlayerPositionImage on PlayerPosition {
  String get imagePath {
    switch (this) {
      case PlayerPosition.batsman:
        return 'assets/images/batsman.png';
      case PlayerPosition.bowler:
        return 'assets/images/bowler.png';
      case PlayerPosition.allRounder:
        return 'assets/images/all-rounder.png';
      case PlayerPosition.wicketKeeper:
        return 'assets/images/wicket-keeper.png';
    }
  }
}

PlayerPosition getPlayerPositionFromString(String position) {
  switch (position.toLowerCase()) {
    case 'batsman':
      return PlayerPosition.batsman;
    case 'bowler':
      return PlayerPosition.bowler;
    case 'all rounder':
      return PlayerPosition.allRounder;
    case 'wicket keeper':
      return PlayerPosition.wicketKeeper;
    default:
      throw Exception('Unknown position: $position');
  }
}
