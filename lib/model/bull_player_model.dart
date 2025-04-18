
class BullPlayerModel {
  String? playerTeam;
  String? playerName;
  String? playerImage;
  String? playerPosition;
  String? playerNumber;

  
BullPlayerModel({
  this.playerTeam,
  this.playerName,
  this.playerImage,
  this.playerPosition,
  this.playerNumber,
  });

}

class PlayerDetailModel{

  String? playerName;
  String ? playerTeamname;
  String? playerImage;
  String? playerPosition;
  int ? playerNumber;
  

  PlayerDetailModel({this.playerName, this.playerTeamname, this.playerImage, this.playerNumber, this.playerPosition});

}

class TeamPlayers {
  String name;
  bool isBull;

  TeamPlayers({required this.name, this.isBull = false});
}
