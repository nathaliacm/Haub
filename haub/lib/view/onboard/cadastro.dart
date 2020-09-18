import 'package:flutter/material.dart';
import 'package:haub/models/dropDownButtomPages.dart';

class MyRegisterPage extends StatelessWidget {
  MyRegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: DropDownPage([
        'Física',
        'Matemática',
        'Português',
        'História',
        'inglês',
        'Geografia',
        'Química',
        'Sociologia',
        'Filosofia'
      ],
      "Escolha uma área de domínio",
      () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      "Confirmar",
      null),
    ));
  }
}
