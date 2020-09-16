import 'package:flutter/material.dart';
import 'package:haub/models/appBar.dart';
import 'package:haub/models/raisedButton.dart';

class MyDaubtAbstractPage extends StatelessWidget {
  MyDaubtAbstractPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CircularAppBar(" ", 60, true, 20),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Tudo certo?", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey[300],
                ),
                width: 310,
                height: 180,
                child: Center(
                  child: Text("<Resumo>"),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 40),
                  width: 200,
                  child: MyRaisedButton(() {
                    Navigator.popUntil(context, ModalRoute.withName('/home'));
                  }, "Confirmar")),
            ],
          ),
          padding: EdgeInsets.only(top: 100, right: 20, left: 20),
        ),
      ),
    );
  }
}
