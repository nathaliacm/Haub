import 'package:flutter/material.dart';

import 'doubt_area.dart';

class MyQuestionPage extends StatelessWidget {
  MyQuestionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Haub Question add'),
      ),

      body: Center(
        child: RaisedButton(
          child: Text("Navegar para a área da dúvida"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => MyDaubtAreaPage()
          ));
        }),
      ),
    );
  }
}