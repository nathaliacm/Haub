import 'package:flutter/material.dart';
import 'package:haub/models/daubtClass.dart';
import 'package:haub/models/dropDownButtomPages.dart';
import 'package:haub/view/add_question/doubt_abstract.dart';

class MyDaubtLevelPage extends StatelessWidget {
  Daubt questionStatus;
  MyDaubtLevelPage(this.questionStatus,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new DropDownPage(['Doutorado', 'Mestrado', 'Graduação', 'Técnico', 'Ensino Médio', 'Ensino Fundamental'], 
          "Selecione o level de sua dúvida",
          (){
            questionStatus.daubtLevel = DropDownState.dropDownSelected;
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyDaubtAbstractPage(questionStatus)));
            }
        ),
    );
  }
}