// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart';
// import 'package:food_app/provider/myprovider.dart';
// import 'package:provider/provider.dart';
// import '../provider/myprovider.dart';
// class NotificationButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     MyProvider myProvider = Provider.of<MyProvider>(context);
//     return Badge(
//       position: BadgePosition(left: 25, top: 8),
//       badgeContent: Text(
//         myProvider.getNotificationIndex.toString(),
//         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//       ),
//       badgeColor: Colors.red,
//       child: IconButton(
//           icon: Icon(
//             Icons.notifications_none,
//             color: Colors.black,
//           ),
//           onPressed: () {}),
//     );
//   }
// }