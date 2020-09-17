import 'package:flutter/material.dart';
import 'package:haub/models/appBar.dart';
import 'package:haub/view/add_question/question_page.dart';
import 'package:haub/view/home/chatList.dart';
import 'package:haub/view/home/drawer.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/view/home/bottomTabBar.dart';

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
    ChatListView duvidas = ChatListView(true);
    ChatListView naoDuvidas = ChatListView(false);
    return WillPopScope(
        onWillPop: _alertBeforeClosing,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: CircularAppBar('Haub', 100.0, false, 28, BottomTabBar()),
              drawer: MyDrawer(),
              body: TabBarView(children: [
                duvidas,
                naoDuvidas,
              ]),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                backgroundColor: ColorPalette.secondaryColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyQuestionPage()));
                },
                tooltip: 'Nova Dúvida',
                child: Icon(Icons.add),
                elevation: 4.0,
              ),
              bottomNavigationBar: BottomAppBar(
                  shape: CircularNotchedRectangle(),
                  notchMargin: 7.0,
                  color: ColorPalette.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 30, 12, 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ))),
        ));
  }
}
