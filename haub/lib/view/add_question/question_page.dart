import 'package:flutter/material.dart';
import 'package:haub/models/appBar.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/models/raisedButton.dart';
import 'doubt_area.dart';

class MyQuestionPage extends StatelessWidget {
  MyQuestionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CircularAppBar('', 120, true,0),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Qual sua dúvida?", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: "Digite a sua dúvida aqui",
                  labelStyle: TextStyle(color: ColorPalette.textColor),
                  filled: true,
                  fillColor: Colors.grey[300],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                width: 200,
                child: MyRaisedButton((){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyDaubtAreaPage()));},"Avançar")
                ),
            ],
          ),
          padding: EdgeInsets.only(top: 100, right: 20, left: 20),
        ),
      ),
    );
  }
}
