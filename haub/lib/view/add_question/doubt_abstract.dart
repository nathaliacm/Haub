import 'package:flutter/material.dart';
import 'package:haub/models/appBar.dart';


class MyDaubtAbstractPage extends StatelessWidget {
  MyDaubtAbstractPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CircularAppBar("Haub Question abstract", 60, true, 20),
      body: Center(
        child: RaisedButton(
            child: Text("Finalizar"),
            onPressed: () {
              Navigator.popUntil(
                context, 
                ModalRoute.withName('/home'));
            }),
      ),
    );
  }
}
