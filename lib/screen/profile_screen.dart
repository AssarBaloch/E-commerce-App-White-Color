import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/user.dart';
import 'package:food_app/provider/myprovider.dart';
import 'package:food_app/widgets/profile.dart';
import 'package:food_app/widgets/profile_edit.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Users user;
  var uid;
  File _camaraImage;

  GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();

  Future<String> _uploadFile(File _camaraImage) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('images/$uid');
    StorageUploadTask uploadTask = storageReference.putFile(_camaraImage);
    StorageTaskSnapshot task = await uploadTask.onComplete;
    final String _imageUrl = (await task.ref.getDownloadURL());

    return _imageUrl;
  }

  var imageMap;

  void checkVerify(password, email, fullName, Users currentUsers) async {
    setState(() {
      edit = false;
    });
    _camaraImage != null
        ? imageMap = await _uploadFile(_camaraImage)
        : Container();
    FirebaseFirestore.instance.collection("Users").doc(uid).update(
      {
        "userImage": _camaraImage == null ? currentUsers.userImage : imageMap,
        "userName": fullName,
        "userEmail": email,
        'userPassword': password,
      },
    );
  }

  void getUserId() async {
    User user = FirebaseAuth.instance.currentUser;
    uid = user.uid;
  }

  Future getImage({ImageSource source}) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      _camaraImage = File(pickedFile.path);
    });
  }

  Widget profileImage({Users currentUser}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(
              90,
              20,
              20,
              20,
            ),
            blurRadius: 8.0,
            offset: Offset(
              9,
              9,
            ),
          ),
        ],
      ),
      child: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 280,
              ),
              child: edit
                  ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          edit = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.save_alt,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          edit = true;
                        });
                      },
                    ),
            ),
            edit == true
                ? trueImage(currentUser: currentUser)
                : falseImage(currentUser: currentUser),
            SizedBox(
              height: 2,
            ),
            Text(
              // user.fullName,/
              currentUser.fullName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '@ ${currentUser.fullName}',
              style: TextStyle(color: Colors.grey[850]),
            ),
          ],
        ),
      ),
    );
  }

  Widget trueImage({Users currentUser}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 45,
          child: GestureDetector(
            onTap: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Choice Your Option'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.camera_alt),
                                  onPressed: () {
                                    getImage(source: ImageSource.camera);
                                  }),
                              Text("From Camera"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.photo_album),
                                  onPressed: () {
                                    getImage(source: ImageSource.gallery);
                                  }),
                              Text(
                                "From Gallery",
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Container(
                            height: 40,
                            width: 60,
                            color: Theme.of(context).primaryColor,
                            child: Center(
                              child: Text(
                                'Ok',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            )),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: _camaraImage == null
                  ? currentUser.userImage == null
                      ? NetworkImage(
                          'https://thumbs.dreamstime.com/b/add-new-user-icon-vector-female-person-profile-avatar-plus-symbol-flat-color-glyph-pictogram-illustration-119707341.jpg',
                        )
                      : NetworkImage(currentUser.userImage)
                  : FileImage(
                      _camaraImage,
                    ),
              radius: 42,
            ),
          ),
        ),
      ],
    );
  }

  Widget falseImage({Users currentUser}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 45,
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: _camaraImage == null
                ? currentUser.userImage == null
                    ? NetworkImage(
                        'https://thumbs.dreamstime.com/b/add-new-user-icon-vector-female-person-profile-avatar-plus-symbol-flat-color-glyph-pictogram-illustration-119707341.jpg',
                      )
                    : NetworkImage(currentUser.userImage)
                : FileImage(
                    _camaraImage,
                  ),
            radius: 42,
          ),
        ),
      ],
    );
  }

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    getUserId();
    MyProvider myProvider = Provider.of<MyProvider>(context);
    myProvider.fetchUserData();
    Users currentUsers = myProvider.getCurrrentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: SingleChildScrollView(
              child: edit == true
                  ? ProfileEdit(
                      myKey: myKey,
                      checkVerify: checkVerify,
                      currentUser: currentUsers,
                    )
                  : Profile(
                      currentUser: currentUsers,
                    ),
            ),
          ),
          Container(
            height: 180,
            color: Colors.white,
          ),
          profileImage(currentUser: currentUsers),
        ],
      ),
    );
  }
}
