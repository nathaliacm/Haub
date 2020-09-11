import 'package:flutter/material.dart';

import '../../main.dart';

class MyDaubtAbstractPage extends StatelessWidget {
  MyDaubtAbstractPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Haub Question abstract'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Finalizar"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyHomePageWidget()));
            }),
      ),
    );
  }
}
