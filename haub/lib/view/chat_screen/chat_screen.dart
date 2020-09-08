import 'package:flutter/material.dart';

class MyChatPage extends StatelessWidget {
  MyChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Haub chat'),
      ),
      
      body: Center(
        child: Text("Chat screen"),
      ),
    );
  }
}