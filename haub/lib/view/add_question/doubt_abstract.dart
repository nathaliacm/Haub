import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/duvida.dart';
import 'package:haub/models/appBar.dart';
import 'package:haub/models/raisedButton.dart';

class MyDaubtAbstractPage extends StatelessWidget {
  final Duvida questionStatus;

  MyDaubtAbstractPage(this.questionStatus, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CircularAppBar(" ",60, true, 20),
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
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sua duvida:",
                        style: TextStyle(fontSize: 15)),

                        Expanded(
                          child:Scrollbar(
                            child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child:Text("${questionStatus.texto}\n",
                              style: TextStyle(fontSize: 15)),
                            ),
                          ), 
                        ),
                        
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text("A área da sua duvida: ${questionStatus.area}", style: TextStyle(fontSize: 15)),
                        ),
                        Text("O level da sua duvida: ${questionStatus.nivel}", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 40),
                  width: 200,
                  child: MyRaisedButton(() {
                    questionStatus.enviar();
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
