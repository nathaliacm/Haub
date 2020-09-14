//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:haub/models/appBar.dart';
import 'package:haub/models/chatPreview.dart';
import 'package:haub/view/add_question/question_page.dart';
import 'package:haub/view/chat_screen/chat_screen.dart';
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

    List<ChatPreview> list = ChatPreview.list;
    return WillPopScope(
        onWillPop: _alertBeforeClosing,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: CircularAppBar('Haub', 100.0, false, 28, BottomTabBar()),
              drawer: MyDrawer(),
              body: TabBarView(children: [
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: list.length,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         title: Text(list[index].name),
                //         subtitle: Row(
                //           children: [
                //             Text(list[index].lastMessage),
                //             // SizedBox(width: 25),
                //             Text(list[index].time)
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        child: Text("chat de Dúvidas"),
                        color: ColorPalette.secondaryColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyChatPage()));
                        }),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        child: Text("chat de mentoria"),
                        color: ColorPalette.secondaryColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyChatPage()));
                        }),
                  ],
                ),
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
                tooltip: 'Increment',
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
