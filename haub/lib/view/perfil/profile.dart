import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';


class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Haub perfil'),
        backgroundColor: ColorPalette.primaryColor,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Recarregar"),
          color: ColorPalette.secondaryColor,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) =>  MyProfileScreen()
          ));
        }),
      ),
    );
  }
}