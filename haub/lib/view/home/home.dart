//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:haub/view/add_question/question_page.dart';
import 'package:haub/view/chat_screen/chat_screen.dart';
import 'package:haub/view/home/drawer.dart';
import 'package:haub/models/colorPalette.dart';

class MyHomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Future<bool> _alertBeforeClosing() {
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Você tem certeza?'),
          content: new Text('Deseja fechar o aplicativo?'),
          actions: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: Text("Não"),
            ),
            SizedBox(height: 16),
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              child: Text("Sim"),
            ),
          ],
        ),
      ) ??
          false;
    }

    return WillPopScope(
      onWillPop: _alertBeforeClosing,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: ColorPalette.primaryColor,
            title: const Text(
              'Haub',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            
          ),
        ),
        drawer: MyDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("Navegar para o chat"),
                  color: ColorPalette.secondaryColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyChatPage()));
                  }),
              RaisedButton(
                  child: Text("Navegar para o adicionar"),
                  color: ColorPalette.secondaryColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MyQuestionPage()));
                  }),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorPalette.secondaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MyQuestionPage()));
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
          elevation: 2.0,
        ),
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 7.0,
            color: ColorPalette.primaryColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 30, 12, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
              ),
            ))),
    );
  }
}