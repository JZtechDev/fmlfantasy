// import 'dart:math';

// import 'package:flutter/material.dart';

// class PlayerCard extends StatelessWidget {
//   final String playerName;
//   final String playerTeam;
//   final String playerPosition;
//   final int playerNumber;
//   final String playerImage;
//   final bool isSelected;

//   const PlayerCard({
//     super.key,
//     required this.playerName,
//     required this.playerTeam,
//     required this.playerPosition,
//     required this.playerNumber,
//     required this.playerImage,
//     required this.isSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 10, top: 10),
//       height: 163,
//       width: 174,
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.blue : Colors.white,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Stack(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: SizedBox(
//               height: 26,
//               width: 70,
//               child: Text(
//                 playerTeam,
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                   color: isSelected ? Colors.white : Colors.grey,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: Transform.rotate(
//               origin: const Offset(30, -30),
//               angle: pi / 4.5, // Rotate 60 degrees clockwise
//               child: Container(
//                 height: 135.0, // Adjust height of the bar
//                 width: 42.0, // Adjust width of the bar
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.grey.withOpacity(0.35),
//                       Colors.transparent, // Adjust opacity or color as needed
//                     ],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: Transform.rotate(
//               origin: const Offset(5, -00),
//               angle: pi / 4.5, // Rotate 60 degrees clockwise
//               child: Container(
//                 height: 135.0, // Adjust height of the bar
//                 width: 42.0, // Adjust width of the bar
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.grey.withOpacity(0.35),
//                       Colors.transparent, // Adjust opacity or color as needed
//                     ],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             right: 20,
//             child: Container(
//               alignment: Alignment.center,
//               height: 22.11,
//               width: 43.21,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.black,
//               ),
//               child: Text(
//                 playerPosition,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 5,
//             top: 60,
//             child: Text(
//               playerNumber.toString(),
//               style: TextStyle(
//                 fontSize: 23,
//                 fontWeight: FontWeight.w600,
//                 color: isSelected ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//           Positioned(
//             left: 4,
//             top: 90,
//             child: Text(
//               playerName,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 color: isSelected ? Colors.white.withOpacity(0.7) : Colors.grey,
//               ),
//             ),
//           ),
//           Positioned(
//             left: 4,
//             bottom: 5,
//             child: SizedBox(
//               height: 40,
//               width: 89,
//               child: Text(
//                 playerName,
//                 style: TextStyle(
//                   fontSize: 14.75,
//                   fontWeight: FontWeight.w600,
//                   color: isSelected ? Colors.white.withOpacity(0.7) : Colors.black,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Image.asset(
//               playerImage,
//               width: MediaQuery.of(context).size.width * 0.3,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
