import 'package:flutter/material.dart';
import 'package:food_app/model/user.dart';
import 'package:food_app/widgets/my_text_field.dart';

class ProfileEdit extends StatefulWidget {
  final myKey;
  final Users currentUser;
  final Function checkVerify;
  ProfileEdit({@required this.myKey, this.currentUser, this.checkVerify});
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController fullName;

  TextEditingController email;

  TextEditingController password;

  @override
  void initState() {
    fullName = TextEditingController(text: widget.currentUser.fullName);
    email = TextEditingController(text: widget.currentUser.email);
    password = TextEditingController(text: widget.currentUser.password);
    super.initState();
  }

  GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);
  void checkValid() {
    if (fullName.text.trim() == null || fullName.text.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("FullName Is Empty"),
        duration: Duration(milliseconds: 800),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (email.text.isEmpty || email.text.trim() == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Email is Empty"),
        duration: Duration(milliseconds: 800),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (!regex.hasMatch(email.text)) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Please Try Vaild Email"),
        duration: Duration(milliseconds: 800),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (password.text.trim() == null || password.text.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Password Is Empty"),
        duration: Duration(milliseconds: 800),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else {
      widget.checkVerify(
        password.text,
        email.text,
        fullName.text,
        widget.currentUser,
      );
    }
  }

  Widget item() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextField(
          iconData: Icons.person_outline,
          name: 'Full Name',
          obscureText: false,
          controller: fullName,
        ),
        MyTextField(
          iconData: Icons.email,
          name: 'Email',
          obscureText: false,
          controller: email,
        ),
        MyTextField(
          iconData: Icons.lock,
          name: 'Password',
          obscureText: true,
          controller: password,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
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
          child: RaisedButton(
            child: Text(
              'UpDate',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              setState(() {
                checkValid();
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return item();
  }
}
