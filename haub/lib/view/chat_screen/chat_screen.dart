import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';

class MyChatPage extends StatelessWidget {
  MyChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: const Text('Haub chat'),
      ),
      body: Center(
        child: Text("Chat screen"),
      ),
    );
  }
}
