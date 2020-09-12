import 'package:flutter/material.dart';
import 'package:haub/models/appBar.dart';

import 'doubt_level.dart';

class MyDaubtAreaPage extends StatelessWidget {
  MyDaubtAreaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: CircularAppBar("Haub Question área", 60, true, 20),
      body: Center(
        child: RaisedButton(
          child: Text("Navegar para o nivel da dúvida"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) =>  MyDaubtLevelPage()
          ));
        }),
      ),
    );
  }
}