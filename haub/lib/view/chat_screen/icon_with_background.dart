import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';

class IconWithBackground extends StatefulWidget {
  @override
  _IconWithBackgroundState createState() => _IconWithBackgroundState();
}

class _IconWithBackgroundState extends State<IconWithBackground> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 20,
        backgroundColor: ColorPalette.secondaryColor,
        child: IconButton(
            icon: Icon(Icons.send, color: Colors.white), onPressed: () {}));
  }
}
