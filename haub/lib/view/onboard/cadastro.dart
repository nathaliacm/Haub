import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';

import '../../main.dart';

class MyRegisterPage extends StatelessWidget {
  MyRegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: const Text('Haub Cadastro'),
      ),
      
      body: Center(
        child: RaisedButton(
          color: ColorPalette.secondaryColor,
          child: Text("Cadastro"),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      )
    );
  }
}