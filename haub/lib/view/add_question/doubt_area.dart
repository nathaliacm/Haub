import 'package:flutter/material.dart';
import 'package:haub/models/dropDownButtomPages.dart';
import 'doubt_level.dart';

class MyDaubtAreaPage extends StatelessWidget {
  MyDaubtAreaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropDownPage([
        'Física',
        'Matemática',
        'Português',
        'História',
        'inglês',
        'Geográfia',
        'Química',
        'Sociologia',
        'Filosofia'
      ], "Selecione a área de sua dúvida", () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MyDaubtLevelPage()));
      }, "Avançar"),
    );
  }
}
