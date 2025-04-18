class QuizModel {
  final String title;
  final String question;
  final List<Options> options;
  final int correctAnswerIndex;
  int? selectedAnswerIndex;

  QuizModel({
    required this.title,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.selectedAnswerIndex,
  });

  bool isCorrect() => selectedAnswerIndex == correctAnswerIndex;

  Map<String, dynamic> toJson() => {
        'title': title,
        'question': question,
        'options': options.map((option) => option.toJson()).toList(),
        'correctAnswerIndex': correctAnswerIndex,
        'selectedAnswerIndex': selectedAnswerIndex,
      };

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        title: json['title'],
        question: json['question'],
        options: (json['options'] as List)
            .map((optionJson) => Options.fromJson(optionJson))
            .toList(),
        correctAnswerIndex: json['correctAnswerIndex'],
        selectedAnswerIndex: json['selectedAnswerIndex'],
      );
}

class Options {
  final String title;
  final String? image;

  Options({required this.title, this.image});

  Map<String, dynamic> toJson() => {
        'title': title,
        'image': image,
      };

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        title: json['title'],
        image: json['image'],
      );
}
