import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpAndLoginTextFeild extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final bool obscureText;
  final IconData iconData;

  final TextInputType keyborad;
  SignUpAndLoginTextFeild(
      {this.iconData,
      this.name,
      this.obscureText,
      this.keyborad,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        keyboardType: keyborad,
        obscureText: obscureText,
        decoration: InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          icon: Icon(
            iconData,
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          hintText: name,
        ),
      ),
    );
  }
}
