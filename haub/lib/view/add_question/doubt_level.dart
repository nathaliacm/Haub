import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/duvida.dart';
import 'package:haub/models/dropDownButtomPages.dart';
import 'package:haub/view/add_question/doubt_abstract.dart';

class MyQuestionLevelPage extends StatelessWidget {
  final Duvida questionStatus;

  MyQuestionLevelPage(this.questionStatus,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new DropDownPage(['Doutorado', 'Mestrado', 'Graduação', 'Técnico', 'Ensino Médio', 'Ensino Fundamental'], 
          "Selecione o level de sua dúvida",
          (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyDaubtAbstractPage(questionStatus)));
          },
          "Avançar",
          (String nivel) => questionStatus.nivel = nivel
        ),
    );
  }
}
