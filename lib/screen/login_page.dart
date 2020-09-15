import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/screen/home_screen.dart';
import 'package:food_app/screen/signup.dart';
import 'package:food_app/widgets/signup_login_textfeild.dart';
import '../widgets/rasied_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _netWorkLodding = false;
  bool isMale = true;

  final _auth = FirebaseAuth.instance;

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);

  UserCredential authResult;

  GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  void submit() async {
    try {
      setState(() {
        _netWorkLodding = true;
      });

      authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on PlatformException catch (err) {
      var message = 'assar';
      if (err.message != null) {
        message = err.message.toString();
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
          backgroundColor: Theme.of(context).errorColor,
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
    if (email.text.isEmpty || email.text.trim() == null) {
      myKey.currentState.showSnackBar(SnackBar(
        content: Text("Email is Empty"),
        duration: Duration(milliseconds: 800),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (password.text.trim() == null || password.text.isEmpty) {
      myKey.currentState.showSnackBar(SnackBar(
        content: Text("Password Is Empty"),
        duration: Duration(milliseconds: 800),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } else if (!regex.hasMatch(email.text)) {
      myKey.currentState.showSnackBar(SnackBar(
        content: Text("Please Try Vaild Email"),
        duration: Duration(milliseconds: 800),
        backgroundColor: Theme.of(context).primaryColor,
      ));
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
                color: Theme.of(context).accentColor,
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
                borderRadius: BorderRadius.circular(8)),
            height: 310,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: thirdPart(),
                        ),
                        Container(
                          height: 20,
                        )
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
                    buttonText: 'Login',
                    whenPrassed: () {
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
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Create new account',
                          style: TextStyle(fontSize: 16, color: Colors.black),
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
