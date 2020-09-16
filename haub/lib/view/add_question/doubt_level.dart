import 'package:flutter/material.dart';
import 'package:haub/models/dropDownButtomPages.dart';
import 'package:haub/view/add_question/doubt_abstract.dart';

class MyDaubtLevelPage extends StatelessWidget {
  MyDaubtLevelPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropDownPage([
        'Doutor',
        'Mestre',
        'Graduado',
        'Técnico',
        'Ensino Médio',
        'Ensino Fundamental'
      ], "Selecione o level de sua dúvida", () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MyDaubtAbstractPage()));
      }, "Avançar"),
    );
  }
}
