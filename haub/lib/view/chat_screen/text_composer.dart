import 'package:flutter/material.dart';
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
              decoration:
                  InputDecoration.collapsed(hintText: 'Digite uma mensagem'),
              onChanged: (text) {},
              onSubmitted: (text) {},
            ),
          ),
          IconWithBackground(),
        ]));
  }
}
