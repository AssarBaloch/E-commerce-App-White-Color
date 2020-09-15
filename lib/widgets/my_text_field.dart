import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final String name;

  final TextEditingController controller;

  final bool obscureText;
  final IconData iconData;

  final TextInputType keyborad;
  MyTextField(
      {this.iconData,
      this.name,
      this.obscureText,
      this.keyborad,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        style: TextStyle(color: Colors.black),
        controller: controller,
        keyboardType: keyborad,
        obscureText: obscureText,
        decoration: InputDecoration(
          counterStyle: TextStyle(color: Colors.black),
          focusColor: Colors.black,
          icon: Icon(
            iconData,
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          hintText: name,
        ),
      ),
    );
  }
}
