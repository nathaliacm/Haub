import 'package:flutter/material.dart';
import 'package:haub/models/appBar.dart';

import 'doubt_abstract.dart';

class MyDaubtLevelPage extends StatelessWidget {
  MyDaubtLevelPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CircularAppBar("Haub Question Level", 60, true, 20),
      body: Center(
        child: RaisedButton(
          child: Text("Navegar para abstract page"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => MyDaubtAbstractPage()
          ));
        }),
      ),
    );
  }
}