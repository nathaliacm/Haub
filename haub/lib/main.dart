import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/usuario.dart';
import 'package:haub/view/home/home.dart';
import 'package:haub/view/onboard/cadastro.dart';
import 'package:haub/view/onboard/login.dart';
import 'package:firebase_core/firebase_core.dart';

final Usuario userFinal = new Usuario();

void main() {
  runApp(MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Haub';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return MaterialApp(
          title: _title,
          initialRoute: '/',
          routes: {
            '/': (context) => MyLoginPage(),
            '/home': (context) => MyHomePageWidget(),
            '/cadastro': (context) => MyRegisterPage(),
          },
          //MyHomePageWidget(),
        );
      }
    );
  }
}