import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';

class TextComposer extends StatefulWidget {
  final Function(String) sendMessage;
  
  TextComposer(this.sendMessage);

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;
  final TextEditingController _controller = TextEditingController();
  void _reset() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0,5,5,5),
        child: Row(children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              cursorColor: ColorPalette.secondaryColor,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration.collapsed(
                  hintStyle:
                      TextStyle(color: ColorPalette.placeHolderTextColor),
                  hintText: 'Digite uma mensagem'),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text);
                _reset();
              },
            ),
          ),
          CircleAvatar(
              radius: 19,
              backgroundColor: ColorPalette.secondaryColor,
              child: IconButton(
                icon: Icon(Icons.send, color: Colors.white, size:20),
                onPressed: _isComposing
                    ? () {
                        widget.sendMessage(_controller.text);
                        _reset();
                      }
                    : null,
              )),
        ]));
  }
}
