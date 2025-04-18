import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/ui/views/account_details/account_details_view.dart';
import 'package:fmlfantasy/ui/views/authentication/otp_view.dart';
import 'package:fmlfantasy/ui/views/authentication/success_view.dart';
import 'package:fmlfantasy/ui/views/authentication/widgtes/auth%20forms/confirm_password_view.dart';
import 'package:fmlfantasy/ui/views/bull_player/bull_player_view.dart';
import 'package:fmlfantasy/ui/views/create_contest/create_contest_view.dart';
import 'package:fmlfantasy/ui/views/create_contest/private_tournament_view.dart';
import 'package:fmlfantasy/ui/views/create_contest/widgets/private_contest_success_view.dart';
import 'package:fmlfantasy/ui/views/dashboard/dashboard_view.dart';
import 'package:fmlfantasy/ui/views/friends/friends_view.dart';
import 'package:fmlfantasy/ui/views/home/home_view.dart';
import 'package:fmlfantasy/ui/views/how_it_works/how_it_works_view.dart';
import 'package:fmlfantasy/ui/views/loto/loto_view.dart';
import 'package:fmlfantasy/ui/views/match_center/match_center_inner_view.dart';
import 'package:fmlfantasy/ui/views/match_center/match_center_view.dart';
import 'package:fmlfantasy/ui/views/match_fixtures/match_fictures_view.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard/monthly_leaderboard.dart';
import 'package:fmlfantasy/ui/views/my_contest/my_contest_view.dart';
import 'package:fmlfantasy/ui/views/my_draws/my_draws_view.dart';
import 'package:fmlfantasy/ui/views/my_teams/my_teams_view.dart';
import 'package:fmlfantasy/ui/views/new_auth/login_view.dart';
import 'package:fmlfantasy/ui/views/new_auth/register_view.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/play_sportypick_view.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/sporty_pick_response_view.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/players_stats_view.dart';
import 'package:fmlfantasy/ui/views/players/players_view.dart';
import 'package:fmlfantasy/ui/views/select_players/select_player_view.dart';
import 'package:fmlfantasy/ui/views/splash_screen/splash_view.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/sport_pick_inner_leaderboard.dart';
import 'package:fmlfantasy/ui/views/sport_pick_leaderboard/sport_pick_leaderboard.dart';
import 'package:fmlfantasy/ui/views/statement/statement_view.dart';
import 'package:fmlfantasy/ui/views/team_name/team_name.dart';
import 'package:fmlfantasy/ui/views/teams/teams_view.dart';
import 'package:get/get.dart';
import '../../ui/views/profile/profile_view.dart';

class AppPages {
  static const String initial = AppRoutes.splashview;

  static final routes = [
    GetPage(
      name: AppRoutes.splashview,
      page: () => const SplashVIew(),
      transition: Transition.noTransition,
    ),
    // GetPage(
    //   name: AppRoutes.authentication,
    //   page: () => const NewAuthView(),
    // ),
    GetPage(name: AppRoutes.otp, page: () => const OtpView()),
    GetPage(name: AppRoutes.registerUser, page: () => const RegisterView()),
    GetPage(name: AppRoutes.loginView, page: () => const LoginView()),
    GetPage(name: AppRoutes.succesView, page: () => const SuccessView()),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
    ),
    GetPage(
        name: AppRoutes.selectPlayers, page: () => const SelectPlayerView()),
    GetPage(name: AppRoutes.bullPlayer, page: () => const BullPlayerView()),
    GetPage(name: AppRoutes.teamName, page: () => const TeamNameView()),
    GetPage(name: AppRoutes.myTeams, page: () => const MyTeamsView()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileView()),
    GetPage(
        name: AppRoutes.leaderboard, page: () => const MonthlyLeaderboard()),
    GetPage(
        name: AppRoutes.matchCenter,
        page: () => const MatchCenter(),
        transition: Transition.fadeIn),
    GetPage(
      name: AppRoutes.matchCenterInner,
      page: () => const MatchCenterInnerView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: AppRoutes.howItWorks,
      page: () => const HowItWorksView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
        name: AppRoutes.createContest, page: () => const CreateContestView()),
    GetPage(
        name: AppRoutes.privateContestSuccessView,
        page: () => const PrivateContestSuccessView()),
    GetPage(name: AppRoutes.lotoView, page: () => const CreateLotoView()),
    GetPage(
        name: AppRoutes.matchFixturesView,
        page: () => const MatchFixturesView()),
    GetPage(name: AppRoutes.myDrawsView, page: () => const MyDrawsView()),
    GetPage(
        name: AppRoutes.sportPickLeaderboard,
        page: () => const SportPickLeaderboard()),
    GetPage(
        name: AppRoutes.sportPickInnerLeaderboard,
        page: () => const SportPickInnerLeaderboard()),
    GetPage(
        name: AppRoutes.confirmPasswordView,
        page: () => const ConfirmPasswordView()),
    GetPage(name: AppRoutes.myContestView, page: () => const MyContestView()),
    GetPage(
        name: AppRoutes.privateTournamentView,
        page: () => const PrivateTournamentView()),
    GetPage(
        name: AppRoutes.accountDetailsView,
        page: () => const AccountDetailsView()),
    GetPage(name: AppRoutes.statementView, page: () => const StatementView()),
    GetPage(name: AppRoutes.friendsView, page: () => const FriendsView()),
    GetPage(
        name: AppRoutes.playersStatsView, page: () => const PlayersStatsView()),
    GetPage(name: AppRoutes.dashboardView, page: () => const DashboardView()),
    GetPage(name: AppRoutes.playersView, page: () => const PlayersView()),
    GetPage(name: AppRoutes.teamsView, page: () => const TeamsView()),
    GetPage(
        name: AppRoutes.playSportyPick, page: () => const PlaySportypickView()),
    GetPage(
        name: AppRoutes.playSportyResponses,
        page: () => const PlaySportyResponses()),
  ];
}
