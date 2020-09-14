import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haub/firebase_tools/usuario.dart';
import 'package:haub/models/colorPalette.dart';
import 'text_composer.dart';

class MyChatPage extends StatelessWidget {
  MyChatPage({Key key}) : super(key: key);

  void _sendMessage(String text) {
    FirebaseFirestore.instance.collection('messages').add({
      'sender': Usuario.nome,
      'text': text,
      'timestamp': DateTime.now()
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.primaryColor,
          title: const Text('Haub chat'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('messages').snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        List<DocumentSnapshot> documents =
                          snapshot.data.docs.reversed.toList();
                        return ListView.builder(
                          itemCount: documents.length,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(documents[index].data()['text']),
                            );
                          }
                        );
                    }
                  },
                ),
              ),
              Center(
                  child: Ink(
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          color: ColorPalette.primaryColor),
                      child: TextComposer(_sendMessage)
                  )
                )
            ]
          )
        )
      );
  }
}
