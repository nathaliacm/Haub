import 'package:flutter/material.dart';
import 'package:haub/view/home/home.dart';
import 'package:haub/view/onboard/cadastro.dart';
import 'package:haub/view/onboard/login.dart';
import 'package:haub/firebase_tools/usuario.dart';

void main() {
  runApp(MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Haub';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Usuario.inicializar(),
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: _title,
          initialRoute: '/',
          routes: {
            '/': (context) => MyLoginPage(),
            '/home': (context) => MyHomePageWidget(),
            '/cadastro': (context) => MyRegisterPage(),
          },
        );
      }
    );
  }
}