import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SendMail extends StatefulWidget {
  @override
  _SendMailState createState() => _SendMailState();
}

class _SendMailState extends State<SendMail> {
  final yourName = TextEditingController();
  final yourEmail = TextEditingController();
  final sendYourMessage = TextEditingController();
  GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();

  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regex = RegExp(pattern);

  Widget textField(
      {String name, int maxLines, TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: TextFormField(
        controller: controller,
        maxLengthEnforced: true,
        maxLines: maxLines,
        decoration: InputDecoration(
          fillColor: Theme.of(context).accentColor,
          filled: true,
          hintText: name,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void sendMessage() async {
    await FirebaseFirestore.instance.collection('UserMail').doc().set(
      {
        'userName': yourName.text,
        'userEmail': yourEmail.text,
        'userMessage': sendYourMessage.text,
      },
    );

    sendYourMessage.clear();
    yourEmail.clear();
    yourName.clear();
    myKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Send Your Mail'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void checkValid() {
    if (yourName.text.isEmpty &&
        yourEmail.text.isEmpty &&
        sendYourMessage.text.isEmpty) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("All Flied Are Empty"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (yourName.text.length < 3) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 3 "),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (yourEmail.text.isEmpty) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (!regex.hasMatch(yourEmail.text)) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Please Try Vaild Email"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else {
      sendMessage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkValid();
        },
        child: Icon(Icons.send),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Send Mail',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textField(name: 'Your Name', maxLines: 1, controller: yourName),
              textField(name: 'Your Email', maxLines: 1, controller: yourEmail),
              textField(
                name: 'Send Your Message',
                maxLines: 10,
                controller: sendYourMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
