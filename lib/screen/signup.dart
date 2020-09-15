import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/model/user.dart';
import 'package:food_app/screen/home_screen.dart';
import 'package:food_app/widgets/signup_login_textfeild.dart';
import './login_page.dart';
import '../widgets/rasied_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignUpPage extends StatefulWidget {
  SignUpPage({this.imagePicked});
  final void Function(File pickedImage) imagePicked;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _netWorkLodding = false;
  bool isMale = true;
  File camaraImage;
  Users user;

  void getImage() async {
    final pickerImageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      camaraImage = pickerImageFile;
    });
  }

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);

  GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void submit() async {
    try {
      setState(() {
        _netWorkLodding = true;
      });

      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(result.user.uid)
          .set(
        {
          'userId': result.user.uid,
          'userName': fullName.text,
          'userEmail': email.text,
          'userPassword': password.text,
        },
      );
    } on PlatformException catch (err) {
      var message = 'assar';
      if (err.message != null) {
        message = err.message;
      }
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      setState(() {
        _netWorkLodding = false;
      });
    } catch (erro) {
      setState(() {
        _netWorkLodding = false;
      });

      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            erro,
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
    setState(
      () {
        _netWorkLodding = false;
      },
    );
  }

  void checkValid() {
    if (fullName.text.isEmpty && email.text.isEmpty && password.text.isEmpty) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("All Flied Are Empty"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (fullName.text.length < 6) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (email.text.isEmpty) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (!regex.hasMatch(email.text)) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Please Try Vaild Email"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (password.text.isEmpty) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (password.text.length < 8) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password  Is Too Short"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else {
      submit();
    }
  }

  Widget secoundPart() {
    return Container(
      height: 750,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 540,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SignUpAndLoginTextFeild(
                                name: 'FullName',
                                obscureText: false,
                                controller: fullName,
                              ),
                              SignUpAndLoginTextFeild(
                                name: 'Email',
                                obscureText: false,
                                controller: email,
                              ),
                              SignUpAndLoginTextFeild(
                                name: 'Password',
                                obscureText: true,
                                controller: password,
                              ),
                              SignUpAndLoginTextFeild(
                                name: 'confirmPassword',
                                obscureText: true,
                                controller: confirmPassword,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: thirdPart(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdPart() {
    return Container(
      child: Column(
        children: <Widget>[
          _netWorkLodding == false
              ? Container(
                  width: 110,
                  child: MyRasiedButton(
                    colors: Theme.of(context).accentColor,
                    textColors: Colors.black,
                    buttonText: 'SignUp',
                    whenPrassed: () async {
                      checkValid();
                    },
                  ),
                )
              : CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30.00,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          'i already have an account',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      body: Form(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  secoundPart(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
