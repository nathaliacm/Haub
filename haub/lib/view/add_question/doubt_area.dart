import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/duvida.dart';
import 'package:haub/models/dropDownButtomPages.dart';
import 'doubt_level.dart';

class MyQuestionAreaPage extends StatelessWidget {
  final Duvida questionStatus;
  
  MyQuestionAreaPage(this.questionStatus, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropDownPage(['Física','Matemática','Português','História','inglês','Geografia','Química','Sociologia','Filosofia'], 
          "Selecione a área de sua dúvida",
          (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyQuestionLevelPage(questionStatus)));
          },
          "Avançar",
          (String area) => questionStatus.area = area
        ),
    );
  }
}
