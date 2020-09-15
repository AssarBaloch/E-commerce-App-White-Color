import 'package:flutter/material.dart';
import 'package:food_app/widgets/profile_edit.dart';
import '../model/user.dart';

class Profile extends StatelessWidget {
  final Users currentUser;

  Profile({this.currentUser});
  Widget containers({IconData iconData, String name}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 19),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Icon(
                  iconData,
                  size: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                child: Text(
                  name,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                height: 35,
                width: 350,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          containers(
              iconData: Icons.person_outline, name: currentUser.fullName),
          containers(
            iconData: Icons.email,
            name: currentUser.email,
          ),
          containers(
            iconData: Icons.lock,
            name: currentUser.password,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color:Theme.of(context).accentColor,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(
                    90,
                    20,
                    20,
                    20,
                  ),
                  blurRadius: 10.0,
                  offset: Offset(
                    4,
                    4,
                  ),
                ),
              ],
            ),
            height: 55,
            width: 100,
            child: Center(
              child: Text(
                'UpDate',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
