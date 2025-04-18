import 'package:get/get_navigation/src/root/internacionalization.dart';

class CustomTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'es': es,
      };
}

final Map<String, String> en = {
  // global
  'public': 'Public',
  'private': 'Private',
  'search': 'Search',
  'continue': 'Continue',
  'searchTeams': 'Search Teams',
  'publicButton': 'Public',
  'privateButton': 'Private',
  // Authenticaiton
  'onBoardingLabel': 'Your premier destination for all things fantasy sports',
  'loginContainerLabel': 'Login to get started',
  'signUpContainer': 'Experience the Thrill',
  'loginDescription':
      'Experience the thrill of daily fantasy sports with Fantasy Bulls',
  'signUpDescription':
      'Not yet Signed up on Fantasy Bulls? Sign up now and Start your game',
  'rememberMe': 'Remember Me',
  'googleAuthentication': 'Continue with Google',
  'forgetPassword': 'Forget Password?',
  'iagree': 'I Agree to the',
  'terms': 'Terms & Conditions',
  // Home Screen
  'publicTournament': 'Public Tournament',
  'privateTournament': 'Private Tournament',
  // select Player
  'selectPlayer': 'Select Players',
  'filter': 'Filters',
  'clearAll': 'Clear All',
  'salary': 'Salary',
  'PlayerSelected': 'Player Selected',
  'prizePool': 'Prize Pool',
  'joinfor': 'Join for',
  'matchCenterIn': 'Match Starts In',
  //// Error Select Player
  'errormax': 'Maximum number of selections reached or insufficient points',
  // Bull Player
  'selectedBullPlayer': 'Select Bull Player',
  'bullPlayer': 'Bull Player',
  'preview': 'Preview',
  // Team name
  'makeItOfficial': 'Make it Official',
  'namefantasy': 'Name Your Fantasy Powerhouse',
  'saveAndContinue': 'Save and Continue',
  // Profile
  'preferences': 'Preferences',
  'acountDetails': 'Account Details',
  'statement': 'Statement',
  'settings': 'Settings',
  'privacyAndPolicy': 'Privacy And Policy',
  // Match Center
  'servererror': 'Server Error',
  'notournamentavailable.': 'No tournaments available.',
  // Match Center Inner
  'erroroccurred': 'An error occurred',
  'nodataavailable': 'No data available',
  'playerOfTheMatch': 'Player Of The Match', // CR
  'notAvailable': 'No Data Available',
  'viewInnings': 'View Innings',
  'statistics': 'Statistics',
  'points': 'Points',
  'value': 'Value',
  'topPlayers': 'Top Players',
  'playerName': 'Player Name', // skeleton
  'playerPosition': 'Player Position',
  // LeaderBoard
  'leaderBoard': 'LeaderBoard',
  'name': 'Name',
  'winnings': 'Winnings',
  'noMatchesfound': 'No Matches found',
  // How It Works
  'howItWorks': 'How It Works',
  'chooseYourSports': 'Choose\nYour Sports',
  'Paragraph1':
      'Select from a variety of sports including American football, basketball, soccer, cricket, and more',
  'draftYourTeam': 'Draft Your\nTeam',
  'Paragraph2':
      'Use your knowledge and expertise to draft the best team possible within the salary cap',
  'playScoreWin!': 'Play, Score,\nWin!',
  'Paragraph3':
      'Watch as your players compete and earn points based on their performance. The better they play, the more points you score!',
  'cashInYourPrize': 'Cash In\nYour Prize',
  'Paragraph4':
      'Win cash prizes based on your team’s performance and climb the leaderboard to claim your spot among the fantasy elite',
  'gamePlayRules': 'GamePlay Rules',
  'selectyoursport': 'Select your sport',
  'tackleWonByAnyPosition': 'Tackle Won By Any Position',
  'penaltySavedByGoalkeeper': 'Penalty Saved By Goalkeeper',
  'cleanSheet': 'Clean Sheet (Minimum 55 mins) By Defender, Goalkeeper',
  'inStarting11ByAnyPosition': 'In Starting 11 By Any Position',
  'subOnByAnyPosition': 'Sub On By Any Position',
  'subOFFByGoalkeeper': 'Sub OFF By Goalkeeper',
  'OwnGoalByAnyPosition': 'Own Goal By Any Position',
  'YellowCardByAnyPosition': 'Yellow Card By Any Position',
  'redcardByAnyposition': 'Red card By Any position',

  'weUseNegativePoints': 'We Use Negative Points',

  //
  'attacking': 'Attacking',
  'team': 'Team',
  'defense': 'Defense',
  'discipline': 'Discipline',
  'goalByForward': 'Goal By Forward',
  'goalByMidfielder': 'Goal By Midfielder',
  'goalByDefender': 'Goal By Defender',
  'goalByGoalkeeper': 'Goal By Goalkeeper',
  'assistByAnyPosition': 'Assist By Any Position',
  'shotTargetByAnyPosition': 'Shot On Target By Any Position',
  'chanceCreatedByAnyPosition': 'Chance Created By Any Position',
  'passesCompletedByAnyPosition': '10 Passes Completed By Any Position',
  'penaltyMissedByAnyPosition': 'Penalty Missed By Any Position',
  'interceptionWonByAnyPosition': 'Interception Won By Any Position',
  'goalSavedByGoalkeeper': 'Goal Saved By Goalkeeper',
  'goalConcededByDefenderGoalkeeper': 'Goal Conceded By Defender, Goalkeeper',

  //basketball
  'allPlayers': 'All Players',
  'threePointsFieldGoal': 'Three Points Field Goal',
  'twoPointsFieldGoal': 'Two Points Field Goal',
  'threeThrowsMade': 'Three Throws Made',
  'Rebounds': 'Rebounds',
  'Assists': 'Assists',
  'Blocked Shots': 'Blocked Shots',
  'Steals': 'Steals',
  'Turnovers': 'Turnovers',
  'weUseFractionalPoints': 'We Use Fractional Points',

  //Cricket
  'Batting': 'Batting',
  'Bowling': 'Bowling',
  'Fielding': 'Fielding',
  'Run': 'Run',
  'BoundaryBonus': 'Boundary Bonus',
  'SixBonus': 'Six Bonus',
  '30Run': '30 Run',
  'HalfCentury': 'Half Century',
  'Century': 'Century',
  'DoubleCentury': 'Double Century',
  'Dismissalforaduck': 'Dismissal for a duck',
  'Above170runsper100balls': 'Above 170 runs per 100 balls',
  'S.RBetween150-170runsper100balls': 'S.R Between 150-170 runs per 100 balls',
  'S.RBetween130-150runsper100Balls': 'S.R Between 130-150 runs per 100 Balls',
  'S.RBetween90-80runsper100balls': 'S.R Between 90-80 runs per 100 balls',
  'S.RBetween79-70runsper100balls': 'S.R Between 79-70 runs per 100 balls',
  'S.RBelow70runsper100balls': 'S.R Below 70 runs per 100 balls',
  'wicketExcludingRunOut': 'Wicket (Excluding Run Out)',

  /// Cricket bowling
  'bonusLBWBowled': 'Bonus (LBW / Bowled)',
  'maidenOver': 'Maiden Over',
  '3wicketBonus': '3 Wicket Bonus',
  '4wicketBonus': '4 Wicket Bonus',
  '5wicketBonus': '5 Wicket Bonus',
  'below5runsperover': 'Below 5 runs per over',
  'between55.99runsperover': 'Between 5 - 5.99 runs per over',
  'between66.99runsperover': 'Between 6 - 6.99 runs per over',
  'between8.08.99runsperover': 'Between 8.0 - 8.99 runs per over',
  'between9.09.99runsperover': 'Between 9.0 - 9.99 runs per over',
  'above10runsperover': 'Above 10 runs per over',

  //  /// Cricket Fielding
  'catch': 'Catch',
  '3CatchBonus': '3 Catch Bonus',
  'stumping': 'Stumping',
  'runout': 'Run out',

  // Base Ball
  'hitting': 'Hitting',
  'weusefractionalpoints': 'We use fractional points',
  'weusenegativepoints': 'We use negative points',
  'singles': 'Singles',
  'doubles': 'Doubles',
  'triples': 'Triples',
  'homeRuns': 'Home Runs',
  'runs': 'Runs',
  'runsBattedIn': 'Runs Batted In',
  'walks': 'Walks',
  'hitByPitch': 'Hit By Pitch',
  'stolenBases': 'Stolen Bases',
  'caughtStealing': 'Caught Stealing',

//
  'pitching': 'Pitching',
  'wins': 'Wins',
  'saves': 'Saves',
  'inningsPitched': 'Innings Pitched',
  'earnedRunsAllowed': 'Earned Runs Allowed',
  // Hockey
  'skaters': 'Skaters',
  'goals': 'Goals',
  'shotsonGoal': 'Shots on Goal',
  'plus/Minus': 'Plus/Minus',
  'blocks': 'Blocks',
  'powerPlayGoals/Assists': 'Power Play Goals/Assists',
  'shortHandedGoals/Assists': 'Short-Handed Goals/Assists',
  'shootoutGoals': 'Shootout Goals',
  //
  'goalTenders': 'Goal Tenders',
  'goalsAgainst': 'Goals Against',
  'shutouts': 'Shutouts',

  //My Teams
  'recentFixtures': 'Recent Fixtures',
  'allTeams': 'All Teams',
  'closed': 'Closed',
  'upcoming': 'Upcoming',
  'pointsDistribution': 'Points Distribution',
  'salaryUsed': 'Salary Used',
  'copy': 'Copy',
  'edit': 'Edit',
  // Match Fixture
  'matchfixtures': 'Match Fixtures',
  // loto
  'noofDraw': 'No of Draw',
  'pricePool': 'Price Pool',
  'fees': 'Fees',
  'draws': 'Draws',
  'select': 'Select',
  'prizeDistribution': 'premioDistribución',
  'totalFees': 'Total Fees',
  'remove': 'Remove',
  'addDraw': 'Add Draw',
  'winner': 'Winner',

  // My Draws
  'totalwinning': 'Total\nWinning',
  'won': 'Won',
  'viewLeaderBoard': 'View LeaderBoard',
  'winning': 'Winning',
  'dMPPoints': 'DMP Points',
  // My Contest
  'entryFee': 'Entry Fee',
  'paid': 'Paid',
  'addMembers': 'Add Members',
  'confirm&Share': 'Confirm & Share',
  'enterPaymentMethod': 'Enter Payment Method',
  'payontheplatform': 'Pay on the platform',
  'adminwillcollectpayment': 'Admin will collect payment',
  'enterContestName': 'Enter Contest Name',
  'contestName': 'Contest Name',
  'pleaseentercontestname': 'Please enter contest name',
  'contestSettings': 'Contest Settings',
  'inviteFriends': 'Invite Friends',
  'confirmDetails': 'Confirm Details',
  'success': 'Success!',
  'copyInviteLink': 'Copy Invite Link',
  'returntoDashboard': 'Return to Dashboard',
  'add': 'Add',
  'enternameandemail': 'Please enter name and email',
  'admin': 'admin?',
  'member': 'Members',

  // American Football
  'oFFENSIVEPLAYER': 'OFFENSIVE PLAYER',
  'passingyardsper25Yards': 'Passing yards per 25 Yards',
  'passingTouchdowns': 'Passing Touchdowns',
  'passingInterpolations': 'Passing Interpolations',
  'rushing10perYards': 'Rushing 10 per Yards',
  'rushingTouchdowns': 'Rushing Touchdowns',
  'receptionsonlyifusingPPRScoring': 'Receptions(only if using PPR Scoring)',
  'receivingYardsper10yards': 'Receiving Yards per 10 yards',
  'receivingTouchdowns': 'Receiving Touchdowns',
  '2PointConversions': '2-Point Conversions',
  'fumblesLost': 'Fumbles Lost',
  'fumblesRecoveredforaTouchdown': 'Fumbles Recovered for a Touchdown',
  'tEAMDEFENSE': 'TEAM DEFENSE',
  'sacks': 'Sacks',
  'interceptions': 'Interceptions',
  'fumblesRecoveed': 'Fumbles Recoveed',
  'safeties': 'Safeties',
  'defensiveTouchdowns': 'Defensive Touchdowns',
  'kickandPuntReturnTouchdowns': 'Kick and Punt Return Touchdowns',
  '2PointConversionsReturns': '2-Point Conversions Returns',
  'pointsAllowed(0)': 'Points Allowed(0)',
  'pointsAllowed(1-6)': 'Points Allowed(1-6)',
  'poinstAllowed(7-13)': 'Poinst Allowed(7-13)',
  'pointasAllowed(14-20)': 'Pointas Allowed(14-20)',
  'pointsAllowed(21-27)': 'Points Allowed(21-27)',
  'pointsAllowed(28-34)': 'Points Allowed(28-34)',
  'pointsAllowed(35+)': 'Points Allowed(35+)',

  //
  'iNDIVIDUALDEFENSEPLAYER': 'INDIVIDUAL DEFENSE PLAYER',
  'soloTackles': 'Solo Tackles',
  'assistTackles': 'Assist Tackles',
  'sacksper10yards': 'Sacks per 10 yards',
  'tackelsForLoss': 'Tackels For Loss',
  'quarterbacksHits': 'Quarterbacks Hits',
  'phasesDefended': 'Phases Defended',
  'fumblesForced': 'Fumbles Forced',
  'fumblesRecovered': 'Fumbles Recovered',

  //
  'kICKING': 'KICKING',
  'pATMade': 'PAT Made',
  'fGMade049yardas': 'FG Made(0-49 yards)',
  'fGMade50yardas': 'FG Made(50+ yards)',

  //Drawer
  'QUICKLINKS': 'QUICKLINKS',
  'Fantasy Sports': 'Fantasy Sports',
  'Create New Team': 'Create New Team',
  'Match Center': 'Match Center',
  'Leaderboard': 'Leaderboard',
  'How it Works': 'How It Works',
  'My Teams': 'My Teams',
  'My Draws': 'My Draws',
  'My Contests': 'My Contests',
  'My Profile': 'My Profile',
  'Daily Matchpick': 'Daily Matchpick',
  'Create New Draw': 'Create New Draw',
  'Private Contest': 'Private Contest',

  // Prize Distribution Rule
  'prizeDistributionRule': 'Prize Distribution Rule',
  'perDraw': 'Per Draw',
  'correctpredictionofmatchoutcome':
      'Correct prediction of match outcome, you score 50 points.',
  'foreachpredictedcorrectrankof':
      'For each predicted correct rank of the player, you score 10 points. Max you can score if you get ALL 5 Players rank correct, is 10 points x 5 = 50 points',
  'jackpot': 'Jackpot',
  '100Points': '100 Points',
  'prizeMoney': 'Prize Money *',
  'ifyouhavegotalltheplayersright':
      'If you have got all the players right in order of their rank and predicted correctly the outcome of the match.',
  'ifjackpotishitThenthefull':
      'If jackpot is hit. Then the full prize money goes to the jackpot hitters. When no jackpot is hit. Then the prize money is distibuted as below',
  'gold': 'Gold',
  '90Points': '90 Points',
  'Ifyourscoreis90DMPpointsorabove':
      'If your score is 90 DMP points or above for the draw, but less than 100.',
  'Silver': 'Silver',
  '80Points': '80 Points',
  'Ifyourscoreis80DMPpointsorabove':
      'If your score is 80 DMP points or above for the draw, but less than 90.',
  'bronze': 'Bronze',
  '70Points': '70 Points',
  'ifyourscoreis70DMPpoints':
      'If your score is 70 DMP points or above for the draw, but less than 80.',
  'ifmorethanoneuserwinstheJackpot':
      'If more than one user wins the Jackpot, Gold, Silver, or Bronze, the prize money for each respective category will be shared equally among the winners, and please note that all prize money mentioned above is after the deduction of a 15% platform fee.',

  // Authenticatioion
  'Did not receive the OTP?': 'Did not receive the OTP?',
  'Request New one in': 'Request New one in',
  'Resend': 'Resend',
  'Submit': 'Submit',
  'Facing Issue?': 'Facing Issue?',
  'Contact us': 'Contact us',
  'I Confirm I’m Above the age of 18': 'I Confirm I’m Above the age of 18',
  'Submit Details': 'Submit Details',
  'Success': 'Success!',
  'Welcome to Fantasy Bulls! Browse Tournaments in Match Center or Invite Friends to Participate in Private Tournaments.':
      'Welcome to Fantasy Bulls! Browse Tournaments in Match Center or Invite Friends to Participate in Private Tournaments.',
  'Continue to dashboard': 'Continue to dashboard',
  'Login': 'Login',
  'Sign Up': 'Sign Up',
  'ForgetPassword': 'ForgetPassword',
  'Please Enter Further Details, Let us':
      'Please Enter Further Details, Let us\nget to know you better.',
  'Forget Password': 'Forget Password ?',
  'Reset Password': 'Reset Password',
  'Game On! Verify Playful Side': 'Game On! Verify\nYour Playful Side',
  'An OTP is sent to your Email': 'An OTP is sent to your Email\n',
  'Please enter the OTP to continue': 'Please\n enter the OTP to continue',
  'Please enter a valid OTP': 'Please enter a valid OTP',
  'You’re just a few details away': 'You’re just a few\ndetails away',
  'Please Enter Further Details, Let us\nget to know you better.':
      'Please Enter Further Details, Let us\nget to know you better.',
  'Register': 'Register',
  'Logout': 'Logout',
  'Match': 'Match',
  'Match Fixtures': 'Match Fixtures',
  'Email': 'Email',
  'Password': 'Password',
  'Team Name': 'Team Name',
  'Full Name': 'Full Name',
  'Contest Name': 'Contest Name',
  'Search': 'Search',
  'First Name': 'First Name',
  'Surname': 'Surname',
  'Mobile': 'Mobile',
  'Country': 'Country',
  'City': 'City',
  'Address': 'Address',
  'Postal / Zip Code': 'Postal / Zip Code',
  'Date of Birth': 'Date of Birth',
  'Select Country': 'Select Country',
  'Edit Profile': 'Edit Profile',
  'Statement': 'Statement',
  'Transactions': 'Transactions',
  'All': 'All',
  'Entry Paid': 'Entry Paid',
  'Prize Money': 'Prize Money',
  'Deposit': 'Deposit',
  'MATCH ENDED': 'MATCH ENDED',
  'Tournaments': 'Tournaments',
  'Friends': 'Friends',
  'Add Contact': 'Add Contact',
  'Create Group': 'Create Group',
  'Add New Contacts or group': 'Add New Contacts or group',
  'Open An Account': 'Open An Account',
};

