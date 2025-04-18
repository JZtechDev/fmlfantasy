class HowItWorkModel {
  String title;
  String imagePath;
  List<InnerTitle> innerTitle;
  HowItWorkModel(
      {required this.title, required this.innerTitle, required this.imagePath});
}

class InnerTitle {
  String subtitle;
  String score;
  InnerTitle({required this.subtitle, required this.score});
}