import 'package:flutter/material.dart';

import 'package:haub/view/home/home.dart';

class MyOnboardPage extends StatelessWidget {
  MyOnboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Haub Onboard'),
      ),
      
      body: Center(
        child: RaisedButton(
          child: Text("Home"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => MaterialApp(
                home:  MyHomePageWidget(),
              )
          ));
        }),
      ));
  }
}
