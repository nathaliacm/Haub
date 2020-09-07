import 'package:flutter/material.dart';
import 'package:haub/view/add_question/question_page.dart';
import 'package:haub/view/chat_screen/chat_screen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Haub';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,  
      home: MyHomePage(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Haub home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Navegar para o chat"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => MyChatPage()
              ));
            }),

            RaisedButton(
              child: Text("Navegar para o adicionar"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => MyQuestionPage()
              ));
            }),
          ],

        ),
      ),      
    );
  }
}