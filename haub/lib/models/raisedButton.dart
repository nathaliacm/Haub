import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';

class MyRaisedButton extends StatelessWidget{
  MyRaisedButton(this.click, this.text);
  final Function click;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: click,
      color: ColorPalette.secondaryColor,
      child: Text(text, style: TextStyle(color: Colors.white),),
    );
  }
}