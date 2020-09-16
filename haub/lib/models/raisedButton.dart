import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';

class MyRaisedButton extends StatelessWidget{
  MyRaisedButton(this.click, this.text,[this.item]);
  final Function click;
  final String text;
  final String item;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: click,
      color: ColorPalette.secondaryColor,
      child: Text(text, style: TextStyle(color: Colors.white),),
    );
  }
}