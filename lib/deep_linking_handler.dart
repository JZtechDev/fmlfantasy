// import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
// import 'package:uni_links/uni_links.dart';
// import 'dart:async';
// import 'package:get/get.dart';

// class DeepLinkHandler {
//   StreamSubscription? _sub;

//   Future<void> initDeepLinking() async {
//     // Handle links when app is already running
//     _sub = linkStream.listen((String? link) {
//       if (link != null) {
//         _handleDeepLink(link);
//       }
//     }, onError: (err) {
//       print('Deep link error: $err');
//     });

//     // Handle links when app is opened from closed state
//     try {
//       final initialLink = await getInitialLink();
//       if (initialLink != null) {
//         _handleDeepLink(initialLink);
//       }
//     } catch (e) {
//       print('Error getting initial link: $e');
//     }
//   }

//   void _handleDeepLink(String link) {
//     final uri = Uri.parse(link);

//     // Extract parameters from URL
//     final joinCode = uri.queryParameters['joinCode'];
//     final tournamentId = uri.queryParameters['tournamentId'];
//     final sport = uri.pathSegments[0]; // Extract sport from path

//     if (joinCode != null && tournamentId != null) {
//       // Navigate to the select players screen with parameters
//       Get.toNamed(
//         AppRoutes.selectPlayers,
//         arguments: {
//           'matchID': null, // You might need to fetch this
//           'sport': sport,
//           'tournamentId': tournamentId,
//           'joinCode': joinCode,
//         },
//       );
//     }
//   }

//   void dispose() {
//     _sub?.cancel();
//   }
// }
