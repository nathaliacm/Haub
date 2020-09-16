import 'package:flutter/material.dart';
import 'package:haub/models/daubtClass.dart';
import 'package:haub/models/dropDownButtomPages.dart';
import 'doubt_level.dart';

class MyDaubtAreaPage extends StatelessWidget {
  Daubt questionStatus;
  String areaItem;
  MyDaubtAreaPage(this.questionStatus,{Key key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Container(
      child: DropDownPage(['Física','Matemática','Português','História','inglês','Geografia','Química','Sociologia','Filosofia'], 
          "Selecione a área de sua dúvida",
          (){
            questionStatus.daubtArea = DropDownState.dropDownSelected;
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyDaubtLevelPage(questionStatus)));
            }
        ),
    );
  }
}