final Map<String, String> es = {
  // global

  'search': 'Buscar',
  'searchTeams': 'Buscar equipos',
  'continue': 'Continuar',
  'publicButton': 'pública',
  'privateButton': 'Privada',
  // Authenticaiton Screen
  'onBoardingLabel':
      'Tu destino principal para todo lo relacionado con los deportes de fantasía',
  'loginContainerLabel': 'Inicia sesión para comenzar',
  'signUpContainer': 'Experimenta la emoción',
  'loginDescription':
      'Experimenta la emoción de los deportes de fantasía diarios con Fantasy Bulls',
  'signUpDescription':
      '¿Aún no te has registrado en Fantasy Bulls? Regístrate ahora y comienza tu juego',
  'rememberMe': 'Acuérdate de mí',
  'googleAuthentication': 'Continuar con Google',
  'forgetPassword': '¿Olvidaste tu contraseña?',
  'iagree': 'Estoy de acuerdo con el',
  'terms': 'Términos y condiciones',
  // Home Screeen
  'publicTournament': 'Torneo Público',
  'privateTournament': 'Torneo Privado',
  // Select Player
  'selectPlayer': 'Seleccionar jugadoras',
  'filter': 'filtros',
  'clearAll': 'Borrar todo',
  'salary': 'Salario',
  'PlayerSelected': 'Jugadora seleccionada',
  'prizePool': 'Bolsa de premios',
  'joinfor': 'Únase para',
  'matchCenterIn': 'El partido comienza en',

  //// Select Player Error
  'errormax': 'Número máximo de selecciones alcanzadas o puntos insuficientes',
  // Bull Player
  'selectedBullPlayer': 'Seleccionar jugador de toros',
  'bullPlayer': 'Jugadora de toros',
  'preview': 'Avance',
  // Team name
  'makeItOfficial': 'Hazla oficial',
  'namefantasy': 'Nombra tu potencia de fantasía',
  'saveAndContinue': 'Guardar y continuar',
  // Profile
  'preferences': 'Preferencias',
  'acountDetails': 'Detalles de la cuenta',
  'statement': 'Declaración',
  'settings': 'Ajustes',
  'privacyAndPolicy': 'Privacidad y política',
  // Match Center
  'servererror': 'Error del servidor',
  'notournamentavailable.': 'No hay torneos disponibles.',
  // Match Center Inner
  'erroroccurred': 'Se produjo un error',
  'nodataavailable': 'No data available',
  'playerOfTheMatch': 'Jugadora del partido', // CR
  'notAvailable': 'No hay datos disponibles',
  'viewInnings': 'Ver entradas',
  'statistics': 'Estadística',
  'points': 'Agujas',
  'value': 'Valor',
  'topPlayers': 'Mejores jugadoras',
  'playerName': 'nombre del jugador', // skeleton
  'playerPosition': 'Posición del jugador',
  // LeaderBoard
  'leaderBoard': 'Tabla de clasificación',
  'name': 'Nombre',
  'winnings': 'Ganancias',
  'noMatchesfound': 'No se encontraron coincidencias',
  // How It Works
  'howItWorks': 'Cómo funciona',
  'chooseYourSports': 'Elige\nTus deportes',
  'Paragraph1':
      'Seleccione entre una variedad de deportes que incluyen fútbol americano, baloncesto, fútbol, ​​cricket y más.',
  'draftYourTeam': 'Redacte su\nequipo',
  'Paragraph2':
      'Utilice su conocimiento y experiencia para formar el mejor equipo posible dentro del tope salarial.',
  'playScoreWin!': '¡Juega, anota,\nGana!',
  'Paragraph3':
      'Observa cómo tus jugadores compiten y gana puntos según su desempeño. ¡Cuanto mejor jueguen, más puntos obtendrás!',
  'cashInYourPrize': 'Cobra tu premio\n',
  'Paragraph4':
      'Gana premios en efectivo según el desempeño de tu equipo y sube en la clasificación para reclamar tu lugar entre la élite de fantasía.',
  'gamePlayRules': 'Reglas de juego',
  'selectyoursport': 'Selecciona tu deporte',
  'attacking': 'Agresora',
  'team': 'Equipo',
  'defense': 'Defensa',
  'discipline': 'Disciplina',
  'goalByForward': 'Gol por delantero',
  'goalByMidfielder': 'Gol del centrocampista',
  'goalByDefender': 'Gol del defensor',
  'goalByGoalkeeper': 'Gol del portero',
  'assistByAnyPosition': 'Asistir desde cualquier posición',
  'shotTargetByAnyPosition': 'Disparo al objetivo desde cualquier posición',
  'chanceCreatedByAnyPosition': 'Oportunidad creada por cualquier posición',
  'passesCompletedByAnyPosition': '10 pases completados por cualquier posición',
  'penaltyMissedByAnyPosition': 'Penalización fallada por cualquier posición',
  'tackleWonByAnyPosition': 'Tackle ganado por cualquier posición',
  'interceptionWonByAnyPosition': 'Intercepción ganada por cualquier posición',
  'goalSavedByGoalkeeper': 'Gol salvado por el portero',
  'penaltySavedByGoalkeeper': 'Penalti detenido por el portero',
  'cleanSheet': 'Portería a cero (mínimo 55 minutos) por defensor, portero',
  'goalConcededByDefenderGoalkeeper':
      'Gol encajado por el defensor, el portero',
  'inStarting11ByAnyPosition': 'En 11 iniciales por cualquier posición',
  'subOnByAnyPosition': 'Sub activado por cualquier posición',
  'subOFFByGoalkeeper': 'Sub OFF por el portero',
  'OwnGoalByAnyPosition': 'Gol en propia puerta desde cualquier posición',
  'YellowCardByAnyPosition': 'Tarjeta amarilla por cualquier posición',
  'redcardByAnyposition': 'Tarjeta roja por cualquier posición',

  //basketball

  'allPlayers': 'Todos los jugadores',
  'threePointsFieldGoal': 'Gol de campo de tres puntos',
  'twoPointsFieldGoal': 'Gol de campo de dos puntos',
  'threeThrowsMade': 'Tres lanzamientos realizados',
  'Rebounds': 'Rebotes',
  'Assists': 'Asistencias',
  'BlockedShots': 'Tiros bloqueados',
  'Steals': 'roba',
  'Turnovers': 'pérdidas de balón',
  'weUseFractionalPoints': 'Usamos puntos fraccionarios',

  //cricket

  'Batting': 'Bateo',
  'Bowling': 'Bolos',
  'Fielding': 'Campo',
  'Run': 'Correr',
  'BoundaryBonus': 'Bonificación de límites',
  'SixBonus': 'Bono seis',
  '30Run': '30 Correr',
  'HalfCentury': 'Medio siglo',
  'Century': 'Siglo',
  'DoubleCentury': 'Doble siglo',
  'Dismissalforaduck': 'Despido por un pato',
  'Above170runsper100balls': 'Más de 170 carreras por 100 bolas',
  'S.RBetween150-170runsper100balls':
      'S.R Entre 150-170 carreras por 100 bolas',
  'S.RBetween130-150runsper100Balls':
      'S.R Entre 130-150 carreras por 100 bolas',
  'S.RBetween90-80runsper100balls': 'S.R Entre 90-80 carreras por 100 bolas',
  'S.RBetween79-70runsper100balls': 'S.R Entre 79-70 carreras por 100 bolas',
  'S.RBelow70runsper100balls': 'S.R Por debajo de 70 carreras por 100 bolas',

  'weUseNegativePoints': 'Usamos puntos negativos',
  'wicketExcludingRunOut': 'Wicket (excluido el agotamiento)',

  /// Cricket boling
  'bonusLBWBowled': 'Bonificación (LBW / Bolos)',
  'maidenOver': 'doncella',
  '3wicketBonus': 'Bono de 3 ventanillas',
  '4wicketBonus': 'Bonificación de 4 ventanillas',
  '5wicketBonus': 'Bono de 5 ventanillas',
  'below5runsperover': 'Menos de 5 carreras por over',
  'between55.99runsperover': 'Entre 5 y 5,99 carreras por over',
  'between66.99runsperover': 'Entre 6 y 6,99 carreras por over',
  'between8.08.99runsperover': 'Entre 8,0 y 8,99 carreras por over',
  'between9.09.99runsperover': 'Entre 9,0 y 9,99 carreras por over',
  'above10runsperover': 'Más de 10 carreras por over',

  //  /// Cricket Fielding
  'catch': 'Atrapar',
  '3CatchBonus': 'Bono de 3 capturas',
  'stumping': 'persiguiendo',
  'runout': 'Sin',

  // Base Ball
  'hitting': 'Golpear',
  'weusefractionalpoints': 'Usamos puntos fraccionarios.',
  'weusenegativepoints': 'Usamos puntos negativos.',
  'singles': 'Individual',
  'doubles': 'Dobles',
  'triples': 'triples',
  'homeRuns': 'Jonrones',
  'runs': 'Corre',
  'runsBattedIn': 'Carreras impulsadas',
  'walks': 'Paseos',
  'hitByPitch': 'Golpeado por el lanzamiento',
  'stolenBases': 'Bases robadas',
  'caughtStealing': 'atrapado robando',
//
  'pitching': 'Cabeceo',
  'wins': 'gana',
  'saves': 'Guarda',
  'inningsPitched': 'Entradas lanzadas',
  'earnedRunsAllowed': 'Carreras obtenidas permitidas',

  // Hockey
  'skaters': 'Patinadores',
  'goals': 'Objetivos',
  'shotsonGoal': 'Tiros a portería',
  'plus/Minus': 'Más/Menos',
  'blocks': 'Bloques',
  'powerPlayGoals/Assists': 'Goles/Asistencias de Power Play',
  'shortHandedGoals/Assists': 'Goles/Asistencias en corto',
  'shootoutGoals': 'Goles de tiroteo',
  //
  'goalTenders': 'Licitaciones de objetivos',
  'goalsAgainst': 'Goles en contra',

  'shutouts': 'Blanqueados',

  //My Teams
  'recentFixtures': 'Calendario reciente',
  'allTeams': 'Todos los equipos',
  'closed': 'Cerrado',
  'upcoming': 'Próxima',
  'pointsDistribution': 'Distribución de puntos',
  'salaryUsed': 'Salario utilizado',
  'copy': 'Copiar',
  'edit': 'Editar',
  'matchfixtures': 'Calendario del partido',
  // loto
  'noofDraw': 'No de sorteo',
  'pricePool': 'Grupo de precios',
  'fees': 'Honorarios',
  'draws': 'Dibujar',
  'select': 'Seleccionar',
  'prizeDistribution': 'premio Distribución',
  'totalFees': 'Tarifas totales',
  'remove': 'Eliminar',
  'addDraw': 'Agregar sorteo',
  'winner': 'Ganadora',
  // My Draws
  'totalwinning': 'Ganancia\ntotal',
  'won': 'Ganado',
  'viewLeaderBoard': 'Ver tabla de clasificación',
  'winning': 'victoriosa',
  'dMPPoints': 'Puntos DMP',

  // Create Contest
  'entryFee': 'Cuota de entrada',
  'paid': 'Pagada',
  'addMembers': 'Agregar miembros',
  'confirm&Share': 'Confirmar y compartir',
  'enterPaymentMethod': 'Ingrese el método de pago',
  'payontheplatform': 'Paga en la plataforma',
  'adminwillcollectpayment': 'El administrador cobrará el pago',
  'enterContestName': 'Ingrese el nombre del concurso',
  'contestName': 'Nombre del concurso',
  'pleaseentercontestname': 'Por favor ingresa el nombre del concurso',
  'contestSettings': 'Configuración del concurso',
  'inviteFriends': 'Invitar a amigas',
  'confirmDetails': 'Confirmar detalles',
  'success': '¡Éxito!',
  'copyInviteLink': 'Copiar enlace de invitación',
  'returntoDashboard': 'Volver al panel',
  'add': 'Agregar',
  'enternameandemail': 'Por favor ingrese nombre y correo electrónico',
  'admin': 'administración?',
  'member': 'Miembros',
  //American
  'oFFENSIVEPLAYER': 'JUGADOR OFENSIVO',
  'passingyardsper25Yards': 'Yardas de pase por cada 25 yardas',
  'passingTouchdowns': 'Touchdowns de pase',
  'passingInterpolations': 'Interpolaciones de pase',
  'rushing10perYards': '10 yardas de carrera',
  'rushingTouchdowns': 'Touchdowns de carrera',
  'receptionsonlyifusingPPRScoring':
      'Recepciones (solo si se usa el puntaje PPR)',
  'receivingYardsper10yards': 'Yardas de recepción por cada 10 yardas',
  'receivingTouchdowns': 'Touchdowns de recepción',
  '2PointConversions': 'Conversiones de 2 puntos',
  'fumblesLost': 'Balones perdidos',
  'fumblesRecoveredforaTouchdown': 'Balones recuperados para un touchdown',
  'tEAMDEFENSE': 'DEFENSA DEL EQUIPO',
  'sacks': 'Sacks',
  'interceptions': 'Intercepciones',
  'fumblesRecoveed': 'Balones recuperados',
  'safeties': 'Safeties',
  'defensiveTouchdowns': 'Touchdowns defensivos',
  'kickandPuntReturnTouchdowns': 'Touchdowns de retorno de patadas y despejes',
  '2PointConversionsReturns': 'Conversiones de 2 puntos',
  'pointsAllowed(0)': 'Puntos permitidos(0)',
  'pointsAllowed(1-6)': 'Puntos permitidos(1-6)',
  'poinstAllowed(7-13)': 'Puntos Permitido(7-13)',
  'pointasAllowed(14-20)': 'Puntos permitidos(14-20)',
  'pointsAllowed(21-27)': 'Puntos permitidos(21-27)',
  'pointsAllowed(28-34)': 'Puntos permitidos(28-34)',
  'pointsAllowed(35+)': 'Puntos permitidos(35+)',
//

  'iNDIVIDUALDEFENSEPLAYER': 'JUGADOR DEFENSIVO INDIVIDUAL',
  'soloTackles': 'Tackles individuales',
  'assistTackles': 'Tackles asistidos',
  'sacksper10yards': 'Sacks por cada 10 yardas',
  'tackelsForLoss': 'Tackles para pérdida',
  'quarterbacksHits': 'Golpes de quarterback',
  'phasesDefended': 'Fases defendidas',
  'fumblesForced': 'Balones sueltos forzados',
  'fumblesRecovered': 'Balones sueltos recuperados',

//
  'kICKING': 'PATANDO',
  'pATMade': 'PAT anotado',
  'fGMade049yardas': 'FG anotado(0-49 yardas yardas)',
  'fGMade50yardas': 'FG realizado(50+ yardas)',
  //Drawer
  'QUICKLINKS': 'ENLACES RÁPIDOS',
  'Fantasy Sports': 'Deportes de fantasía',
  'Create New Team': 'Crear nuevo equipo',
  'Match Center': 'Centro de partidos',
  'LeaderBoard': 'Tabla de clasificación',
  'How it Works': 'Cómo funciona',
  'My Teams': 'Mis equipos',
  'My Draws': 'Mis Sorteos',
  'My Contests': 'Mis Concursos',
  'My Profile': 'Mi Perfil',
  'Daily Matchpick': 'Selección diaria de ',
  'Create New Draw': 'Crear Nuevo Sorteo',
  'Private Contest': 'Concurso Privado',

  // Regla de distribución de premios
  'prizeDistributionRule': 'Regla de distribución de premios',
  'perDraw': 'Por sorteo',
  'correctpredictionofmatchoutcome':
      'Predicción correcta del resultado del partido, obtienes 50 puntos.',
  'foreachpredictedcorrectrankof':
      'Por cada clasificación correcta predicha del jugador, obtienes 10 puntos. El máximo que puedes obtener si aciertas las clasificaciones de los 5 jugadores es 10 puntos x 5 = 50 puntos',
  'jackpot': 'Premio mayor',
  '100Points': '100 puntos',
  'prizeMoney': 'Premio en efectivo *',
  'ifyouhavegotalltheplayersright':
      'Si has acertado a todos los jugadores en orden de clasificación y has predicho correctamente el resultado del partido.',
  'ifjackpotishitThenthefull':
      'Si se gana el premio mayor. En ese caso, el dinero del premio completo se lo llevan los ganadores del premio mayor. Cuando no se gana ningún premio mayor, Entonces el dinero del premio se distribuye de la siguiente manera',
  'gold': 'Oro',
  '90Points': '90 Puntos',
  'Ifyourscoreis90DMPpointsorabove':
      'Si su puntaje es de 90 puntos DMP o más para el sorteo, pero menos de 100.',
  'Silver': 'Plata',
  '80Points': '80 Puntos',
  'Ifyourscoreis80DMPpointsorabove':
      'Si su puntaje es de 80 puntos DMP o más para el sorteo, pero menos de 90.',
  'bronze': 'Bronce',
  '70Points': '70 Puntos',
  'ifyourscoreis70DMPpoints':
      'Si su puntaje es de 70 puntos DMP o más para el sorteo, pero menos de 80.',
  'ifmorethanoneuserwinstheJackpot':
      'Si más de un usuario gana el Jackpot, Oro, Plata o Bronce, el dinero del premio para cada categoría respectiva se compartirá equitativamente entre los ganadores, y tenga en cuenta que todo el dinero del premio mencionado anteriormente es después de la deducción de una tarifa de plataforma del 15%.',

  // Authenticatioion
  'Did not receive the OTP?': '¿No recibió la OTP?',
  'Request New one in': 'Solicitar uno nuevo en',
  'Resend': 'Reenviar',
  'Submit': 'Entregar',
  'Facing Issue?': '¿Tiene problemas?',
  'Contact us': 'Contacta con nosotras',
  'I Confirm I’m Above the age of 18': 'Confirmo que soy mayor de 18 años',
  'Submit Details': 'Enviar detalles',
  'Success': '¡Éxito!',
  'Welcome to Fantasy Bulls! Browse Tournaments in Match Center or Invite Friends to Participate in Private Tournaments.':
      '¡Bienvenido a Fantasy Bulls! Explora torneos en Match Center o invita a tus amigos a participar en torneos privados.',
  'Continue to dashboard': 'Continuar al panel de control',
  'Login': 'Acceso',
  'Sign Up': 'Inscribirse',
  'ForgetPassword': 'Olvidar contraseña',
  'Please Enter Further Details, Let us':
      'Ingrese más detalles para que podamos conocerlo mejor.',
  'Forget Password': '¿Olvidaste tu contraseña?',
  'Reset Password': 'Restablecer contraseña',
  'Game On! Verify Playful Side':
      '¡Que empiece el juego! Comprueba tu lado lúdico',
  'An OTP is sent to your Email': 'Se envía una OTP a su correo electrónico',
  'Please enter the OTP to continue': 'Por favor ingrese la OTP para continuar',
  'Please enter a valid OTP': 'Por favor, introduzca una OTP válida',
  'You’re just a few details away':
      'Estás a sólo unos pocos detalles de distancia',
  'Please Enter Further Details, Let us\nget to know you better.':
      'Ingrese más detalles para que podamos conocerlo mejor.',
  'Register': 'Registro',
  'Logout': 'Cerrar sesión',

  'Match': 'Fósforo',
  'Match Fixtures': 'Calendario del partido',
  'Email': 'Correo electrónico',
  'Password': 'Contraseña',
  'Team Name': 'Nombre del equipo',
  'Full Name': 'Nombre completo',
  'Contest Name': 'Nombre del concurso ',
  'Search': 'Buscar',
  'First Name': 'Nombre de pila',
  'Surname': 'Apellido',
  'Mobile': 'Móvil',
  'Country': 'País',
  'City': 'Ciudad',
  'Address': 'Dirección',
  'Postal / Zip Code': 'Código postal',
  'Date of Birth': 'Fecha de nacimiento',
  'Select Country': 'Seleccionar país',
  'Edit Profile': 'Editar perfil',
  'Statement': 'Declaración',
  'Transactions': 'Actas',
  'All': 'Todo',
  'Entry Paid': 'Entrada Pagada',
  'Prize Money': 'Premio en metálico',
  'Deposit': 'Depósito',
  'MATCH ENDED': 'PARTIDO TERMINADO',
  'Tournaments': 'Torneos',
  'Friends': 'Amigos',
  'Contacts': 'Contactos',
  'Groups': 'Grupos',
  'Add Contact': 'Agregar contacto',
  'Create Group': 'Crear grupo',
  'Additional Email': 'Correo electrónico adicional',
  'Phone Number': 'Número de teléfono',
  'Add': 'Añadir',
  'Group Name': 'Nombre del grupo',
  'Select all': 'Seleccionar todo',
  'Clear all': 'Limpiar todo',
  'Select People': 'Seleccionar personas',
  'Add New Contacts or group': 'Agregar nuevos contactos o grupo',
  'Edit Group': 'Editar grupo',
  'Are you sure?': '¿Estas seguro?',
  'Delete': 'Borrar',
  'Yes': 'Sí',
  'No': 'No',
  'Group': 'Grupo',
  'Name': 'Nombre',
  'Add New Members': 'Agregar nuevos miembros',
  'Edit Contact': 'Editar contacto',
  'Add Contacts': 'Agregar contactos',

  //KYC Translations
  'Getting to know you': 'Conociéndote',
  'For security reasons and to keep this a safe place to trade, we will now verify your identity. It will take less than 3 minutes.':
      'Por razones de seguridad y para mantener este lugar seguro para comerciar, ahora verificaremos tu identidad. Tomará menos de 3 minutos.',
  'Please have your citizen card ready.':
      'Por favor ten tu documento de identidad listo.',
  'I\'am ready, Let\'s go': 'Estoy listo, comencemos',
  'Why we ask for identification': '¿Por qué pedimos identificación?',
  'At Fantasy Bulls we are serious about security and legal compliance. That\'s how we make this a safe place to trade.':
      'En Fantasy Bulls nos tomamos en serio la seguridad y el cumplimiento legal. Así es como hacemos de este un lugar seguro para comerciar.',
  'Don\'t worry, the data we collect is processed in an encrypted manner and never sold or shared with third parties for marketing purposes.':
      'No te preocupes, los datos que recopilamos se procesan de manera encriptada y nunca se venden ni comparten con terceros para fines de marketing.',
  'Why do we ask this?': '¿Por qué pedimos esto?',
  'Can\'t find your citizen card?': '¿No encuentras tu documento de identidad?',
  'Do you maybe have your passport or another government-issued document with a current photo at hand?':
      '¿Tienes a mano tu pasaporte u otro documento oficial con una foto actual?',
  'Use another document': 'Usar otro documento',
  'Remind me later': 'Recordarme más tarde',
  'We will send you a notification to resume identification later. Meanwhile you can browse our app with limited functionality.':
      'Te enviaremos una notificación para reanudar la identificación más tarde. Mientras tanto, puedes navegar por nuestra aplicación con funcionalidad limitada.',
  'Try app in demo mode': 'Probar la aplicación en modo demo',
  'Back': 'Volver',
  'Can\'t find my citizen card': 'No encuentro mi documento de identidad',

  //TwoFactor Translations
  'Your mobile phone number': 'Tu número de teléfono móvil',

  'To make your account fully secure, please let us know to what phone number we can send a security code.':
      'Para garantizar la seguridad de tu cuenta, por favor indícanos a qué número de teléfono podemos enviar un código de seguridad.',

  'Why we ask for phone number verification':
      'Por qué pedimos la verificación del número de teléfono',

  'To keep your account safe and protect your funds from malicious actors, we will send you a short security code to confirm it\'s really you using your account.':
      'Para mantener tu cuenta segura y proteger tus fondos de actores maliciosos, te enviaremos un breve código de seguridad para confirmar que realmente eres tú quien usa tu cuenta.',

  'This adds an extra layer of security to your account in case your password is stolen.':
      'Esto añade una capa adicional de seguridad a tu cuenta en caso de que tu contraseña sea robada.',

  'Why Did We Ask For This?': '¿Por qué pedimos esto?',

  // Privacy section
  'Your privacy is important': 'Tu privacidad es importante',

  'At Fantasy Bulls, we value you are in control of your data.':
      'En Fantasy Bulls, valoramos que tú tengas el control de tus datos.',

  'Please confirm that you have read and acknowledged the conditions and information.':
      'Por favor, confirma que has leído y aceptado las condiciones y la información.',

  'Data Privacy Declaration': 'Declaración de Privacidad de Datos',

  'General Terms and Conditions': 'Términos y Condiciones Generales',

  'Yes, I want to join thousands of Fantasy Bulls users to receive emails with exclusive content. I have read and accepted the':
      'Sí, quiero unirme a miles de usuarios de Fantasy Bulls para recibir correos electrónicos con contenido exclusivo. He leído y aceptado los',

  'newsletter terms': 'términos del boletín',

  'Stay up to date via email, SMS, phone or mail.':
      'Mantente actualizado a través de correo electrónico, SMS, teléfono o correo postal.',

  'Would you like to be posted about latest features and developments? Even if you prefer not to receive any such communication, we would still need to contact you by email, text message, phone or mail for certain matters, for example account opening or closing, or in case of trade execution.':
      '¿Te gustaría estar informado sobre las últimas características y desarrollos? Incluso si prefieres no recibir este tipo de comunicaciones, aún necesitaríamos contactarte por correo electrónico, mensaje de texto, teléfono o correo postal para ciertos asuntos, por ejemplo, apertura o cierre de cuenta, o en caso de ejecución de operaciones.',

  'Keep me updated': 'Mantenerme actualizado',

  'No I am not interested': 'No estoy interesado',

  //Auth Translation

  'Open free account': 'Abrir cuenta gratuita',
  'Already a customer? Login': 'Ya eres cliente? Inicia sesión',
  'Open An Account': 'Abra una cuenta',
};
