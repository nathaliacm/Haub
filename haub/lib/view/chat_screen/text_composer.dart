import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';
import 'icon_with_background.dart';

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: <Widget>[
          Expanded(
            child: TextField(
              cursorColor: ColorPalette.secondaryColor,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration.collapsed(
                  hintStyle:
                      TextStyle(color: ColorPalette.placeHolderTextColor),
                  hintText: 'Digite uma mensagem'),
              onChanged: (text) {},
              onSubmitted: (text) {},
            ),
          ),
          IconWithBackground(),
        ]));
  }
}
