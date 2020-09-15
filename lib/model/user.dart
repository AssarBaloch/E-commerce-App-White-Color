import 'package:flutter/material.dart';

class Users {
  final String fullName;
  final String email;
  final String password;
  final String userImage;

  Users({
    @required this.email,
    @required this.fullName,
    @required this.password,
    @required this.userImage,
  });
}
