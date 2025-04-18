class SportPickInnerSlideodel {
  String imageUrl;
  String rank;
  String name;
  String team;
  SportPickInnerSlideodel(
      {required this.imageUrl,
      required this.rank,
      required this.name,
      required this.team});
}

class SportPickInnerLeaderModel {
  String rank;
  String awardImageUrl;
  String gold;
  String goldSub;
  String points;
  String pointSub;
  String price;

  SportPickInnerLeaderModel(
      {required this.rank,
      required this.awardImageUrl,
      required this.gold,
      required this.goldSub,
      required this.points,
      required this.pointSub,
      required this.price});
}
