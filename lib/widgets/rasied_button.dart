import 'package:flutter/material.dart';

class MyRasiedButton extends StatefulWidget {
  final String buttonText;
  final Function whenPrassed;
  final Color colors;
  final Color textColors;

  MyRasiedButton(
      {this.textColors, this.colors, this.buttonText, this.whenPrassed});
  @override
  _MyRasiedButtonState createState() => _MyRasiedButtonState();
}

class _MyRasiedButtonState extends State<MyRasiedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        child: Text(
          '${widget.buttonText}',
          style: TextStyle(
              color: widget.textColors,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        color: widget.colors,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: widget.whenPrassed,
      ),
    );
  }
}
