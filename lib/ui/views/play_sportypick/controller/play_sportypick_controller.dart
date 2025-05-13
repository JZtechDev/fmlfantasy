import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/models/leaderbard_model.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/models/quiz_model.dart';

class PlaySportypickController extends GetxController {
  RxList<QuizModel> quizzes = <QuizModel>[].obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt score = 0.obs;
  int _previousIndex = 0;
  RxInt selectedIndex = 0.obs;
  RxString selectedSport = 'BB'.obs;

  int get previousIndex => _previousIndex;

  set setPreviousIndex(int value) {
    _previousIndex = value;
  }

  @override
  void onInit() {
    super.onInit();
    loadQuizData();
  }

  void loadQuizData() {
    quizzes.value = [
      QuizModel(
        title: 'Knicks Vs Heat',
        question: "Which Team Will Win?",
        options: [
          Options(
            title: 'Knicks',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Heat',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Draw',
            image: null,
          ),
          Options(
            title: 'No Prediction',
            image: null,
          ),
        ],
        correctAnswerIndex: 1,
      ),
      QuizModel(
        title: 'Lakers Vs Celtics',
        question: "Which Team Will Win?",
        options: [
          Options(
            title: 'Lakers',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Celtics',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Draw',
            image: null,
          ),
          Options(
            title: 'No Prediction',
            image: null,
          ),
        ],
        correctAnswerIndex: 1,
      ),
      QuizModel(
        title: 'Knicks Vs Heat',
        question: "Which Team Will Win?",
        options: [
          Options(
            title: 'Knicks',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Heat',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Draw',
            image: null,
          ),
          Options(
            title: 'No Prediction',
            image: null,
          ),
        ],
        correctAnswerIndex: 1,
      ),
      QuizModel(
        title: 'Lakers Vs Celtics',
        question: "Which Team Will Win?",
        options: [
          Options(
            title: 'Lakers',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Celtics',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Draw',
            image: null,
          ),
          Options(
            title: 'No Prediction',
            image: null,
          ),
        ],
        correctAnswerIndex: 1,
      ),
      QuizModel(
        title: 'Knicks Vs Heat',
        question: "Which Team Will Win?",
        options: [
          Options(
            title: 'Knicks',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Heat',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Draw',
            image: null,
          ),
          Options(
            title: 'No Prediction',
            image: null,
          ),
        ],
        correctAnswerIndex: 1,
      ),
      QuizModel(
        title: 'Lakers Vs Celtics',
        question: "Which Team Will Win?",
        options: [
          Options(
            title: 'Lakers',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Celtics',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Draw',
            image: null,
          ),
          Options(
            title: 'No Prediction',
            image: null,
          ),
        ],
        correctAnswerIndex: 1,
      ),
      QuizModel(
        title: 'Knicks Vs Heat',
        question: "Which Team Will Win?",
        options: [
          Options(
            title: 'Knicks',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Heat',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Draw',
            image: null,
          ),
          Options(
            title: 'No Prediction',
            image: null,
          ),
        ],
        correctAnswerIndex: 1,
      ),
      QuizModel(
        title: 'Lakers Vs Celtics',
        question: "Which Team Will Win?",
        options: [
          Options(
            title: 'Lakers',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Celtics',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Draw',
            image: null,
          ),
          Options(
            title: 'No Prediction',
            image: null,
          ),
        ],
        correctAnswerIndex: 1,
      ),
      QuizModel(
        title: 'Knicks Vs Heat',
        question: "Which Team Will Win?",
        options: [
          Options(
            title: 'Knicks',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Heat',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Draw',
            image: null,
          ),
          Options(
            title: 'No Prediction',
            image: null,
          ),
        ],
        correctAnswerIndex: 1,
      ),
      QuizModel(
        title: 'Vipul Vs Shubham',
        question: "Which Team Will Win?",
        options: [
          Options(
            title: 'Vipul',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Shubham',
            image:
                'https://cdn.nba.com/logos/nba/1610612752/primary/D/logo.svg',
          ),
          Options(
            title: 'Draw',
            image: null,
          ),
          Options(
            title: 'No Prediction',
            image: null,
          ),
        ],
        correctAnswerIndex: 1,
      ),
    ];
  }

  void selectAnswer(int questionIndex, int answerIndex) {
    quizzes[questionIndex].selectedAnswerIndex = answerIndex;
    if (quizzes[questionIndex].isCorrect()) {
      score.value++;
    }
    update();
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < quizzes.length - 1) {
      _previousIndex = currentQuestionIndex.value;
      currentQuestionIndex.value++;
    }
    update();
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      _previousIndex = currentQuestionIndex.value;
      currentQuestionIndex.value--;
    }
    update();
  }

  void jumpToQuestion(int index) {
    if (index >= 0 && index < quizzes.length) {
      _previousIndex = currentQuestionIndex.value;
      currentQuestionIndex.value = index;
    }
    update();
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    for (var quiz in quizzes) {
      quiz.selectedAnswerIndex = null;
    }
    update();
  }

  List<SportypickLeaderboardModel> dummyLeaderboard = [
    SportypickLeaderboardModel(name: "John Doe", points: "1250", rank: "1"),
    SportypickLeaderboardModel(name: "Sarah Smith", points: "1180", rank: "2"),
    SportypickLeaderboardModel(name: "Mike Johnson", points: "950", rank: "3"),
    SportypickLeaderboardModel(name: "Emma Wilson", points: "870", rank: "4"),
    SportypickLeaderboardModel(name: "Alex Brown", points: "650", rank: "5"),
  ];
  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  Color getRankColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.grey;
      case 3:
        return Colors.brown;
      default:
        return Colors.black;
    }
  }
}
