import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:food_app/provider/myprovider.dart';
import 'package:food_app/screen/carts_screen.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Badge(
    toAnimate: false,
      position: BadgePosition(left: 25, top: 8),
      badgeContent: Text(
        myProvider.getNotificationIndex.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      badgeColor: Colors.red,
      child: IconButton(
        icon: Icon(
          Icons.notifications_none,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          );
          setState(() {
            myProvider.notifireList.clear();
          });
        },
      ),
    );
  }
}
