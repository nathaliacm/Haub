import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/duvida.dart';
import 'package:haub/models/appBar.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/models/raisedButton.dart';
import 'package:haub/view/add_question/doubt_area.dart';

class MyQuestionPage extends StatelessWidget {
  MyQuestionPage({Key key}) : super(key: key);

  final Duvida questionStatus = new Duvida();
  final TextEditingController mytextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CircularAppBar('', 120, true, 0),
      body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 100, right: 20, left: 20),
            child: Column(
              children: [

                Container(
                  child: Text("Qual sua dúvida?", style: TextStyle(fontSize: 20)),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom:15),
                ),

                TextField(
                  controller: mytextController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Digite a sua dúvida aqui",
                    labelStyle: TextStyle(color: ColorPalette.textColor),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),
                
                Container(
                    padding: EdgeInsets.only(top: 40),
                    width: 200,           
                    child : MyRaisedButton(() {
                      questionStatus.texto = mytextController.text;
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MyQuestionAreaPage(questionStatus)));
                    }, "Avançar"),
                  ),

              ],
          ),
      ),
    );
  }
}
